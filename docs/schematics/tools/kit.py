"""Building blocks for hand-routed sheets (05 decode was the first).

    k = Kit(sheet)                    # geometry defaults below, override by kwargs
    PX, PY, wire = k.PX, k.PY, k.wire
    m = k.mux("m1", x, y0, upper="1", lower="0")
    wire("sig", (m, "y"), [(r, "X")], [[(x1, y1), ...]], width=32)

Everything a sheet needs to follow SCHEMATIC_RULES.md §1 without re-deriving it:
edge flags placed clear of each other's wires, muxes with the select on the
sloped top/bottom edge, gates whose inputs land on the body, bus junction dots,
clk/rst tags on straight stubs, and a `wire` that takes explicit corner points
and drops a label a port flag already provides.
"""
from schem import Sym, Pin, FILL_REG, F_NS, F_BLOCK

FLAG_KINDS = ("pin", "pon", "pdn", "pup")
A3 = (1190.55 - 56.7, 841.89 - 56.7)       # A3 landscape, 10 mm margins, in pt


def print_profile(sh, pin_pt=8.0, name_pt=10.0, label_pt=7.0, small_pt=6.0,
                  flag_pt=8.0, legend_pt=7.5, title_pt=8.5, stroke_pt=0.45):
    """Size every piece of text and furniture for the A3 page (SCHEMATIC_RULES §1.4).

    Call right after creating the Sheet, before adding symbols.  The page scale
    k = min(A3 w / W, A3 h / H) pt per px turns each size given in points *on
    paper* into sheet pixels.  Returns a dict of the resulting px sizes.
    """
    k = min(A3[0] / sh.w, A3[1] / sh.h)
    sh.k_print = k
    sh.symscale = pin_pt / (F_NS * k)          # N/S port names are the smallest
    sh.namescale = name_pt / (F_BLOCK * sh.symscale * k)
    sh.subscale = small_pt / (13 * sh.symscale * k)   # sub-lines: F_SUB = 13
    sh.fpin = F_NS                              # side names as large as N/S
    sh.fsig = label_pt / k
    sh.fsmall = small_pt / k
    sh.ftag = small_pt / k
    sh.fnote = label_pt / k
    sh.tscale = title_pt / (13 * k)
    sh.ui = stroke_pt / (1.1 * k)
    sh.flag_pt = flag_pt
    sh.legend_scale = legend_pt / (12 * k)
    sh.a3 = True
    return dict(k=k, pin=F_NS * sh.symscale, label=sh.fsig, flag=flag_pt / k,
                small=sh.fsmall, gap=9.92 / k)


class Kit:
    def __init__(self, sh, PW=280, PH=36, TH=38, RS=50, BH=40, XL=40, YT=30,
                 YB=None, MW=60, MH=128, flag_font=15):
        self.sh = sh
        if hasattr(sh, "k_print"):             # print profile: flags sized from it
            flag_font = sh.flag_pt / sh.k_print
            PH = TH = BH = round(flag_font * 1.75)
            RS = TH + 14
            MW = max(MW, round(60 * sh.symscale))
        self.PW, self.PH, self.TH, self.RS, self.BH = PW, PH, TH, RS, BH
        self.XL, self.XR = XL, sh.w - XL - PW
        self.YT = YT
        self.YB = YB if YB is not None else sh.h - 130     # bottom flags, row 0
        self.MW, self.MH = MW, MH
        self.flag_font = flag_font

    # ---------------------------------------------------------------- pins --
    @staticmethod
    def PX(s, p):
        return s.pin_xy(p)[0]

    @staticmethod
    def PY(s, p):
        return s.pin_xy(p)[1]

    # --------------------------------------------------------------- flags --
    def flag_w(self, name):
        # the verifier wants the name within 70 % of a flag's width
        return max(80, len(name) * self.flag_font * 0.602 / 0.70 + 12)

    def _scale(self, sym):
        sym.fscale = self.flag_font / 15.0         # F_PORT is 15
        return sym

    def _side(self, key, name, cy, kind, shape, pin, right):
        w = self.PW
        x = self.sh.w - self.XL - w if right else self.XL
        return self._scale(self.sh.block(key, x, cy - self.PH / 2, w, self.PH, name,
                                         kind=shape, pins=[pin]))

    def iport(self, key, name, cy, kind="data"):
        """left-edge input flag"""
        return self._side(key, name, cy, kind, "pin", Pin("o", "E", 0.5, None, kind, False),
                          False)

    def oport(self, key, name, cy, kind="data"):
        """right-edge output flag"""
        return self._side(key, name, cy, kind, "pon", Pin("i", "W", 0.5, None, kind, False),
                          True)

    def loport(self, key, name, cy, kind="data"):
        """left-edge output flag (points off the sheet, to the left)"""
        return self._side(key, name, cy, kind, "pon", Pin("i", "E", 0.5, None, kind, False),
                          False)

    def riport(self, key, name, cy, kind="data"):
        """right-edge input flag (points into the sheet, to the left)"""
        return self._side(key, name, cy, kind, "pin", Pin("o", "W", 0.5, None, kind, False),
                          True)

    def tport(self, key, name, cx, row=0, kind="ctrl", w=210, out=False):
        y = self.YT + row * self.RS
        if out:
            return self._scale(self.sh.block(key, cx - w / 2, y, w, self.TH, name,
                                             kind="pup",
                                             pins=[Pin("i", "S", 0.5, None, kind, False)]))
        return self._scale(self.sh.block(key, cx - w / 2, y, w, self.TH, name, kind="pdn",
                                         pins=[Pin("o", "S", 0.5, None, kind, False)]))

    def place_flags(self, specs, gap=40, clear=32, rows=4, jog0=40, xmax=None):
        """Place edge flags, each as close to the lane it feeds as it fits.

        specs: [(key, name, lane_x)].  Row 0 is at the sheet edge; a flag's
        wire runs from the flag straight to the jog level, then over to its
        lane.  Offsets and rows are searched nearest-first such that
          * flags in one row do not overlap;
          * no wire passes within `clear` of a flag nearer the circuit;
          * the wires are `gap` apart, and at the jog level the flags' spans
            (flag x .. lane x) are `gap` apart, so no jog runs into a wire.
        A jog is at least `jog0` px, so it reads as meant, not as a glitch.
        Returns {key: (flag centre x, row, width)}.
        """
        placed = []                        # (row, x0, x1, cx, lo, hi)
        out = {}
        offs = [0] + [s * k for k in range(jog0, 460, 20) for s in (1, -1)]
        for key, name, lane in sorted(specs, key=lambda t: t[2]):
            w = self.flag_w(name)
            for off in offs:
                cx = lane + off
                x0, x1 = cx - w / 2, cx + w / 2
                if xmax is not None and x1 > xmax:
                    continue
                lo, hi = min(cx, lane), max(cx, lane)
                if any(not (hi + gap <= plo or phi + gap <= lo) or abs(pcx - cx) < gap
                       for (_, _, _, pcx, plo, phi) in placed):
                    continue
                for row in range(rows):
                    if all(not (r == row and not (x1 + 16 <= a0 or a1 + 16 <= x0)) and
                           not (r < row and x0 - clear <= pcx <= x1 + clear) and
                           not (r > row and a0 - clear <= cx <= a1 + clear)
                           for (r, a0, a1, pcx, _, _) in placed):
                        break
                else:
                    continue
                break
            else:
                near = [(round(p[3]), p[0], round(p[4]), round(p[5])) for p in placed
                        if abs(p[3] - lane) < 500]
                raise ValueError(f"no place for flag {name} (lane {lane:.0f}, width "
                                 f"{w:.0f}); flags nearby (x, row, span): {near}")
            placed.append((row, x0, x1, cx, lo, hi))
            out[key] = (cx, row, w)
        return out

    def ns_positions(self, names, lo, hi, gap=16):
        """x centres for pins whose names lie flat on a top/bottom edge.

        If the names fit side by side in [lo, hi] they are spread with equal
        spare space between them — one row, no name over another.  If not,
        the pins are spread evenly and the names take more than one row.
        """
        fpx = F_NS * self.sh.symscale
        ws = [len(n) * fpx * 0.602 for n in names]
        need = sum(ws) + gap * (len(ws) - 1)
        if need > hi - lo:
            return [lo + (hi - lo) * (i + 0.5) / len(names) for i in range(len(names))]
        extra = (hi - lo - need) / len(ws)
        out, x = [], lo + extra / 2
        for w in ws:
            out.append(x + w / 2)
            x += w + gap + extra
        return out

    def stair_pitch(self):
        fh = round(self.flag_font * 1.45)
        return fh, fh + round(self.flag_font * 0.35)

    def stair(self, specs, x0, y0, w=None, side="right", toward="down"):
        """A column of flags, one per row, for signals that meet a row of pins.

        specs: (key, name, lane_x, kind, 'in'|'out').  The lanes are all on one
        `side` of the column; the pins are below it (toward='down') or above it
        ('up').  Each wire runs straight across from its flag to its lane and
        then on to the pin.  The lane farthest from the column gets the row
        farthest from the pins, so no two of these wires cross.
        Returns ({key: flag}, {key: wire y}).
        """
        fh, pitch = self.stair_pitch()
        w = w or max(self.flag_w(s[1]) for s in specs)
        n = len(specs)
        far = sorted(specs, key=lambda s: -s[2] if side == "right" else s[2])
        out, ys = {}, {}
        for i, (key, name, lane, kd, d) in enumerate(far):
            if side == "right":
                assert lane > x0 + w + 20, f"stair lane {name} at {lane} is under the column"
            else:
                assert lane < x0 - 20, f"stair lane {name} at {lane} is under the column"
            row = i if toward == "down" else n - 1 - i
            cy = y0 + row * pitch + fh / 2
            pin = Pin("o" if d == "in" else "i", "E" if side == "right" else "W", 0.5,
                      None, kd, False)
            out[key] = self._scale(self.sh.block(key, x0, cy - fh / 2, w, fh, name,
                                                 kind="pin" if d == "in" else "pon",
                                                 pins=[pin]))
            ys[key] = cy
        return out, ys

    def stair_h(self, n):
        fh, pitch = self.stair_pitch()
        return (n - 1) * pitch + fh

    def top_flags(self, specs, rows=4, jog0=40, clear=32):
        """specs: (key, name, lane_x, kind[, 'in'|'out']).  Row 0 at the top edge."""
        where = self.place_flags([(s[0], s[1], s[2]) for s in specs], rows=rows,
                                 jog0=jog0, clear=clear)
        return {s[0]: self.tport(s[0], s[1], where[s[0]][0], where[s[0]][1], s[3],
                                 where[s[0]][2], out=len(s) > 4 and s[4] == "out")
                for s in specs}

    def bottom_flags(self, specs, rows=3, jog0=60, clear=32):
        """specs: (key, name, lane_x, kind, 'in'|'out').  Row 0 at the bottom edge.
        Flags keep clear of the title block in the bottom-right corner."""
        tx = self.sh.title_box()[0] - 30
        where = self.place_flags([(k, n, x) for k, n, x, _, _ in specs], rows=rows,
                                 jog0=jog0, clear=clear, xmax=tx)
        out = {}
        for k, n, x, kd, d in specs:
            cx, row, w = where[k]
            y = self.YB - row * self.RS
            if d == "in":
                out[k] = self.sh.block(k, cx - w / 2, y, w, self.BH, n, kind="pup",
                                       pins=[Pin("o", "N", 0.5, None, kd, False)])
            else:
                out[k] = self.sh.block(k, cx - w / 2, y, w, self.BH, n, kind="pdn",
                                       pins=[Pin("i", "N", 0.5, None, kd, False)])
            self._scale(out[k])
        return out

    # -------------------------------------------------------------- symbols --
    def mux(self, key, x, y0, upper, lower, sel="N", h=None, sfrac=0.5):
        """2:1 mux.  `upper`/`lower` name the input ("0"/"1") on each W pin;
        the select sits on the sloped top ("N") or bottom ("S") edge."""
        return self.sh.block(key, x, y0, self.MW, h or self.MH, "MUX", ("2:1",),
                             kind="mux",
                             pins=[Pin(upper, "W", 0.25, None, "data", True),
                                   Pin(lower, "W", 0.75, None, "data", True),
                                   Pin("s", sel, sfrac, None, "ctrl", False),
                                   Pin("y", "E", 0.50, None, "data", False)])

    def reg(self, key, x, y, label, sub, en=True, w=300, h=120, en_side="W",
            en_frac=0.75):
        pins = [Pin("X", "W", 0.30, None, "data", True),
                Pin("Y", "E", 0.30, None, "data", True)]
        if en:
            pins.append(Pin("EN", en_side, en_frac, None, "ctrl", True))
        return self.sh.block(key, x, y, w, h, label, sub, kind="reg", fill=FILL_REG,
                             pins=pins)

    def konst(self, key, x, cy, text, w, h=44, inp=None, sub=()):
        pins = [Pin("o", "E", 0.5, None, "data", False)]
        if inp:
            pins.append(Pin("i", inp, 0.5, None, "data", False))
        return self.sh.block(key, x, cy - h / 2, w, h, text, sub, pins=pins)

    def gate(self, key, kind, x, y, w=84, h=96, inv=(), n=2):
        """n-input gate (h >= 96 keeps two inputs 40 px apart).  kind 'or'/'and'
        take inputs west, 'orl'/'andl' east.  `inv`: input names with a bubble."""
        ins = "E" if kind in ("andl", "orl") else "W"
        outs = "W" if ins == "E" else "E"
        names = "abcdefgh"[:n]
        fr = [0.26, 0.74] if n == 2 else [0.18 + 0.64 * i / (n - 1) for i in range(n)]
        pins = []
        for nm, f in zip(names, fr):
            # an OR's back is curved: land the input on the curve
            k = 0.12 * w if kind in ("or", "orl") else 0
            if nm in inv:
                k = -13
                bx = x - 13 if ins == "W" else x + w
                self.sh.add(Sym(f"{key}_bub_{nm}", bx, y + f * h - 6.5, 13, 13, "bub"))
            pins.append(Pin(nm, ins, f, None, "ctrl", False, k))
        pins.append(Pin("y", outs, 0.50, None, "ctrl", False))
        return self.sh.block(key, x, y, w, h, "", (), kind=kind, pins=pins)

    def dot(self, key, x, y, iside="W", oside="S"):
        """a junction on a bus: the bus ends in it, field taps leave from it"""
        return self.sh.add(Sym(key, x, y, 0, 0, "dot", "", (),
                               {"i": Pin("i", iside, 0.5, None, "data", False),
                                "o": Pin("o", oside, 0.5, None, "data", False)}))

    def clkrst(self, sym, fr_clk, fr_rst, side="S"):
        """clk and rst by name tag on a straight stub — the documented exception."""
        for nm, fr in (("clk", fr_clk), ("rst", fr_rst)):
            sym.pins[nm] = Pin(nm, side, fr, None, "clk", False)
            px, py = sym.pin_xy(nm)
            ft = getattr(self.sh, "ftag", 10)
            tw, th = max(42, 3 * ft * 0.62 + 16), max(20, ft * 1.6)
            gap = max(20, ft)
            ty = py + gap if side == "S" else py - gap - th
            t = self.sh.block(f"{sym.key}_{nm}", px - tw / 2, ty, tw, th, nm,
                              kind="tagbox",
                              pins=[Pin("o", "N" if side == "S" else "S", 0.5, None,
                                        "clk", False)])
            self.sh.net("", (t, "o"), [(sym, nm)], None, "clk", label_at="none",
                        ways=[None])

    # ---------------------------------------------------------------- wires --
    def wire(self, name, src, dsts, paths=None, width=None, kind="data", label=True,
             dkinds=(), tstub=(), dlabels=()):
        """paths[j]: the corner points of the route to dsts[j].  Route 0 leaves
        the source pin; a later route starts at its junction on an earlier one.
        Every net is hand-routed (an empty path is a straight or one-corner run)."""
        if not isinstance(dsts, list):
            dsts = [dsts]
        if paths is None:
            paths = [[] for _ in dsts]
        # a port flag already names its wire: no second label beside it
        # unless the wire runs far from the flag
        flags = [s for s, _ in [src] + dsts if s.kind in FLAG_KINDS]
        if label and any(f.label == name for f in flags):
            sx, sy = src[0].pin_xy(src[1])
            far = max(abs(sx - d.pin_xy(p)[0]) + abs(sy - d.pin_xy(p)[1])
                      for d, p in dsts)
            label = far > 900
        return self.sh.net(name, src, dsts, width, kind, "src" if label else "none",
                           ways=[p if p else None for p in paths] or [None],
                           dkinds=dkinds, tstub=tstub, dlabels=dlabels)

    def jog_top(self, flag, lane, yj):
        """corner points from a top flag down to its lane (jog at yj)"""
        fx = self.PX(flag, "o")
        return [] if abs(fx - lane) < 1 else [(fx, yj), (lane, yj)]

    def jog_bottom_in(self, flag, lane, yj):
        fx = self.PX(flag, "o")
        return [] if abs(fx - lane) < 1 else [(fx, yj), (lane, yj)]

    def jog_bottom_out(self, flag, lane, yj):
        fx = self.PX(flag, "i")
        return [] if abs(fx - lane) < 1 else [(lane, yj), (fx, yj)]
