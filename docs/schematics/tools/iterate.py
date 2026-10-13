"""Fast design loop for one sheet — build, render, measure, crop.

    python tools/iterate.py decode                 # svg+png into ./_iter/, lint summary
    python tools/iterate.py decode --hops          # + crossings per net (where to look)
    python tools/iterate.py decode --crops 3x2     # + full-res crops _iter/decode_c<r><c>.png
    python tools/iterate.py decode --scale 0.4     # preview scale (default 0.45)

Nothing is written to the published outputs; use build_schematics.py for that.
Rendering needs a Chromium browser (Edge/Chrome), found as in build_schematics.
"""
import argparse, collections, sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import sheets                                  # noqa: E402
import lint_schematic                          # noqa: E402
from build_schematics import _browser, _headless   # noqa: E402

OUT = HERE / "_iter"


def hop_table(sh):
    """crossings per net: a horizontal run of one net over a vertical run of another"""
    hs, vs = [], []
    for n in sh.nets:
        for pts in n.routes:
            for i in range(len(pts) - 1):
                (x0, y0), (x1, y1) = pts[i], pts[i + 1]
                if y0 == y1 and x0 != x1:
                    hs.append((n, min(x0, x1), max(x0, x1), y0))
                elif x0 == x1 and y0 != y1:
                    vs.append((n, min(y0, y1), max(y0, y1), x0))
    per = collections.Counter()
    for hn, xa, xb, yy in hs:
        for vn, ya, yb, x in vs:
            if hn is not vn and ya < yy - .5 and yy < yb - .5 and xa + 10 < x < xb - 10:
                per[hn.name or "(anon)"] += 1
                per[vn.name or "(anon)"] += 1
    return per


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("sheet")
    ap.add_argument("--scale", type=float, default=0.45)
    ap.add_argument("--hops", action="store_true")
    ap.add_argument("--crops", default="")
    a = ap.parse_args()

    OUT.mkdir(exist_ok=True)
    sh = getattr(sheets, "sheet_" + a.sheet)()
    sh.route()
    svg = OUT / f"{a.sheet}.svg"
    sh.to_svg(svg)
    found = lint_schematic.lint(sh)
    kinds = collections.Counter(k for k, _ in found)
    for k, msg in found:
        print(f"  {k:<6} {msg}")
    nh = sum(len(x) for d in sh._hops().values() for x in d.values())
    print(f"\n{a.sheet}: {len(sh.syms)} symbols, {len(sh.nets)} nets, {nh} crossings; "
          + (", ".join(f"{k} {v}" for k, v in sorted(kinds.items())) or "lint clean"))
    if a.hops:
        for name, c in hop_table(sh).most_common(25):
            print(f"  {c:4d}  {name}")

    b = _browser()
    if not b:
        print("(no Edge/Chrome found: svg only)")
        return
    png = OUT / f"{a.sheet}.png"
    _headless(b, svg, sh.w, sh.h, png=png, png_w=int(sh.w * a.scale))
    print(f"preview  {png}")
    if a.crops:
        from PIL import Image                   # only needed for crops
        cols, rows = map(int, a.crops.lower().split("x"))
        full = OUT / f"{a.sheet}_full.png"
        _headless(b, svg, sh.w, sh.h, png=full, png_w=int(sh.w))
        im = Image.open(full)
        cw, ch = im.size[0] / cols, im.size[1] / rows
        ov = 0.06                               # overlap so nothing hides on a seam
        for r in range(rows):
            for c in range(cols):
                box = (int(max(0, (c - ov) * cw)), int(max(0, (r - ov) * ch)),
                       int(min(im.size[0], (c + 1 + ov) * cw)),
                       int(min(im.size[1], (r + 1 + ov) * ch)))
                p = OUT / f"{a.sheet}_c{r}{c}.png"
                im.crop(box).save(p)
                print(f"crop     {p}")


if __name__ == "__main__":
    main()
