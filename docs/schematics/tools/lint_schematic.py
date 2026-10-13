"""Readability lint for one sheet — the checks the author judges a sheet by.

    python tools/lint_schematic.py decode          # report
    python tools/lint_schematic.py decode --strict # non-zero exit on any finding

verify_schematics.py checks that a sheet is *correct* (netlist, no wire through
a block).  This checks that it is *readable*:

  gap      two different nets running in parallel closer than GAP px
  touch    a corner or end of one net lying on a wire of another net
           (reads as a junction that is not there)
  clear    a wire passing closer than CLEAR px to a block it does not connect to
  pin      a drawn pin that no net connects to
  jog      a segment shorter than JOG px in the middle of a route
  print    text that would be below the minimum size on the A3 page
           (SCHEMATIC_RULES §1.4: block names 10 pt, port / flag names 8 pt,
           wire labels / legend / notes 7 pt, width numbers / tags / sub-lines 6 pt)
  label    a wire label that found no clear spot (it overlaps something)
  hops     total crossings (informational)
"""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
import sheets                      # noqa: E402
from schem import F_PIN, F_NS, F_SUB, F_PORT, _bodyfs   # noqa: E402

A3 = (1190.55 - 56.7, 841.89 - 56.7)
# port names inside blocks may be 6.5 pt (author, 2026-10: smaller and on one row
# beats large and stacked); flags, labels, names as before
MIN_PT = dict(name=10.0, pin=6.5, flag=8.0, label=7.0, legend=7.0, small=6.0)


def print_check(sh):
    """text sizes on the A3 page"""
    k = min(A3[0] / sh.w, A3[1] / sh.h)
    out = []

    def need(what, px, kind, where):
        pt = px * k
        if pt < MIN_PT[kind] - 0.05:
            out.append(("print", f"{where}: {what} {pt:.1f} pt on A3 "
                                 f"(min {MIN_PT[kind]:g} pt; {px:.0f} px at k={k:.3f})"))

    worst = {}
    for s_ in sh.syms:
        if s_.kind in ("dot", "bub"):
            continue
        if s_.kind == "tagbox":
            worst.setdefault("clk/rst tags", (s_.tfs, "small"))
            continue
        if s_.kind in ("pin", "pon", "pdn", "pup"):
            worst["port flags"] = min(worst.get("port flags", (1e9, "flag")),
                                      (_bodyfs(s_), "flag"))
            continue
        if s_.kind in ("block", "reg", "mem") and s_.label:
            worst["block names"] = min(worst.get("block names", (1e9, "name")),
                                       (_bodyfs(s_), "name"))
        if s_.sub:
            worst["block sub-lines"] = min(worst.get("block sub-lines", (1e9, "small")),
                                           (F_SUB * s_.fscale * s_.subscale, "small"))
        for p in s_.pins.values():
            if p.label:
                f = (F_NS if p.side in ("N", "S") else s_.fpin) * s_.fscale
                worst["port names"] = min(worst.get("port names", (1e9, "pin")), (f, "pin"))
    for what, (px, kind) in worst.items():
        need(what, px, kind, "symbols")
    if any(n.label_at != "none" and n.name for n in sh.nets):
        need("wire labels", sh.fsig, "label", "sheet")
    if any(n.width and n.width > 1 for n in sh.nets):
        need("bus-width numbers", getattr(sh, "fsmall", 10), "small", "sheet")
    if sh.free:
        need("free text / legend", min(t[3] for t in sh.free), "legend", "sheet")
    need("title block", 9.5 * getattr(sh, "tscale", 1.0), "small", "sheet")
    return out

GAP = 40          # ~4 mm at the size the sheet is read on screen
CLEAR = 22
JOG = 20


def segments(sh):
    out = []
    for n in sh.nets:
        for r, pts in enumerate(n.routes):
            for i in range(len(pts) - 1):
                (x0, y0), (x1, y1) = pts[i], pts[i + 1]
                out.append((n, r, i, x0, y0, x1, y1))
    return out


def _on(px, py, net):
    for pts in net.routes:
        for i in range(len(pts) - 1):
            (x0, y0), (x1, y1) = pts[i], pts[i + 1]
            if y0 == y1 == py and min(x0, x1) - 1 <= px <= max(x0, x1) + 1:
                return True
            if x0 == x1 == px and min(y0, y1) - 1 <= py <= max(y0, y1) + 1:
                return True
    return False


def lint(sh):
    global GAP
    if hasattr(sh, "k_print"):            # print sheets: 3.5 mm on the A3 page
        GAP = max(30, round(9.92 / min(A3[0] / sh.w, A3[1] / sh.h)))
    segs = segments(sh)
    # the print sizes apply to the A3 layouts; a screen sheet is not checked
    found = print_check(sh) if getattr(sh, "a3", False) else []
    sh._plan_labels()
    for t in getattr(sh, "_label_fallbacks", []):
        found.append(("label", f"'{t}' has no clear spot for its label"))
    # ---- parallel runs of different nets that are too close -----------------
    for a in range(len(segs)):
        na, _, _, ax0, ay0, ax1, ay1 = segs[a]
        for b in range(a + 1, len(segs)):
            nb, _, _, bx0, by0, bx1, by1 = segs[b]
            if nb is na:
                continue
            if ay0 == ay1 and by0 == by1:           # both horizontal
                lo = max(min(ax0, ax1), min(bx0, bx1))
                hi = min(max(ax0, ax1), max(bx0, bx1))
                d = abs(ay0 - by0)
                if hi - lo > 2 and d < GAP:
                    found.append(("gap", f"{na.name or '(anon)'} / {nb.name or '(anon)'}"
                                  f"  {d:.0f}px apart, horizontal at y={ay0:.0f}/{by0:.0f}"
                                  f" over x {lo:.0f}..{hi:.0f}"))
            elif ax0 == ax1 and bx0 == bx1:         # both vertical
                lo = max(min(ay0, ay1), min(by0, by1))
                hi = min(max(ay0, ay1), max(by0, by1))
                d = abs(ax0 - bx0)
                if hi - lo > 2 and d < GAP:
                    found.append(("gap", f"{na.name or '(anon)'} / {nb.name or '(anon)'}"
                                  f"  {d:.0f}px apart, vertical at x={ax0:.0f}/{bx0:.0f}"
                                  f" over y {lo:.0f}..{hi:.0f}"))
    # ---- a corner of one net sitting on another net's wire ------------------
    def tap_of(n, m):
        # a field tap leaving a junction dot that sits on the bus it taps
        return (n.src[0].kind == "dot" and n.routes and
                any(d[0] is n.src[0] for d in m.dsts)) or                (n.src[0].kind == "dot" and _on(n.src[0].x, n.src[0].y, m))

    for n in sh.nets:
        for pts in n.routes:
            for (px, py) in pts:
                for m, _, _, x0, y0, x1, y1 in segs:
                    if m is n or tap_of(n, m) or tap_of(m, n):
                        continue
                    if y0 == y1 == py and min(x0, x1) - 1 <= px <= max(x0, x1) + 1:
                        found.append(("touch", f"{n.name or '(anon)'} at ({px:.0f},{py:.0f}) "
                                      f"lies on {m.name or '(anon)'}"))
                    elif x0 == x1 == px and min(y0, y1) - 1 <= py <= max(y0, y1) + 1:
                        found.append(("touch", f"{n.name or '(anon)'} at ({px:.0f},{py:.0f}) "
                                      f"lies on {m.name or '(anon)'}"))
    # ---- clearance from blocks the wire has nothing to do with --------------
    for n, r, i, x0, y0, x1, y1 in segs:
        mine = {n.src[0].key} | {d[0].key for d in n.dsts}
        for s in sh.syms:
            if s.kind in ("dot", "bub") or s.key in mine:
                continue
            # an XOR's second back curve belongs to the gate whose inputs end on it
            if s.kind == "xarc" and s.key[:-4] in mine:
                continue
            bx0, by0, bx1, by1 = s.x - CLEAR, s.y - CLEAR, s.x + s.w + CLEAR, s.y + s.h + CLEAR
            if y0 == y1:
                hit = by0 < y0 < by1 and min(x0, x1) < bx1 and max(x0, x1) > bx0
            else:
                hit = bx0 < x0 < bx1 and min(y0, y1) < by1 and max(y0, y1) > by0
            if hit:
                found.append(("clear", f"{n.name or '(anon)'} passes within {CLEAR}px "
                              f"of {s.key}"))
    # ---- nothing under the title block -----------------------------------------
    tx, ty, tw_, th_ = sh.title_box()
    for s_ in sh.syms:
        if s_.kind in ("dot", "bub"):
            continue
        if not (s_.x + s_.w < tx or s_.x > tx + tw_ or s_.y + s_.h < ty or s_.y > ty + th_):
            found.append(("clear", f"{s_.key} is under the title block"))
    for n, r, i, x0, y0, x1, y1 in segs:
        if not (max(x0, x1) < tx or min(x0, x1) > tx + tw_ or max(y0, y1) < ty
                or min(y0, y1) > ty + th_):
            found.append(("clear", f"{n.name or '(anon)'} runs under the title block"))
    # ---- wires through free-standing boxes (the KEY) ------------------------
    for n, r, i, x0, y0, x1, y1 in segs:
        for (bx, by, bw, bh, *_rest) in sh.rects:
            if y0 == y1:
                hit = by - 10 < y0 < by + bh + 10 and min(x0, x1) < bx + bw and max(x0, x1) > bx
            else:
                hit = bx - 10 < x0 < bx + bw + 10 and min(y0, y1) < by + bh and max(y0, y1) > by
            if hit:
                found.append(("clear", f"{n.name or '(anon)'} runs through the box at "
                              f"({bx:.0f},{by:.0f})"))
    # ---- pins nothing connects to --------------------------------------------
    used = set()
    for n in sh.nets:
        used.add((n.src[0].key, n.src[1]))
        for d in n.dsts:
            used.add((d[0].key, d[1]))
    for s in sh.syms:
        if s.kind in ("dot", "bub"):
            continue
        for p in s.pins:
            if (s.key, p) not in used:
                found.append(("pin", f"{s.key}.{p} is not connected"))
    # ---- tiny jogs in the middle of a route ----------------------------------
    for n in sh.nets:
        for pts in n.routes:
            for i in range(1, len(pts) - 2):
                (x0, y0), (x1, y1) = pts[i], pts[i + 1]
                if 0 < abs(x1 - x0) + abs(y1 - y0) < JOG:
                    found.append(("jog", f"{n.name or '(anon)'}: {abs(x1-x0)+abs(y1-y0):.0f}px "
                                  f"segment at ({x0:.0f},{y0:.0f})"))
    return sorted(set(found))


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    strict = "--strict" in sys.argv
    name = args[0] if args else "decode"
    sh = getattr(sheets, "sheet_" + name)()
    sh.route()
    found = lint(sh)
    hops = sh._hops()
    nh = sum(len(x) for d in hops.values() for x in d.values())
    kinds = {}
    for k, msg in found:
        kinds[k] = kinds.get(k, 0) + 1
        print(f"  {k:<6} {msg}")
    print(f"\n{name}: {len(sh.syms)} symbols, {len(sh.nets)} nets, {nh} crossings; "
          + ", ".join(f"{k} {v}" for k, v in sorted(kinds.items())) if kinds else
          f"\n{name}: {len(sh.syms)} symbols, {len(sh.nets)} nets, {nh} crossings; clean")
    return 1 if (strict and found) else 0


if __name__ == "__main__":
    sys.exit(main())
