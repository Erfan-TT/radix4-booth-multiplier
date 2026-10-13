"""Build the Booth multiplier RTL schematics.

    python tools/build_schematics.py           # -> Claude_outputs_schematics/*.drawio|svg|pdf|png
    python tools/build_schematics.py decode    # one sheet
    python tools/verify_schematics.py          # independent checks
    python tools/lint_schematic.py decode      # readability checks (spacing, clearance)

Each sheet is emitted from one geometry model: an editable .drawio page, a
print-ready .svg, a .pdf for the report and a .png preview.  Standard library
only, except for the PDF/PNG: cairosvg makes the PDF if it is installed;
otherwise a headless Edge or Chrome, if one is found, prints the PDF and takes
the PNG.  With neither, those two are skipped with a note.
"""
import os, shutil, subprocess, sys, tempfile, time
from pathlib import Path
sys.path.insert(0, str(Path(__file__).parent))
import sheets

OUT = Path(__file__).resolve().parents[1]          # Claude_outputs_schematics/

# printable area in points, 10 mm margins all round
PAGES = {"A3L": (1190.55 - 56.7, 841.89 - 56.7),
         "A4L": (841.89 - 56.7, 595.28 - 56.7),
         "A4P": (595.28 - 56.7, 841.89 - 56.7)}

PNG_WIDTH = 2600                                    # preview width in px

_BROWSERS = [
    r"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe",
    r"C:\Program Files\Microsoft\Edge\Application\msedge.exe",
    r"C:\Program Files\Google\Chrome\Application\chrome.exe",
    "/usr/bin/chromium", "/usr/bin/google-chrome", "/usr/bin/microsoft-edge",
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome",
]


def _browser():
    for b in _BROWSERS + [shutil.which(n) or "" for n in
                          ("msedge", "chrome", "chromium", "google-chrome")]:
        if b and os.path.exists(b):
            return b
    return None


def _headless(browser, svg, w, h, pdf=None, png=None, png_w=PNG_WIDTH):
    """Print the SVG to a one-page PDF and/or screenshot it to a PNG."""
    uri = svg.resolve().as_uri()
    with tempfile.TemporaryDirectory() as tmp:
        if pdf:
            page = Path(tmp) / "page.html"
            page.write_text(
                f"<html><head><style>@page{{size:{w}px {h}px;margin:0}}"
                f"html,body{{margin:0}}</style></head><body>"
                f"<img src='{uri}' style='display:block;width:{w}px;height:{h}px'>"
                f"</body></html>", encoding="utf-8")
            subprocess.run([browser, "--headless=new", "--disable-gpu",
                            "--allow-file-access-from-files", "--no-pdf-header-footer",
                            f"--print-to-pdf={pdf}", page.as_uri()],
                           capture_output=True, timeout=120)
        if png:
            ph = round(png_w * h / w)
            page = Path(tmp) / "shot.html"
            page.write_text(
                f"<html><body style='margin:0;background:#fff'>"
                f"<img src='{uri}' style='display:block;width:{png_w}px;height:{ph}px'>"
                f"</body></html>", encoding="utf-8")
            subprocess.run([browser, "--headless=new", "--disable-gpu",
                            "--hide-scrollbars", "--allow-file-access-from-files",
                            f"--window-size={png_w},{ph}", f"--screenshot={png}",
                            page.as_uri()], capture_output=True, timeout=120)


def _a3_pdf(browser, svg, pdf):
    """the sheet on an exact A3 landscape page, 10 mm margins, scaled to fit"""
    uri = svg.resolve().as_uri()
    with tempfile.TemporaryDirectory() as tmp:
        page = Path(tmp) / "a3.html"
        page.write_text(
            "<html><head><style>@page{size:420mm 297mm;margin:10mm}"
            "html,body{margin:0;width:400mm;height:277mm;display:flex;"
            "align-items:center;justify-content:center}"
            "img{max-width:400mm;max-height:277mm;width:auto;height:auto}</style></head>"
            f"<body><img src='{uri}'></body></html>", encoding="utf-8")
        subprocess.run([browser, "--headless=new", "--disable-gpu",
                        "--allow-file-access-from-files", "--no-pdf-header-footer",
                        f"--print-to-pdf={pdf}", page.as_uri()],
                       capture_output=True, timeout=120)


def build(fn, pdf=True):
    t = time.time()
    sh = fn()
    sh.route()
    stem = OUT / f"{sh.number}_{fn.__name__[6:]}"
    svg = stem.with_suffix(".svg")
    sh.to_svg(svg)
    sh.to_drawio(stem.with_suffix(".drawio"))
    note = ""
    if pdf:
        browser = _browser()
        try:
            import cairosvg
            kw = {}
            if sh.page:
                # emit the PDF on a real page, so \includegraphics is predictable
                pw, ph = PAGES[sh.page]                 # points
                k = min(pw / sh.w, ph / sh.h) / 0.75    # cairosvg works in px
                kw = dict(output_width=sh.w * k, output_height=sh.h * k)
                note = f"  ({sh.page})"
            cairosvg.svg2pdf(url=str(svg), write_to=str(stem.with_suffix(".pdf")), **kw)
            if browser:
                _headless(browser, svg, sh.w, sh.h, png=stem.with_suffix(".png"))
        except ImportError:
            if browser:
                w, h = sh.w, sh.h
                if sh.page:
                    pw, ph = PAGES[sh.page]
                    k = min(pw / w, ph / h) / 0.75
                    w, h = round(w * k), round(h * k)
                    note = f"  ({sh.page})"
                _headless(browser, svg, w, h, pdf=stem.with_suffix(".pdf"),
                          png=stem.with_suffix(".png"))
                note += "  (pdf/png via headless browser)"
            else:
                note = "  (no cairosvg, no browser: pdf/png skipped)"
    if getattr(sh, "a3", False) and stem.name.endswith("_a3"):
        # a dedicated print layout: its PDF is the exact A3 page
        browser = _browser()
        if browser:
            _a3_pdf(browser, svg, stem.with_suffix(".pdf"))
            note += "  (A3 page)"
    elif getattr(sh, "a3", False) or sh.page == "A3L":
        # the print build: the same drawing, on an exact A3 landscape page
        a3 = OUT / f"{stem.name}_a3"
        shutil.copyfile(svg, a3.with_suffix(".svg"))
        shutil.copyfile(stem.with_suffix(".drawio"), a3.with_suffix(".drawio"))
        browser = _browser()
        if browser:
            _a3_pdf(browser, svg, a3.with_suffix(".pdf"))
            note += "  + _a3"
    print(f"{sh.number}  {fn.__name__[6:]:<10} {len(sh.syms):3d} symbols "
          f"{len(sh.nets):3d} nets  {int(sh.w)}x{int(sh.h)}  {time.time()-t:4.1f}s{note}")


if __name__ == "__main__":
    OUT.mkdir(exist_ok=True)
    only = sys.argv[1:]          # build one sheet: build_schematics.py controlpath_a3
    for name in sorted(dir(sheets)):
        if name.startswith("sheet_") and (not only or name[6:] in only):
            build(getattr(sheets, name))
