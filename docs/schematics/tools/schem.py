"""Schematic drawing core: symbols, Manhattan router, draw.io and SVG back ends.

The same geometry model drives both outputs, so the SVG/PDF render and the
editable .drawio page are the same picture.  Non-rectangular symbols are
emitted as inline draw.io stencils built from the identical path data used for
the SVG, so no external shape library is needed and nothing can drift.

Coordinates are in draw.io user units (1 unit = 1 px at 100% zoom), origin top
left, y downwards.
"""

from __future__ import annotations

import base64
import heapq
import html
import urllib.parse
import zlib
from dataclasses import dataclass, field

# --------------------------------------------------------------------------
# house style
# --------------------------------------------------------------------------

INK = "#101418"          # everything structural
DIVIDER = "#7A8699"      # section rules — never a signal
WIRE = "#101418"
CTRL = "#B54708"         # control signals (amber)
STATUS = "#175CD3"       # status / condition signals back to control (blue)
CLKRST = "#667085"       # clock and reset distribution (grey)
ENABLE = "#067647"       # pipeline enables and bubbles (green)
FWDSEL = "#6941C6"       # forwarding selects (violet)
FILL_BLOCK = "#FFFFFF"
FILL_REG = "#F2F4F7"
FILL_MEM = "#F8F5EE"
FILL_TITLE = "#F9FAFB"

F_TITLE = 22
F_BLOCK = 19        # instance / component name inside a box
F_SUB = 13          # the qualifier lines under it
F_PIN = 19          # port names at the box edge — same size as the entity name
F_NET = 10          # tag boxes
F_SIG = 14          # signal names on the wires (per sheet: Sheet.fsig)
HOP = 7             # radius of the semicircular wire hop
F_SMALL = 10
F_HEAD = 15         # section dividers
F_NS = 17           # port names on a top or bottom edge, set horizontally
F_PORT = 15         # the name inside an entity port flag

MONO = "Courier New"
SANS = "Helvetica"

_COL = {"data": "#101418", "ctrl": "#B54708", "status": "#175CD3",
        "clk": "#667085", "en": "#067647", "fwd": "#6941C6",
        "lut": "#6941C6"}

GRID = 8                 # router grid pitch
STUB = 24                # forced perpendicular escape from a pin


def entity_name(label, kind="block"):
    """Schematics name the component, not the instance: drop `inst_i :` and `_i`."""
    if kind in ("pin", "pon", "pdn", "pup", "tagbox"):
        return label
    if " : " in label:
        label = label.split(" : ", 1)[1]
    if label.endswith("_i"):
        label = label[:-2]
    return label


def _w(text, size, mono=False):
    return len(text) * size * (0.602 if mono else 0.52)


# --------------------------------------------------------------------------
# inline draw.io stencils
# --------------------------------------------------------------------------

def _stencil(name, w, h, path, fill=True, closed=True):
    """Build a `shape=stencil(...)` style token from a path description.

    `path` entries are ('m'|'l', x, y) or ('c', x1,y1, x2,y2, x3,y3).
    """
    seg = []
    for op in path:
        if op[0] == "c":
            _, x1, y1, x2, y2, x3, y3 = op
            seg.append(f'<curve x1="{x1:g}" y1="{y1:g}" x2="{x2:g}" y2="{y2:g}" '
                       f'x3="{x3:g}" y3="{y3:g}"/>')
            continue
        kind, x, y = op
        tag = "move" if kind == "m" else "line"
        seg.append(f'<{tag} x="{x:g}" y="{y:g}"/>')
    body = (
        f'<shape name="{name}" h="{h:g}" w="{w:g}" aspect="variable" strokewidth="inherit">'
        f"<connections/><background><path>{''.join(seg)}{'<close/>' if closed else ''}</path></background>"
        f"<foreground>{'<fillstroke/>' if fill else '<stroke/>'}</foreground></shape>"
    )
    quoted = urllib.parse.quote(body, safe="")
    comp = zlib.compressobj(9, zlib.DEFLATED, -15)
    data = comp.compress(quoted.encode()) + comp.flush()
    return "stencil(" + base64.b64encode(data).decode() + ")"


def _svg_path(path, w, h, x0, y0, sx, sy, closed=True):
    out = []
    for op in path:
        if op[0] == "c":
            pts = " ".join(f"{x0 + op[i] * sx:g},{y0 + op[i + 1] * sy:g}" for i in (1, 3, 5))
            out.append("C" + pts)
            continue
        kind, x, y = op
        out.append(("M" if kind == "m" else "L") + f"{x0 + x * sx:g},{y0 + y * sy:g}")
    return " ".join(out) + (" Z" if closed else "")


# --------------------------------------------------------------------------
# primitives
# --------------------------------------------------------------------------

@dataclass
class Pin:
    name: str
    side: str            # 'W' 'E' 'N' 'S'
    frac: float          # 0..1 along that side
    width: int | None = None
    kind: str = "data"   # data | ctrl | status | clk
    label: bool = True   # draw the pin name inside the body
    inset: float = 0     # px the pin point sits inside the bounding box (OR back
                         # curve); negative = outside it (an inversion bubble)


@dataclass
class Sym:
    key: str
    x: float
    y: float
    w: float
    h: float
    kind: str = "block"          # block reg mux op mem gate tri term dot bus
    label: str = ""
    sub: tuple = ()
    pins: dict = field(default_factory=dict)
    fill: str = FILL_BLOCK
    note: str = ""
    rot: bool = False            # tagbox printed bottom-to-top
    hdr: bool | None = None      # force the name into / out of a header strip
    nsh: bool = False            # N/S port names set horizontally, in rows
    fscale: float = 1.0          # the sheet's type scale
    nscale: float = 1.0          # extra scale for a block's own name (print builds)
    subscale: float = 1.0        # extra scale for its sub-lines (print builds)
    tfs: float = 10.0            # tag-box text size
    fpin: float = F_PIN          # side-port name size before fscale (print: = F_NS)
    ui: float = 1.0              # stroke / dot scale (print builds)
    via: float | None = None     # straight-line channel for its own stub
    inner: list = field(default_factory=list)   # extra (text,x,y,size,anchor,color)

    def pin_xy(self, name):
        p = self.pins[name]
        # a mux's top and bottom edges slope in by 22 % of its height: a select
        # pin sits on the slope, so its arrow touches the body
        slope = 0.22 * self.h * p.frac if self.kind == "mux" else 0
        k = p.inset
        if p.side == "W":
            return self.x + k, self.y + self.h * p.frac
        if p.side == "E":
            return self.x + self.w - k, self.y + self.h * p.frac
        if p.side == "N":
            return self.x + self.w * p.frac, self.y + slope + k
        return self.x + self.w * p.frac, self.y + self.h - slope - k

    def pin_dir(self, name):
        return {"W": (-1, 0), "E": (1, 0), "N": (0, -1), "S": (0, 1)}[self.pins[name].side]


@dataclass
class Net:
    name: str
    src: tuple            # (sym, pin)
    dsts: list            # [(sym, pin), ...]
    width: int | None = None
    kind: str = "data"
    label_at: str = "src"     # src | mid | none
    dlabels: list = field(default_factory=list)   # per-destination branch labels
    via: float | None = None  # explicit channel track (y for S/N pins, x for E/W)
    ways: list = field(default_factory=list)  # per-destination explicit waypoints
    dkinds: list = field(default_factory=list)  # per-destination colour class
    tstub: list = field(default_factory=list)   # per-destination entry stub length
    routes: list = field(default_factory=list)   # [[(x,y), ...], ...]
    branch: list = field(default_factory=list)   # route starts at a T, not the pin
    taps: list = field(default_factory=list)     # junction dots


# --------------------------------------------------------------------------
# sheet
# --------------------------------------------------------------------------

class Sheet:
    def __init__(self, number, title, subtitle, w, h, note=""):
        self.number = number
        self.title = title
        self.subtitle = subtitle
        self.w = w
        self.h = h
        self.note = note
        self.syms: list[Sym] = []
        self.nets: list[Net] = []
        self.free = []          # free-standing text  (text,x,y,size,anchor,color,mono,bold)
        self.rects = []         # free-standing rects (x,y,w,h,fill,stroke,dash)
        self.lines = []         # free-standing lines (x0,y0,x1,y1,color,width,dash,arrow)
        self.patches = []       # opaque backing drawn on top of the wire field
        self.margin = 46
        self.fsig = F_SIG
        self.symscale = 1.0
        self.page = None
        # print profile (see kit.print_profile): all default to the screen look
        self.ui = 1.0            # strokes, arrowheads, dots, hops, ticks
        self.fsmall = F_SMALL    # bus-width numbers
        self.ftag = F_NET        # clk / rst tag text
        self.namescale = 1.0     # block names relative to port names
        self.tscale = 1.0        # title block
        self.fnote = 11          # sheet note

    # -- construction ------------------------------------------------------

    def add(self, sym):
        sym.fscale = getattr(self, "symscale", 1.0)
        sym.nscale = getattr(self, "namescale", 1.0)
        sym.subscale = getattr(self, "subscale", 1.0)
        sym.tfs = getattr(self, "ftag", F_NET)
        sym.fpin = getattr(self, "fpin", F_PIN)
        sym.ui = getattr(self, "ui", 1.0)
        self.syms.append(sym)
        return sym

    def text(self, s, x, y, size=F_SMALL, anchor="start", color=INK, mono=False, bold=False):
        self.free.append((s, x, y, size, anchor, color, mono, bold))

    def rect(self, x, y, w, h, fill="none", stroke=INK, dash=False):
        self.rects.append((x, y, w, h, fill, stroke, dash))

    def line(self, x0, y0, x1, y1, color=INK, width=1.2, dash="", arrow=False):
        self.lines.append((x0, y0, x1, y1, color, width, dash, arrow))

    def divider(self, x0, x1, y, label, anchor="start"):
        """Section rule: heavy long-dashed grey line + a large black caption.

        Deliberately unlike any signal so it cannot be misread as one.
        """
        tx = {"start": x0, "middle": (x0 + x1) / 2, "end": x1}[anchor]
        self.line(x0, y, x1, y, DIVIDER, 2.6, "14 9")
        # caption sits on a white patch so it stays readable over a wire field
        wpx = _w(label.upper(), F_HEAD, False) + 22
        bx = {"start": tx - 8, "middle": tx - wpx / 2, "end": tx - wpx + 8}[anchor]
        self.patches.append((bx, y - 30, wpx, 26))
        self.text(label.upper(), tx, y - 11, F_HEAD, anchor, INK, False, True)

    def legend(self, x, y, rows, title="KEY", scale=1.0, cols=1, classic=False):
        """Boxed key.  Each row shows the actual line, not the name of a colour.
        `cols` > 1 sets the entries in that many columns (a flatter box);
        `classic` draws the original fixed-width key of the screen sheets."""
        rh, hd = ((32, 42) if classic else (28, 40))
        rh, hd = rh * scale, hd * scale
        # each column as wide as its longest entry, not wider
        per = -(-len(rows) // cols)
        cw = max(_w(r[4], (F_SMALL + 2) * scale, False) for r in rows) + 118 * scale
        if classic:
            cw = 530 * scale
        w = cw * cols
        h = hd + rh * per
        self.rect(x, y, w, h, "#FFFFFF", INK)
        self.line(x, y + hd - 4, x + w, y + hd - 4, INK, 1.2)
        self.text(title, x + 16 * scale, y + 27 * scale, (F_HEAD + 2) * scale,
                  "start", INK, False, True)
        for i, (kind, color, width, dash, text) in enumerate(rows):
            x0 = x + cw * (i // per)
            cy = y + hd + rh * (i % per) + rh / 2 - 4
            l0, l1, lm, tx = (18, 110, 64, 128) if classic else (16, 84, 50, 98)
            self.line(x0 + l0 * scale, cy, x0 + l1 * scale, cy, color, width, dash,
                      kind == "arrow")
            if kind == "dot":
                self.syms.append(Sym(f"lgd{x:.0f}{i}", x0 + lm * scale, cy, 0, 0, "dot"))
            elif kind == "cross":
                self.line(x0 + lm * scale, cy - 15 * scale, x0 + lm * scale,
                          cy + 15 * scale, color, width, dash)
            self.text(text, x0 + tx * scale, cy + 5 * scale, (F_SMALL + 2) * scale,
                      "start", INK)
        return h

    def block(self, key, x, y, w, h, label, sub=(), pins=(), fill=FILL_BLOCK, kind="block"):
        pd = {p.name: p for p in pins}
        return self.add(Sym(key, x, y, w, h, kind, entity_name(label, kind),
                            tuple(sub), pd, fill))

    def net(self, name, src, dsts, width=None, kind="data", label_at="src",
            via=None, dlabels=(), ways=(), dkinds=(), tstub=()):
        if not isinstance(dsts, list):
            dsts = [dsts]
        n = Net(name, src, dsts, width, kind, label_at, via=via,
                dlabels=list(dlabels), ways=[list(w) if w else None for w in ways],
                dkinds=list(dkinds), tstub=list(tstub))
        self.nets.append(n)
        return n

    # -- routing -----------------------------------------------------------

    def route(self):
        gw = int(self.w // GRID) + 2
        gh = int(self.h // GRID) + 2
        blocked = bytearray(gw * gh)
        used = bytearray(gw * gh)

        def mark(sym, pad=1):
            x0 = int((sym.x) // GRID) - pad
            x1 = int((sym.x + sym.w) // GRID) + pad
            y0 = int((sym.y) // GRID) - pad
            y1 = int((sym.y + sym.h) // GRID) + pad
            for gy in range(max(0, y0), min(gh, y1 + 1)):
                for gx in range(max(0, x0), min(gw, x1 + 1)):
                    blocked[gy * gw + gx] = 1

        for s in self.syms:
            if s.kind not in ("dot", "term"):
                mark(s, 1)

        def snap(x, y):
            return int(round(x / GRID)), int(round(y / GRID))

        def escape(sym, pin):
            """start/end cell after the forced perpendicular stub"""
            px, py = sym.pin_xy(pin)
            dx, dy = sym.pin_dir(pin)
            ex, ey = px + dx * STUB, py + dy * STUB
            return (px, py), snap(ex, ey)

        # clear the escape corridors so pins are always reachable
        for n in self.nets:
            for sym, pin in [n.src] + n.dsts:
                px, py = sym.pin_xy(pin)
                dx, dy = sym.pin_dir(pin)
                for t in range(0, STUB + GRID, GRID):
                    gx, gy = snap(px + dx * t, py + dy * t)
                    if 0 <= gx < gw and 0 <= gy < gh:
                        blocked[gy * gw + gx] = 0

        TURN, SHARE = 14, 26

        def astar(starts, goal, ownfree):
            """starts: list of (cell, incoming-direction). ownfree: set of cells free to reuse."""
            gx1, gy1 = goal
            openh = []
            best = {}
            for cell, d in starts:
                st = (cell, d)
                best[st] = 0
                heapq.heappush(openh, (abs(cell[0] - gx1) + abs(cell[1] - gy1), 0, st, None))
            came = {}
            while openh:
                _, g, st, par = heapq.heappop(openh)
                if st in came:
                    continue
                came[st] = par
                (cx, cy), cd = st
                if (cx, cy) == goal:
                    path = []
                    s = st
                    while s is not None:
                        path.append(s[0])
                        s = came[s]
                    return path[::-1]
                for d, (dx, dy) in enumerate(((1, 0), (-1, 0), (0, 1), (0, -1))):
                    nx, ny = cx + dx, cy + dy
                    if not (0 <= nx < gw and 0 <= ny < gh):
                        continue
                    i = ny * gw + nx
                    if blocked[i] and (nx, ny) != goal:
                        continue
                    c = g + GRID
                    if cd is not None and d != cd:
                        c += TURN
                    if used[i] and (nx, ny) not in ownfree:
                        c += SHARE
                    ns = ((nx, ny), d)
                    if ns in came:
                        continue
                    if best.get(ns, 1e18) <= c:
                        continue
                    best[ns] = c
                    heapq.heappush(openh, (c + abs(nx - gx1) + abs(ny - gy1), c, ns, st))
            return None

        order = sorted(
            range(len(self.nets)),
            key=lambda i: min(
                abs(self.nets[i].src[0].pin_xy(self.nets[i].src[1])[0] - d[0].pin_xy(d[1])[0])
                + abs(self.nets[i].src[0].pin_xy(self.nets[i].src[1])[1] - d[0].pin_xy(d[1])[1])
                for d in self.nets[i].dsts
            ),
        )

        self._boxes = [(s.x, s.y, s.x + s.w, s.y + s.h) for s in self.syms
                       if s.kind not in ('dot', 'bub')]
        for i in order:
            n = self.nets[i]
            if n.via is not None:
                sx, sy = n.src[0].pin_xy(n.src[1])
                sdx, sdy = n.src[0].pin_dir(n.src[1])
                for j, (dsym, dpin) in enumerate(n.dsts):
                    tx, ty = dsym.pin_xy(dpin)
                    tdx, tdy = dsym.pin_dir(dpin)
                    if sdy:
                        pts = [(sx, sy), (sx, n.via), (tx, n.via), (tx, ty)]
                    else:
                        pts = [(sx, sy), (n.via, sy), (n.via, ty), (tx, ty)]
                    n.routes.append(_dedup(pts))
                    n.branch.append(False)
                    if sdy:
                        gy = int(round(n.via / GRID))
                        for gx in range(int(min(sx, tx) // GRID),
                                        int(max(sx, tx) // GRID) + 1):
                            if 0 <= gx < gw and 0 <= gy < gh:
                                used[gy * gw + gx] = 1
                    if j:
                        n.taps.append((tx if sdy else n.via, n.via if sdy else ty))
                continue
            if n.ways:
                # hand-routed: the sheet gives the corner points itself.  The
                # first waypoint of a branch is its junction on the trunk.
                sx, sy = n.src[0].pin_xy(n.src[1])
                sdx, sdy = n.src[0].pin_dir(n.src[1])
                for j, (dsym, dpin) in enumerate(n.dsts):
                    w = n.ways[j] if j < len(n.ways) else None
                    if w is None:
                        w = []
                    tx, ty = dsym.pin_xy(dpin)
                    tdx, tdy = dsym.pin_dir(dpin)
                    st = n.tstub[j] if j < len(n.tstub) and n.tstub[j] else STUB
                    head = ([(sx, sy), (sx + sdx * STUB, sy + sdy * STUB)]
                            if j == 0 else [])
                    tail = [(tx + tdx * st, ty + tdy * st), (tx, ty)]
                    pts = _dedup(_orthogonalise(head + [tuple(q) for q in w] + tail,
                                                head, tail))
                    n.routes.append(pts)
                    n.branch.append(j > 0)
                    if j > 0 and w:
                        n.taps.append((round(w[0][0], 3), round(w[0][1], 3)))
                continue
            (spx, spy), scell = escape(*n.src)
            sdx, sdy = n.src[0].pin_dir(n.src[1])
            sd = {(1, 0): 0, (-1, 0): 1, (0, 1): 2, (0, -1): 3}[(sdx, sdy)]
            tree = {scell}
            for dsym, dpin in n.dsts:
                (tpx, tpy), tcell = escape(dsym, dpin)
                starts = [(c, None) for c in tree] if len(tree) > 1 else [(scell, sd)]
                cells = astar(starts, tcell, tree)
                if cells is None:
                    cells = [scell, tcell]
                sdx2, sdy2 = n.src[0].pin_dir(n.src[1])
                tdx, tdy = dsym.pin_dir(dpin)
                first = not n.routes
                head = ([(spx, spy), (spx + sdx2 * STUB, spy + sdy2 * STUB)]
                        if first else [])
                tail = [(tpx + tdx * STUB, tpy + tdy * STUB), (tpx, tpy)]
                mid = [(c[0] * GRID, c[1] * GRID) for c in cells]
                pts = _dedup(_orthogonalise(head + mid + tail, head, tail))
                n.routes.append(pts)
                n.branch.append(not first)
                if not first and cells:
                    n.taps.append((cells[0][0] * GRID, cells[0][1] * GRID))
                for c in cells:
                    used[c[1] * gw + c[0]] = 1
                    tree.add(c)

    def _hops(self):
        """Where a horizontal run of one net crosses a vertical run of another.

        Returns {(net-id, route-index): {segment-index: [x, ...]}}.  Only the
        horizontal wire hops, the usual drafting convention, so a crossing is
        never mistaken for a junction.  draw.io has no mid-edge arc, so this is
        applied in the SVG/PDF only and the underlying polyline is untouched.
        """
        hs, vs = [], []
        for n in self.nets:
            for r, pts in enumerate(n.routes):
                for i in range(len(pts) - 1):
                    (x0, y0), (x1, y1) = pts[i], pts[i + 1]
                    if y0 == y1 and x0 != x1:
                        hs.append((id(n), r, i, min(x0, x1), max(x0, x1), y0))
                    elif x0 == x1 and y0 != y1:
                        vs.append((id(n), min(y0, y1), max(y0, y1), x0))
        out = {}
        hop = HOP * self.ui
        pad = hop + 3
        for (nid, r, i, xa, xb, y) in hs:
            for (vid, ya, yb, x) in vs:
                if vid == nid:
                    continue
                if not (ya < y - 0.5 and y < yb - 0.5):
                    continue
                if not (xa + pad < x < xb - pad):
                    continue
                out.setdefault((nid, r), {}).setdefault(i, []).append(x)
        for d in out.values():
            for k in d:
                xs = sorted(set(d[k]))
                keep = []
                for x in xs:
                    if not keep or x - keep[-1] > 2 * hop + 2:
                        keep.append(x)
                d[k] = keep
        return out

    # -- back ends ---------------------------------------------------------

    def _frame(self):
        m = self.margin
        out = [(m * 0.4, m * 0.4, self.w - 0.8 * m, self.h - 0.8 * m, "none", INK, False)]
        return out

    def title_box(self):
        """(x, y, w, h) of the title block"""
        m, t = self.margin, self.tscale
        bw, bh = 520 * t, 66 * t
        return self.w - 0.4 * m - bw, self.h - 0.4 * m - bh, bw, bh

    def _titleblock(self):
        t = self.tscale
        bx, by, bw, bh = self.title_box()
        items = [(bx, by, bw, bh, FILL_TITLE, INK, False),
                 (bx, by, 74 * t, bh, FILL_TITLE, INK, False)]
        txt = [
            (self.number, bx + 37 * t, by + bh / 2 + 7 * t, 20 * t, "middle", INK, False, True),
            (self.title, bx + 88 * t, by + 25 * t, 13 * t, "start", INK, False, True),
            (self.subtitle, bx + 88 * t, by + 44 * t, 9.5 * t, "start", "#475467", True, False),
            ("Radix-4 Booth multiplier  ·  RTL schematics", bx + bw - 12 * t, by + 58 * t, 8 * t, "end",
             "#98A2B3", False, False),
        ]
        return items, txt

    def to_svg(self, path):
        o = []
        o.append(
            f'<svg xmlns="http://www.w3.org/2000/svg" width="{self.w}" height="{self.h}" '
            f'viewBox="0 0 {self.w} {self.h}" font-family="{SANS}">'
        )
        o.append(f'<rect width="{self.w}" height="{self.h}" fill="#FFFFFF"/>')

        def R(x, y, w, h, fill, stroke, dash=False, sw=1):
            d = ' stroke-dasharray="5 4"' if dash else ""
            o.append(f'<rect x="{x:g}" y="{y:g}" width="{w:g}" height="{h:g}" fill="{fill}" '
                     f'stroke="{stroke}" stroke-width="{sw}"{d}/>')

        def T(s, x, y, size, anchor="start", color=INK, mono=False, bold=False):
            a = {"start": "start", "middle": "middle", "end": "end"}[anchor]
            f = MONO if mono else SANS
            b = ' font-weight="600"' if bold else ""
            o.append(f'<text x="{x:g}" y="{y:g}" font-size="{size:g}" font-family="{f}" '
                     f'text-anchor="{a}" fill="{color}"{b}>{html.escape(s)}</text>')

        for r in self._frame():
            R(*r[:6], r[6], 1.2)
        for (x, y, w, h, fill, stroke, dash) in self.rects:
            R(x, y, w, h, fill, stroke, dash)
        for (x0, y0, x1, y1, col, wd, dash, arw) in self.lines:
            d = f' stroke-dasharray="{dash}"' if dash else ""
            o.append(f'<path d="M{x0:g},{y0:g} L{x1:g},{y1:g}" stroke="{col}" '
                     f'stroke-width="{wd:g}" fill="none"{d}/>')
            if arw:
                o.append(_arrow_svg(x0, y0, x1, y1, col))

        # wires first, symbols on top.  A horizontal run hops over any
        # vertical run of another net that it merely crosses.
        hops = self._hops()
        ui = self.ui
        for n in self.nets:
            sw = (2.0 if (n.width or 1) > 1 else 1.1) * ui
            for r, pts in enumerate(n.routes):
                col = _COL[_rkind(n, r)]
                d = _wire_path(pts, hops.get((id(n), r), {}), HOP * ui)
                o.append(f'<path d="{d}" fill="none" stroke="{col}" stroke-width="{sw}" '
                         f'stroke-linejoin="miter"/>')
                ax, ay = pts[-1]
                bx, by = pts[-2]
                if n.dsts[r][0].kind != "dot":      # a bus ending in a junction
                    o.append(_arrow_svg(bx, by, ax, ay, col, ui))


        recs = self._plan_labels()
        for n in self.nets:
            col = _COL[_rkind(n, 0)]
            for (tx, ty) in n.taps:
                o.append(f'<circle cx="{tx:g}" cy="{ty:g}" r="{3.8 * ui:g}" fill="{col}"/>')
            if n.width and n.width > 1 and n.routes:
                _slash(o, n.routes[0], n.width, col, T, self.fsmall, ui)
            for k, lab in enumerate(n.dlabels):
                if not isinstance(lab, str) and lab and k < len(n.routes):
                    _slash(o, n.routes[k], lab[1], col, T, self.fsmall, ui)
        for (txt, lx, ly, anchor, col) in recs:
            T(txt, lx, ly, self.fsig, anchor, col, True)

        for s in self.syms:
            _svg_sym(s, o, R, T)

        tb, tt = self._titleblock()
        for r in tb:
            R(*r[:6], r[6], 1.2)
        for t in tt:
            T(*t)
        if self.note:
            T(self.note, self.margin * 0.4 + 10, self.h - self.margin * 0.4 - 12, self.fnote,
              "start", "#475467")
        for (px, py, pw, ph) in self.patches:
            o.append(f'<rect x="{px:g}" y="{py:g}" width="{pw:g}" height="{ph:g}" '
                     f'fill="#FFFFFF"/>')
        for t in self.free:
            T(*t)
        o.append("</svg>")
        open(path, "w", encoding="utf-8").write("\n".join(o))

    def _plan_labels(self):
        """Pick a clear, always-horizontal spot for every wire label.

        Returns a list of (text, x, y, anchor, colour) records.  A label sits
        above a horizontal run where one is long enough, otherwise beside a
        vertical run — never rotated, so every name reads left to right.
        """
        taken = list(getattr(self, "_boxes", []))
        taken += [(x, y, x + w, y + h) for (x, y, w, h, *_r) in self.rects]
        tbx, tby, tbw, tbh = self.title_box()
        taken.append((tbx, tby, tbx + tbw, tby + tbh))
        fs = self.fsig
        recs = []
        self._label_fallbacks = []
        # the bus-width numbers at the slash ticks are text too
        for n in self.nets:
            marks = [(n.routes[0], n.width)] if (n.width and n.width > 1 and n.routes) else []
            for k, lab in enumerate(n.dlabels):
                if not isinstance(lab, str) and lab and k < len(n.routes):
                    marks.append((n.routes[k], lab[1]))
            for pts, wd in marks:
                (x0, y0), (x1, y1) = pts[0], pts[1]
                t = min(18 * self.ui, (abs(x1 - x0) + abs(y1 - y0)) * 0.5) or 10
                fsm = self.fsmall
                tw = len(str(wd)) * fsm * 0.62
                if y0 == y1:
                    cx = x0 + (t if x1 > x0 else -t)
                    taken.append((cx - 6, y0 - 8 - fsm, cx + 8 + tw + 0.4 * fsm, y0 + 6))
                else:
                    cy = y0 + (t if y1 > y0 else -t)
                    taken.append((x0 - 6, cy - 6 - fsm, x0 + 9 + tw, cy + 6))
        # a name must not land on a wire, or on the hop drawn over one
        hops = self._hops()
        segs = []
        for n in self.nets:
            for r, pts in enumerate(n.routes):
                hp = hops.get((id(n), r), {})
                for i in range(len(pts) - 1):
                    (x0, y0), (x1, y1) = pts[i], pts[i + 1]
                    up = HOP * self.ui + 2 if i in hp else 0
                    segs.append((id(n), min(x0, x1) - 3, min(y0, y1) - 3 - up,
                                 max(x0, x1) + 3, max(y0, y1) + 3))

        def place(text, pts_list, col, nn=()):
            if not text or not pts_list:
                return
            wpx = _w(text, fs, True)
            cands = []
            for r, pts in enumerate(pts_list):
                for i in range(len(pts) - 1):
                    (x0, y0), (x1, y1) = pts[i], pts[i + 1]
                    L = abs(x1 - x0) + abs(y1 - y0)
                    if L < 34:
                        continue
                    horiz = y0 == y1
                    need = wpx + 14 if horiz else fs + 10
                    if L < need:
                        continue
                    for f in (0.5, 0.36, 0.64, 0.22, 0.78):
                        cands.append((0 if horiz else 1, -L, r, horiz,
                                      x0 + (x1 - x0) * f, y0 + (y1 - y0) * f))
                    if horiz:
                        # packed toward either end: just past the width tag at
                        # the source, or just short of the arrow at the far end
                        sg = 1 if x1 > x0 else -1
                        tag = 18 * self.ui + 14 + 2.4 * self.fsmall * 0.62 + 6
                        for d in (tag + wpx / 2 + 6, L - wpx / 2 - 10):
                            if wpx / 2 < d < L - wpx / 2:
                                cands.append((0, -L, r, True, x0 + sg * d, y0))
            cands.sort(key=lambda c: (c[0], c[1], c[2]))
            def opts(horiz, cx, cy):
                if horiz:      # above the run first, then below it
                    return [((cx - wpx / 2 - 4, cy - fs - 6, cx + wpx / 2 + 4, cy - 2),
                             (text, cx, cy - 6, "middle", col)),
                            ((cx - wpx / 2 - 4, cy + 3, cx + wpx / 2 + 4, cy + fs + 7),
                             (text, cx, cy + fs + 3, "middle", col))]
                return [((cx + 6, cy - fs * 0.72, cx + 12 + wpx, cy + fs * 0.52),
                         (text, cx + 9, cy + fs * 0.36, "start", col)),
                        ((cx - 12 - wpx, cy - fs * 0.72, cx - 6, cy + fs * 0.52),
                         (text, cx - 9, cy + fs * 0.36, "end", col))]

            own = id(nn[0]) if nn else None
            # second pass: slide along every horizontal run long enough
            slide = []
            for pts in pts_list:
                for i in range(len(pts) - 1):
                    (x0, y0), (x1, y1) = pts[i], pts[i + 1]
                    if y0 != y1 or abs(x1 - x0) < wpx + 14:
                        continue
                    lo, hi = min(x0, x1) + wpx / 2 + 6, max(x0, x1) - wpx / 2 - 6
                    n_ = int((hi - lo) // 24)
                    slide += [(0, 0, 0, True, lo + (hi - lo) * j / max(n_, 1), y0)
                              for j in range(n_ + 1)]
            for _pref, _L, _r, horiz, cx, cy in cands + slide:
                for box, rec in opts(horiz, cx, cy):
                    if any(not (box[2] < b[0] or box[0] > b[2] or
                                box[3] < b[1] or box[1] > b[3]) for b in taken):
                        continue
                    # its own net may pass only along the label (horizontally)
                    if any((nid != own or y1 - y0 > x1 - x0) and
                           not (box[2] < x0 or box[0] > x1 or
                                box[3] < y0 or box[1] > y1)
                           for nid, x0, y0, x1, y1 in segs):
                        continue
                    taken.append(box)
                    recs.append(rec)
                    return
            self._label_fallbacks.append(text)   # no clear spot: lint reports it
            x, y, h = _label_spot(pts_list[0])
            if h:
                recs.append((text, x, y - 6, "middle", col))
            else:
                recs.append((text, x + 9, y + fs * 0.36, "start", col))

        for n in self.nets:
            col = _COL[_rkind(n, 0)]
            if n.label_at != "none" and n.name and n.routes:
                trunk = n.routes if not n.dlabels else n.routes[:1]
                place(n.name, trunk, col, (n,))
            for k, lab in enumerate(n.dlabels):
                if lab and k < len(n.routes):
                    place(lab if isinstance(lab, str) else lab[0],
                          [n.routes[k]], _COL[_rkind(n, k)], (n,))
        self._labels = recs
        self._labelboxes = taken
        return recs

    # -- draw.io -----------------------------------------------------------

    def to_drawio(self, path, pagename=None):
        cells = []
        nid = [2]

        def new():
            nid[0] += 1
            return f"n{nid[0]}"

        def cell(style, value, x, y, w, h, parent="1", vertex=True):
            i = new()
            cells.append(
                f'<mxCell id="{i}" value="{html.escape(value)}" style="{style}" vertex="1" parent="{parent}">'
                f'<mxGeometry x="{x:g}" y="{y:g}" width="{w:g}" height="{h:g}" as="geometry"/></mxCell>'
            )
            return i

        def textcell(s, x, y, size, anchor="start", color=INK, mono=False, bold=False):
            al = {"start": "left", "middle": "center", "end": "right"}[anchor]
            wpx = _w(s, size, mono) + 12
            ox = {"start": 0, "middle": -wpx / 2, "end": -wpx}[anchor]
            st = (f"text;html=1;strokeColor=none;fillColor=none;align={al};verticalAlign=middle;"
                  f"fontSize={size:g};fontColor={color};fontFamily={MONO if mono else SANS};"
                  f"{'fontStyle=1;' if bold else ''}resizable=0;")
            cell(st, s, x + ox, y - size, wpx, size + 6)

        for (x, y, w, h, fill, stroke, dash) in self._frame() + self.rects:
            st = (f"rounded=0;html=1;fillColor={fill};strokeColor={stroke};"
                  f"{'dashed=1;' if dash else 'dashed=0;'}strokeWidth=1.2;")
            cell(st, "", x, y, w, h)

        for (x0, y0, x1, y1, col, wd, dash, arw) in self.lines:
            st = (f"endArrow={'blockThin;endFill=1;endSize=6' if arw else 'none'};"
                  f"html=1;rounded=0;strokeColor={col};strokeWidth={wd:g};"
                  + (f"dashed=1;dashPattern={dash.replace(' ', ' ')};" if dash else "dashed=0;"))
            i = new()
            cells.append(
                f'<mxCell id="{i}" value="" style="{st}" edge="1" parent="1">'
                f'<mxGeometry relative="1" as="geometry">'
                f'<mxPoint x="{x0:g}" y="{y0:g}" as="sourcePoint"/>'
                f'<mxPoint x="{x1:g}" y="{y1:g}" as="targetPoint"/>'
                f"</mxGeometry></mxCell>")

        symid = {}
        for s in self.syms:
            symid[s.key] = _drawio_sym(s, cell, textcell)

        for n in self.nets:
            sw = round((2 if (n.width or 1) > 1 else 1) * self.ui, 2)
            for k, pts in enumerate(n.routes):
                col = _COL[_rkind(n, k)]
                src = n.src[0]
                dst = n.dsts[k][0]
                dp = dst.pins[n.dsts[k][1]]
                nx, ny, ndx, ndy = _exit_off(dst, n.dsts[k][1])
                isbranch = n.branch[k] if k < len(n.branch) else False
                way = "".join(f'<mxPoint x="{x:g}" y="{y:g}"/>' for x, y in pts[1:-1])
                st = (f"edgeStyle=none;html=1;rounded=0;strokeColor={col};strokeWidth={sw};"
                      f"jumpStyle=arc;jumpSize=12;"
                      + ("endArrow=none;" if dst.kind == "dot" else
                         f"endArrow=blockThin;endFill=1;endSize={6 * self.ui:g};") +
                      f"entryX={nx};entryY={ny};entryDx={ndx:g};entryDy={ndy:g};"
                      f"fontSize={self.fsig};fontFamily={MONO};fontColor={col};")
                geo = f'<Array as="points">{way}</Array>'
                if isbranch:
                    # starts on the trunk of its own net: float the tail so
                    # draw.io cannot re-route it back to the driving pin
                    sx0, sy0 = pts[0]
                    geo = (f'<mxPoint x="{sx0:g}" y="{sy0:g}" as="sourcePoint"/>' + geo)
                    attach = ""
                else:
                    ex, ey, edx, edy = _exit_off(src, n.src[1])
                    st += f"exitX={ex};exitY={ey};exitDx={edx:g};exitDy={edy:g};"
                    attach = f'source="{symid[src.key]}" '
                i = new()
                cells.append(
                    f'<mxCell id="{i}" value="" style="{st}" edge="1" parent="1" '
                    f'{attach}target="{symid[dst.key]}">'
                    f'<mxGeometry relative="1" as="geometry">{geo}</mxGeometry></mxCell>'
                )

        recs = getattr(self, "_labels", None) or self._plan_labels()
        for n in self.nets:
            col = _COL[_rkind(n, 0)]
            for (tx, ty) in n.taps:
                r_ = 3.8 * self.ui
                cell(f"ellipse;html=1;fillColor={col};strokeColor={col};", "",
                     tx - r_, ty - r_, 2 * r_, 2 * r_)
            marks = [(n.routes[0], n.width)] if (n.width and n.width > 1 and n.routes) else []
            for k, lab in enumerate(n.dlabels):
                if not isinstance(lab, str) and lab and k < len(n.routes):
                    marks.append((n.routes[k], lab[1]))
            for pts, wd in marks:
                (x0, y0), (x1, y1) = pts[0], pts[1]
                t = min(18, (abs(x1 - x0) + abs(y1 - y0)) * 0.5) or 10
                if y0 == y1:
                    cx, cy = x0 + (t if x1 > x0 else -t), y0
                else:
                    cx, cy = x0, y0 + (t if y1 > y0 else -t)
                textcell("/" + str(wd), cx + 6, cy - 7, self.fsmall, "start", col, True)
        for (txt, lx, ly, anchor, col) in recs:
            textcell(txt, lx, ly, self.fsig, anchor, col, True)

        tb, tt = self._titleblock()
        for (x, y, w, h, fill, stroke, dash) in tb:
            cell(f"rounded=0;html=1;fillColor={fill};strokeColor={stroke};strokeWidth=1.2;",
                 "", x, y, w, h)
        for t in tt:
            textcell(*t)
        if self.note:
            textcell(self.note, self.margin * 0.4 + 10, self.h - self.margin * 0.4 - 12,
                     self.fnote, "start", "#475467")
        for (px, py, pw, ph) in self.patches:
            cell("rounded=0;html=1;fillColor=#FFFFFF;strokeColor=none;", "",
                 px, py, pw, ph)
        for t in self.free:
            textcell(*t)

        name = html.escape(pagename or f"{self.number} {self.title}")
        xml = (
            f'<mxfile host="booth-schem" type="device">'
            f'<diagram id="p{self.number}" name="{name}">'
            f'<mxGraphModel dx="1400" dy="900" grid="1" gridSize="10" guides="1" tooltips="1" '
            f'connect="1" arrows="1" fold="1" page="1" pageScale="1" '
            f'pageWidth="{int(self.w)}" pageHeight="{int(self.h)}" math="0" shadow="0">'
            f'<root><mxCell id="0"/><mxCell id="1" parent="0"/>'
            + "".join(cells)
            + "</root></mxGraphModel></diagram></mxfile>"
        )
        open(path, "w", encoding="utf-8").write(xml)
        return xml


# --------------------------------------------------------------------------
# helpers
# --------------------------------------------------------------------------

def _exit(p):
    return {"W": (0, p.frac), "E": (1, p.frac), "N": (p.frac, 0), "S": (p.frac, 1)}[p.side]


def _exit_off(sym, name):
    """draw.io connection point: edge fraction plus the px offset to the real pin
    (a mux select on its sloped edge, a gate input on the OR's curved back)."""
    fx, fy = _exit(sym.pins[name])
    px, py = sym.pin_xy(name)
    return fx, fy, px - (sym.x + sym.w * fx), py - (sym.y + sym.h * fy)


def _orthogonalise(pts, head=(), tail=()):
    """Insert corners so every segment is axis aligned.

    The forced stubs at each end keep their direction: a corner introduced next
    to them is placed so the wire still leaves and enters its pin square on.
    """
    out = [pts[0]]
    n = len(pts)
    for i, (x, y) in enumerate(pts[1:], 1):
        px, py = out[-1]
        if x != px and y != py:
            # keep the stub segments straight
            if i == 1 and head:
                horiz = head[0][1] == head[1][1]
            elif i >= n - 1 and tail:
                horiz = tail[0][1] != tail[1][1]
            else:
                horiz = True
            out.append((x, py) if horiz else (px, y))
        out.append((x, y))
    return out


def _dedup(pts):
    # float noise from computed pin positions must not leave zero-length jogs
    pts = [(round(x, 3), round(y, 3)) for x, y in pts]
    out = [pts[0]]
    for p in pts[1:]:
        if p != out[-1]:
            out.append(p)
    res = [out[0]]
    for i in range(1, len(out) - 1):
        ax, ay = res[-1]
        bx, by = out[i]
        cx, cy = out[i + 1]
        if (ax == bx == cx) or (ay == by == cy):
            continue
        res.append((bx, by))
    res.append(out[-1])
    return res


def _wire_path(pts, hops, HOP=HOP):
    """SVG path for one route, with a semicircular hop at each crossing."""
    d = [f"M{pts[0][0]:g},{pts[0][1]:g}"]
    for i in range(len(pts) - 1):
        (x0, y0), (x1, y1) = pts[i], pts[i + 1]
        xs = hops.get(i)
        if xs and y0 == y1:
            right = x1 > x0
            for x in (xs if right else sorted(xs, reverse=True)):
                a, b = (x - HOP, x + HOP) if right else (x + HOP, x - HOP)
                sweep = 1 if right else 0
                d.append(f"L{a:g},{y0:g}")
                d.append(f"A{HOP},{HOP} 0 0 {sweep} {b:g},{y0:g}")
        d.append(f"L{x1:g},{y1:g}")
    return " ".join(d)


def _label_spot(pts):
    best, bl, bh = None, -1, True
    for i in range(len(pts) - 1):
        (x0, y0), (x1, y1) = pts[i], pts[i + 1]
        L = abs(x1 - x0) + abs(y1 - y0)
        if L > bl:
            bl, best, bh = L, ((x0 + x1) / 2, (y0 + y1) / 2), y0 == y1
    return best[0], best[1], bh


def _slash(o, pts, width, col, T, fs=F_SMALL, ui=1.0):
    (x0, y0), (x1, y1) = pts[0], pts[1]
    t = min(18 * ui, (abs(x1 - x0) + abs(y1 - y0)) * 0.5) or 10
    a, b = 4 * ui, 5 * ui
    if y0 == y1:
        cx, cy = x0 + (t if x1 > x0 else -t), y0
        o.append(f'<path d="M{cx-a:g},{cy+b:g} L{cx+a:g},{cy-b:g}" stroke="{col}" '
                 f'stroke-width="{1.2 * ui:g}"/>')
        T(str(width), cx + 6 * ui, cy - 7 * ui, fs, "start", col, True)
    else:
        cx, cy = x0, y0 + (t if y1 > y0 else -t)
        o.append(f'<path d="M{cx-b:g},{cy+a:g} L{cx+b:g},{cy-a:g}" stroke="{col}" '
                 f'stroke-width="{1.2 * ui:g}"/>')
        T(str(width), cx + 7 * ui, cy - 5 * ui, fs, "start", col, True)


def _arrow_svg(bx, by, ax, ay, col, ui=1.0):
    dx, dy = ax - bx, ay - by
    L = (dx * dx + dy * dy) ** 0.5 or 1
    ux, uy = dx / L, dy / L
    px, py = -uy, ux
    s, wd = 8 * ui, 3.2 * ui
    p1 = (ax - ux * s + px * wd, ay - uy * s + py * wd)
    p2 = (ax - ux * s - px * wd, ay - uy * s - py * wd)
    return (f'<path d="M{ax:g},{ay:g} L{p1[0]:g},{p1[1]:g} L{p2[0]:g},{p2[1]:g} Z" '
            f'fill="{col}" stroke="none"/>')


# --------------------------------------------------------------------------
# symbol geometry — shared by both back ends
# --------------------------------------------------------------------------

MUX_PATH = [("m", 0, 0), ("l", 100, 22), ("l", 100, 78), ("l", 0, 100)]
ADD_PATH = [("m", 0, 0), ("l", 100, 26), ("l", 100, 74), ("l", 0, 100),
            ("l", 0, 60), ("l", 24, 50), ("l", 0, 40)]
TRI_PATH = [("m", 0, 0), ("l", 100, 50), ("l", 0, 100)]
TRL_PATH = [("m", 100, 0), ("l", 0, 50), ("l", 100, 100)]
OR_PATH = [("m", 0, 0), ("c", 40, 4, 80, 20, 100, 50),
           ("c", 80, 80, 40, 96, 0, 100), ("c", 20, 72, 20, 28, 0, 0)]
AND_PATH = [("m", 0, 0), ("l", 48, 0), ("c", 82, 0, 100, 22, 100, 50),
            ("c", 100, 78, 82, 100, 48, 100), ("l", 0, 100)]
# the same OR mirrored about its centre line: inputs on the east edge, output
# pointing west.  A gate whose load is to its left is drawn this way rather than
# doubling its output wire back around the body.
ORL_PATH = [("m", 100, 0), ("c", 60, 4, 20, 20, 0, 50),
            ("c", 20, 80, 60, 96, 100, 100), ("c", 80, 72, 80, 28, 100, 0)]
# AND mirrored the same way, for a gate whose load is to its left
ANDL_PATH = [("m", 100, 0), ("l", 52, 0), ("c", 18, 0, 0, 22, 0, 50),
             ("c", 0, 78, 18, 100, 52, 100), ("l", 100, 100)]
XOR_PATH = OR_PATH
# the second back curve of an XOR, drawn as its own open shape in front of an
# OR body (a closed or filled path would draw a chord / hide the input wires)
XARC_PATH = [("m", 0, 0), ("c", 60, 28, 60, 72, 0, 100)]
_OPEN = ("xarc",)
PIN_PATH = [("m", 0, 0), ("l", 74, 0), ("l", 100, 50), ("l", 74, 100), ("l", 0, 100)]
PON_PATH = [("m", 0, 50), ("l", 26, 0), ("l", 100, 0), ("l", 100, 100), ("l", 26, 100)]
PDN_PATH = [("m", 0, 0), ("l", 100, 0), ("l", 100, 74), ("l", 50, 100), ("l", 0, 74)]
PUP_PATH = [("m", 50, 0), ("l", 100, 26), ("l", 100, 100), ("l", 0, 100), ("l", 0, 26)]

_STYLES = {
    "mux": _stencil("dlx_mux", 100, 100, MUX_PATH),
    "op": _stencil("dlx_alu", 100, 100, ADD_PATH),
    "tri": _stencil("dlx_buf", 100, 100, TRI_PATH),
    "trl": _stencil("dlx_bufl", 100, 100, TRL_PATH),
    "or": _stencil("dlx_or", 100, 100, OR_PATH),
    "orl": _stencil("dlx_orl", 100, 100, ORL_PATH),
    "and": _stencil("dlx_and", 100, 100, AND_PATH),
    "andl": _stencil("dlx_andl", 100, 100, ANDL_PATH),
    "pin": _stencil("dlx_pin", 100, 100, PIN_PATH),
    "pon": _stencil("dlx_pon", 100, 100, PON_PATH),
    "pdn": _stencil("dlx_pdn", 100, 100, PDN_PATH),
    "pup": _stencil("dlx_pup", 100, 100, PUP_PATH),
    "xarc": _stencil("xor_arc", 100, 100, XARC_PATH, fill=False, closed=False),
}
_PATHS = {"mux": MUX_PATH, "op": ADD_PATH, "tri": TRI_PATH,
          "trl": TRL_PATH, "or": OR_PATH, "orl": ORL_PATH,
          "and": AND_PATH, "andl": ANDL_PATH, "pin": PIN_PATH, "pon": PON_PATH,
          "pdn": PDN_PATH, "pup": PUP_PATH, "xarc": XARC_PATH}
_SHAPED = tuple(_PATHS)


def _rkind(n, k):
    """Colour class of one route of a net — a branch may differ from the trunk."""
    if k < len(n.dkinds) and n.dkinds[k]:
        return n.dkinds[k]
    return n.kind


def _subfs(s):
    """Point size of a symbol's sub-lines."""
    return F_SUB * s.fscale * s.subscale


def _lineh(s, fs, fsub):
    """Baseline spacing of a symbol's name and sub-lines: the screen spacing,
    or more when the name is set much larger than the port names (print)."""
    return max(17 * s.fscale, 0.24 * fs + 0.88 * fsub)


def _bodyfs(s):
    """Point size of the name inside a symbol."""
    base = (F_BLOCK if s.kind in ("block", "reg", "mem")
            else F_PORT if s.kind in ("pin", "pon", "pdn", "pup") else F_SUB)
    if s.kind in ("block", "reg", "mem"):
        base *= s.nscale
    return base * s.fscale


_PCOL = {"data": "#344054", "ctrl": CTRL, "status": STATUS,
         "clk": CLKRST, "en": ENABLE, "fwd": FWDSEL, "lut": FWDSEL}


def _hdrh(s):
    """Height of the header strip that carries a pin-heavy block's name."""
    return (18 + (1 + len(s.sub)) * 17) * s.fscale


def _heavy(s):
    if s.hdr is not None:
        return s.hdr
    return (s.kind in ("block", "mem")
            and sum(1 for p in s.pins.values() if p.label) >= 6 and s.h >= 200)


def _ns_layout(s, side):
    """Horizontal port names along a top or bottom edge.

    They are packed into as many rows as it takes for none of them to touch,
    so a box can carry a row of ports without a single name turned on its side.
    Returns ([(pin, x, row)], row-count).
    """
    pins = sorted([p for p in s.pins.values() if p.label and p.side == side],
                  key=lambda p: p.frac)
    rows, out = [], []
    for p in pins:
        wpx = _w(p.name, F_NS * s.fscale, True)
        lo = s.x + s.w * p.frac - wpx / 2
        lo = min(max(lo, s.x + 5), s.x + s.w - 5 - wpx)
        r = 0
        while r < len(rows) and rows[r] > lo - 10:
            r += 1
        if r == len(rows):
            rows.append(0)
        rows[r] = lo + wpx
        out.append((p, lo, r))
    return out, len(rows)


def _ns_pos(s, p):
    lay, n = _ns_layout(s, p.side)
    rh = 17 * s.fscale
    for q, lo, r in lay:
        if q is p:
            if p.side == "N":
                top = (_hdrh(s) + 12 * s.fscale) if _heavy(s) else 8
                return lo, s.y + top + rh * 0.72 + r * rh, "start"
            return lo, s.y + s.h - 8 - (n - 1 - r) * rh, "start"
    return s.pin_xy(p.name)[0], s.y, "start"


def _pin_text_pos(s, p):
    if p.side in ("N", "S") and s.nsh:
        return _ns_pos(s, p)
    x, y = s.pin_xy(p.name)
    fp = s.fpin * s.fscale
    if p.side == "W":
        return x + 8, y + fp * 0.34, "start"
    if p.side == "E":
        return x - 8, y + fp * 0.34, "end"
    if p.side == "N":
        # clear the header strip so a port name never runs through the title
        top = (_hdrh(s) + 12 * s.fscale) if _heavy(s) else 10
        return x + fp * 0.34, y + top, "end"       # reads downward, inside the box
    return x + fp * 0.34, y - 10, "start"          # reads upward, inside the box


def _svg_sym(s, o, R, T):
    if s.kind in _SHAPED:
        d = _svg_path(_PATHS[s.kind], 100, 100, s.x, s.y, s.w / 100, s.h / 100,
                      s.kind not in _OPEN)
        fill = "none" if s.kind in _OPEN else s.fill
        o.append(f'<path d="{d}" fill="{fill}" stroke="{INK}" '
                 f'stroke-width="{1.4 * s.ui:g}"/>')
    elif s.kind == "dot":
        o.append(f'<circle cx="{s.x:g}" cy="{s.y:g}" r="{3.4 * s.ui:g}" fill="{INK}"/>')
        return
    elif s.kind == "bub":
        o.append(f'<circle cx="{s.x + s.w / 2:g}" cy="{s.y + s.h / 2:g}" r="{s.w / 2:g}" '
                 f'fill="#FFFFFF" stroke="{INK}" stroke-width="{1.3 * s.ui:g}"/>')
        return
    elif s.kind == "tagbox":
        R(s.x, s.y, s.w, s.h, "#FFFFFF", s.note or CLKRST, False, 1.1)
    else:
        R(s.x, s.y, s.w, s.h, s.fill, INK, False, 1.5 * s.ui)

    if s.kind == "reg":
        o.append(f'<path d="M{s.x:g},{s.y + s.h - 11:g} L{s.x + 11:g},{s.y + s.h - 5.5:g} '
                 f'L{s.x:g},{s.y + s.h:g} Z" fill="none" stroke="{INK}" stroke-width="1.2"/>')

    lines = [s.label] + list(s.sub)
    fs = _bodyfs(s)
    fsub = _subfs(s)
    if _heavy(s):
        # many ports: the name goes in a header strip so it cannot sit on a
        # pin label half way down the box
        hh = _hdrh(s)
        o.append(f'<path d="M{s.x:g},{s.y + hh:g} L{s.x + s.w:g},{s.y + hh:g}" '
                 f'stroke="{INK}" stroke-width="1.1" fill="none"/>')
        lh0 = _lineh(s, fs, fsub)
        for i, ln in enumerate(lines):
            T(ln, s.x + s.w / 2, s.y + 14 * s.fscale + i * lh0 + fs * 0.36,
              fs if i == 0 else fsub, "middle", INK, False, i == 0)
        _svg_pins(s, o, T)
        for (t, x, y, size, an, col) in s.inner:
            T(t, x, y, size, an, col, True)
        return
    if s.kind == "tagbox":
        cx, cy = s.x + s.w / 2, s.y + s.h / 2
        if s.rot:
            o.append(f'<g transform="rotate(-90 {cx:g} {cy:g})">')
            T(s.label, cx, cy + s.tfs * 0.36, s.tfs, "middle", s.note or CLKRST, True)
            o.append("</g>")
        else:
            T(s.label, cx, cy + s.tfs * 0.36, s.tfs, "middle", s.note or CLKRST, True)
        return
    cx = s.x + s.w * (0.62 if s.kind in ("orl", "andl") else
                      0.38 if s.kind in ("mux", "op", "or", "and") else
                      0.42 if s.kind == "pin" else 0.58 if s.kind == "pon" else 0.5)
    lh = _lineh(s, fs, fsub)
    voff = -s.h * 0.11 if s.kind == "pdn" else s.h * 0.11 if s.kind == "pup" else 0
    cy = s.y + s.h / 2 + voff - (len(lines) - 1) * lh / 2 + fs * 0.36
    for i, ln in enumerate(lines):
        T(ln, cx, cy + i * lh, fs if i == 0 else fsub, "middle", INK,
          s.kind in ("pin", "pon", "pdn", "pup"), i == 0)

    _svg_pins(s, o, T)
    for (t, x, y, size, an, col) in s.inner:
        T(t, x, y, size, an, col, True)


def _svg_pins(s, o, T):
    for p in s.pins.values():
        if not p.label:
            continue
        tx, ty, an = _pin_text_pos(s, p)
        col = _PCOL[p.kind]
        if p.side in ("N", "S") and not s.nsh:
            o.append(f'<g transform="rotate(-90 {tx:g} {ty:g})">')
            T(p.name, tx, ty, s.fpin * s.fscale, an, col, True)
            o.append("</g>")
        else:
            T(p.name, tx, ty,
              (F_NS if p.side in ("N", "S") else s.fpin) * s.fscale, an, col, True)


def _drawio_sym(s, cell, textcell):
    if s.kind == "dot":
        return cell(f"ellipse;html=1;fillColor={INK};strokeColor={INK};",
                    "", s.x - 3.4, s.y - 3.4, 6.8, 6.8)
    if s.kind == "bub":
        return cell(f"ellipse;html=1;fillColor=#FFFFFF;strokeColor={INK};strokeWidth=1.3;",
                    "", s.x, s.y, s.w, s.h)
    if s.kind == "tagbox":
        c = s.note or CLKRST
        return cell(f"rounded=0;html=1;fillColor=#FFFFFF;strokeColor={c};"
                    f"fontSize={s.tfs:g};fontFamily={MONO};fontColor={c};"
                    + ("horizontal=0;" if s.rot else ""),
                    s.label, s.x, s.y, s.w, s.h)
    fs = _bodyfs(s)
    base = (f"html=1;whiteSpace=wrap;fillColor={s.fill};strokeColor={INK};"
            f"fontSize={fs};fontFamily={MONO if s.kind in ('pin', 'pon', 'pdn', 'pup') else SANS};"
            f"fontStyle=1;verticalAlign=middle;align=center;strokeWidth=1.5;")
    if s.kind in _SHAPED:
        st = f"shape={_STYLES[s.kind]};" + base
        if s.kind in ("orl", "andl"):
            st += "spacingLeft=28;"
        elif s.kind in ("mux", "op", "or", "and"):
            st += "spacingRight=28;"
        elif s.kind == "pin":
            st += "spacingRight=20;"
        elif s.kind == "pon":
            st += "spacingLeft=20;"
        elif s.kind == "pdn":
            st += "spacingBottom=%d;" % int(s.h * 0.22)
        elif s.kind == "pup":
            st += "spacingTop=%d;" % int(s.h * 0.22)
    else:
        st = "rounded=0;" + base
    val = s.label if not s.sub else s.label + "<br/>" + "<br/>".join(
        f'<font style="font-size:{_subfs(s):g}px;font-weight:400">{x}</font>'
        for x in s.sub)
    if _heavy(s):
        st = st.replace("verticalAlign=middle", "verticalAlign=top") + \
            f"spacingTop={6 * s.fscale:g};"
        i = cell(st, val, s.x, s.y, s.w, s.h)
        cell(f"rounded=0;html=1;fillColor={INK};strokeColor=none;", "",
             s.x, s.y + _hdrh(s), s.w, 1.1)
    else:
        i = cell(st, val, s.x, s.y, s.w, s.h)
    if s.kind == "reg":
        cell(f"shape={_STYLES['tri']};html=1;fillColor=none;strokeColor={INK};strokeWidth=1.2;",
             "", s.x, s.y + s.h - 11, 11, 11)
    for p in s.pins.values():
        if not p.label:
            continue
        tx, ty, an = _pin_text_pos(s, p)
        col = _PCOL[p.kind]
        if p.side in ("N", "S") and s.nsh:
            textcell(p.name, tx, ty, F_NS * s.fscale, "start", col, True)
            continue
        if p.side in ("N", "S"):
            wl = _w(p.name, s.fpin * s.fscale, True) + 10
            oy = 0 if an == "end" else -wl
            cell(f"text;html=1;strokeColor=none;fillColor=none;align=center;"
                 f"verticalAlign=middle;horizontal=0;fontSize={s.fpin * s.fscale:g};fontColor={col};"
                 f"fontFamily={MONO};resizable=0;", p.name,
                 tx - s.fpin * s.fscale * 0.7, ty + oy, s.fpin * s.fscale + 4, wl)
        else:
            textcell(p.name, tx, ty, s.fpin * s.fscale, an, col, True)
    for (t, x, y, size, an, col) in s.inner:
        textcell(t, x, y, size, an, col, True)
    return i
