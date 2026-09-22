#!/usr/bin/env python3
"""
Pareto plots for the Booth multiplier synthesis sweep.

Reads the Design Compiler reports directly -- no intermediate CSV -- so it works
straight after synthesis.tcl finishes. Power is picked up from
reports_power/<cfg>/results_<cfg>.csv when that file exists, skipped when not.

    python3 plot_pareto.py                          # syn/reports
    python3 plot_pareto.py syn/reports_no_area_constraint
    python3 plot_pareto.py syn/reports -o ../docs/figures
    python3 plot_pareto.py syn/reports --zoom 1.7 3.2

-------------------------------------------------------------------------------
Why the x axis is the ACHIEVED period, not the constraint
-------------------------------------------------------------------------------
For a fixed netlist, setup slack is linear in the clock period:

    slack(T) = T - (arrival + setup + uncertainty + output_delay + ...)
             = T - K            K constant for that netlist

so the period at which the netlist has exactly zero slack is

    achieved = T - slack(T)

That is an identity, not an estimate -- but only because boothmul_registered.sdc
uses ABSOLUTE input/output delays (0.25 / 0.15 ns). Had they been written as a
fraction of clockPeriod, K would move with T and this would be wrong. If you
ever change the SDC to percentage-based delays, this whole script becomes
invalid.

The practical consequence: a run that "violated timing" is not a failed run. It
produced a real netlist that simply runs slower than requested, and
(achieved, area) is a perfectly good design point. Discarding those points
throws away the fastest designs in the sweep, because DC only builds its most
aggressive netlists when you ask for a period it cannot reach.

Every constraint yields a DIFFERENT netlist -- this is not re-timing one design.
compile_ultra is also not monotonic in the constraint, so the solid line is the
Pareto FRONT over all runs: the non-dominated (achieved, area) pairs.
"""

import argparse
import csv
import re
import sys
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.ticker import FuncFormatter


# --------------------------------------------------------------------------
# presentation: short names, fixed colours, dash pattern per series so the
# plot survives being printed in black and white
# --------------------------------------------------------------------------

STYLE = {
    "CFG_BOOTHMUL_REG_WAL_BASE":        ("Wallace baseline",        "#2a78d6", "-"),
    "CFG_BOOTHMUL_REG_WAL_OPT":         ("Wallace + sign-ext elim", "#eb6834", (0, (6, 2))),
    "CFG_BOOTHMUL_REG_DADDA":           ("Dadda",                   "#1baf7a", "-"),
    "CFG_BOOTHMUL_REG_DADDA_FUSED_SEL": ("Dadda + fused selector",  "#4a3aa7", "-"),
    "CFG_BOOTHMUL_REG_BEH":             ("Behavioural Booth",       "#eda100", (0, (3, 2))),
    "CFG_REG_SUPER_BEH":                ("A*B (DesignWare)",        "#e87ba4", (0, (5, 3))),
}
ORDER = list(STYLE.keys())
INK, MUTED, GRID, AXIS = "#0b0b0b", "#898781", "#e1e0d9", "#c3c2b7"


def style_for(cfg):
    return STYLE.get(cfg, (cfg, "#888780", "-"))


def ordered(data):
    return [c for c in ORDER if c in data] + [c for c in data if c not in ORDER]


# --------------------------------------------------------------------------
# report parsing
# --------------------------------------------------------------------------

def grab(pattern, text):
    m = re.search(pattern, text)
    return float(m.group(1)) if m else None


def read_reports(reports_dir):
    """{config: [ {period, achieved, area, slack, cp, comb, seq} ... ]}"""
    data = {}
    reports_dir = Path(reports_dir)
    if not reports_dir.is_dir():
        sys.exit(f"no such directory: {reports_dir}")

    for cfg_dir in sorted(p for p in reports_dir.iterdir() if p.is_dir()):
        points = []
        for area_rpt in sorted(cfg_dir.glob("area_*.rpt")):
            tag = re.search(r"_(\d+p\d+)\.rpt$", area_rpt.name)
            if not tag:
                continue
            period = float(tag.group(1).replace("p", "."))

            timing = area_rpt.with_name(area_rpt.name.replace("area_", "timing_", 1))
            qor = area_rpt.with_name(area_rpt.name.replace("area_", "qor_", 1))
            if not (timing.exists() and qor.exists()):
                continue

            a, t, q = (f.read_text(errors="ignore") for f in (area_rpt, timing, qor))
            slack = grab(r"slack \((?:MET|VIOLATED)\)\s+(-?[\d.]+)", t)
            area = grab(r"Total cell area:\s+([\d.]+)", a)
            if slack is None or area is None:
                continue

            points.append({
                "period":   period,
                "slack":    slack,
                "achieved": period - slack,      # the identity explained above
                "area":     area,
                "cp":       grab(r"Critical Path Length:\s+([\d.]+)", q),
                "comb":     grab(r"Number of combinational cells:\s+(\d+)", a),
                "seq":      grab(r"Number of sequential cells:\s+(\d+)", a),
            })

        if points:
            data[cfg_dir.name] = sorted(points, key=lambda r: r["achieved"])

    if not data:
        sys.exit(f"no readable reports under {reports_dir}")
    return data


def read_power(cfg, syn_dir):
    csv_file = Path(syn_dir) / "reports_power" / cfg / f"results_{cfg}.csv"
    if not csv_file.exists():
        return {}
    out = {}
    with open(csv_file, newline="") as f:
        for row in csv.DictReader(f):
            try:
                out[float(row["period_ns"])] = (float(row["dynamic_power_W"])
                                                + float(row["leakage_power_W"]))
            except (KeyError, ValueError):
                continue
    return out


# --------------------------------------------------------------------------
# every run is a usable design point at its own achieved period, so the front
# is simply the non-dominated subset: nothing to its left is also smaller
# --------------------------------------------------------------------------

def pareto_front(points):
    front, best = [], float("inf")
    for p in sorted(points, key=lambda r: r["achieved"]):
        if p["area"] < best:
            front.append(p)
            best = p["area"]
    return front


# --------------------------------------------------------------------------
# plotting
# --------------------------------------------------------------------------

def setup_axes(ax, xlabel, ylabel, title, subtitle=None):
    ax.set_xlabel(xlabel, fontsize=10, color="#52514e")
    ax.set_ylabel(ylabel, fontsize=10, color="#52514e")
    full = title if subtitle is None else f"{title}\n{subtitle}"
    ax.set_title(full, fontsize=12, loc="left", pad=12, color=INK)
    ax.grid(True, axis="y", color=GRID, linewidth=0.8)
    ax.set_axisbelow(True)
    for s in ("top", "right"):
        ax.spines[s].set_visible(False)
    for s in ("left", "bottom"):
        ax.spines[s].set_color(AXIS)
    ax.tick_params(colors=MUTED, labelsize=9)
    ax.yaxis.set_major_formatter(FuncFormatter(lambda v, _: f"{v:,.0f}"))


def draw(ax, data, annotate=True, dominated=True):
    for cfg in ordered(data):
        label, colour, dash = style_for(cfg)
        pts = data[cfg]
        front = pareto_front(pts)
        front_ids = {id(p) for p in front}

        if dominated:
            rest = [p for p in pts if id(p) not in front_ids]
            if rest:
                ax.scatter([p["achieved"] for p in rest], [p["area"] for p in rest],
                           s=13, facecolors="none", edgecolors=colour,
                           alpha=0.28, linewidths=0.9, zorder=2)

        ax.plot([p["achieved"] for p in front], [p["area"] for p in front],
                marker="o", markersize=4.5, linewidth=2,
                color=colour, linestyle=dash, label=label, zorder=3)

        if annotate and front:
            f = front[0]
            ax.annotate(f"{f['achieved']:.2f} ns",
                        (f["achieved"], f["area"]),
                        textcoords="offset points", xytext=(6, 7),
                        fontsize=8, color=colour)


def plot_full(data, out_png):
    fig, ax = plt.subplots(figsize=(9.5, 5.6))
    draw(ax, data)
    setup_axes(ax, "achieved clock period  (constraint - slack)  [ns]",
               "total cell area [um2]",
               "Area vs achieved clock period",
               "solid = Pareto front over all runs   hollow = dominated run")
    ax.legend(frameon=False, fontsize=9, loc="upper right")
    fig.tight_layout()
    fig.savefig(out_png, dpi=160)
    plt.close(fig)
    print("saved", out_png)


def plot_zoom(data, out_png, lo, hi, only=None):
    """only: list of config-name substrings to draw, so the window stays readable"""
    if only:
        data = {c: p for c, p in data.items() if any(k.lower() in c.lower() for k in only)}
    if not data:
        print("zoom: no configuration matched --zoom-only, skipping")
        return

    fig, ax = plt.subplots(figsize=(9.5, 5.6))
    # fronts are computed on the FULL data so the window does not invent a front
    for cfg in ordered(data):
        label, colour, dash = style_for(cfg)
        front = [p for p in pareto_front(data[cfg]) if lo <= p["achieved"] <= hi]
        if not front:
            continue
        ax.plot([p["achieved"] for p in front], [p["area"] for p in front],
                marker="o", markersize=6, linewidth=2.2,
                color=colour, linestyle=dash, label=label, zorder=3)
        for p in front:
            ax.annotate(f"{p['area']:,.0f}", (p["achieved"], p["area"]),
                        textcoords="offset points", xytext=(0, 9),
                        fontsize=7.5, color=colour, ha="center")

    ax.set_xlim(lo, hi)
    setup_axes(ax, "achieved clock period  (constraint - slack)  [ns]",
               "total cell area [um2]",
               f"Zoom: {lo}-{hi} ns",
               "the crossover: plain Dadda is smaller until ~2.6 ns, fused wins beyond it")
    ax.legend(frameon=False, fontsize=9, loc="upper right")
    fig.tight_layout()
    fig.savefig(out_png, dpi=160)
    plt.close(fig)
    print("saved", out_png)


def plot_power(data, syn_dir, out_png):
    have = {cfg: read_power(cfg, syn_dir) for cfg in data}
    if not any(have.values()):
        print("no power CSVs found -- skipping the power plot")
        return
    fig, ax = plt.subplots(figsize=(9.5, 5.6))
    for cfg in ordered(data):
        pw = have.get(cfg) or {}
        if not pw:
            continue
        label, colour, dash = style_for(cfg)
        pts = [p for p in pareto_front(data[cfg]) if p["period"] in pw]
        if pts:
            ax.plot([p["achieved"] for p in pts], [pw[p["period"]] * 1e3 for p in pts],
                    marker="o", markersize=4.5, linewidth=2,
                    color=colour, linestyle=dash, label=label)
    setup_axes(ax, "achieved clock period [ns]", "total power [mW]",
               "Total power vs achieved clock period")
    ax.legend(frameon=False, fontsize=9, loc="upper right")
    fig.tight_layout()
    fig.savefig(out_png, dpi=160)
    plt.close(fig)
    print("saved", out_png)


def print_table(data):
    print()
    print(f"{'configuration':<30}{'fastest':>9}{'area@fast':>11}"
          f"{'smallest':>10}{'at period':>11}{'front pts':>11}")
    print("-" * 82)
    for cfg in ordered(data):
        front = pareto_front(data[cfg])
        label = style_for(cfg)[0]
        f, s = front[0], front[-1]
        print(f"{label:<30}{f['achieved']:>8.2f}{f['area']:>11.1f}"
              f"{s['area']:>10.1f}{s['achieved']:>11.2f}{len(front):>11}")

    ref, base = "CFG_REG_SUPER_BEH", "CFG_BOOTHMUL_REG_WAL_BASE"
    if ref in data and base in data:
        b = pareto_front(data[base])[-1]["area"]
        r = pareto_front(data[ref])[-1]["area"]
        print(f"\n  reference gap: baseline {b:.1f} -> DesignWare {r:.1f} = {b - r:.1f} um2")
        for cfg in ordered(data):
            if cfg in (ref, base):
                continue
            v = pareto_front(data[cfg])[-1]["area"]
            print(f"    {style_for(cfg)[0]:<28}{v:9.1f}   closes {100*(b-v)/(b-r):5.1f}% "
                  f"of the gap   ({100*(v/r-1):+6.1f}% vs DesignWare)")


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("reports", nargs="?", default="syn/reports")
    ap.add_argument("-o", "--outdir", default=".")
    ap.add_argument("--zoom", nargs=2, type=float, metavar=("LO", "HI"),
                    default=[1.7, 3.2], help="window for the zoomed plot [ns]")
    ap.add_argument("--zoom-only", nargs="*", default=["DADDA", "SUPER_BEH"],
                    help="substrings of the configs to draw in the zoom "
                         "(default: the two Dadda variants + the DesignWare reference)")
    args = ap.parse_args()

    data = read_reports(args.reports)
    outdir = Path(args.outdir)
    outdir.mkdir(parents=True, exist_ok=True)
    tag = Path(args.reports).name.replace("reports_", "").replace("reports", "main")

    print(f"read {len(data)} configurations from {args.reports}")
    for cfg, pts in data.items():
        met = sum(1 for p in pts if p["slack"] >= 0)
        print(f"  {cfg:<36} {len(pts):>3} runs, {met:>3} met as constrained, "
              f"all {len(pts)} usable at their achieved period")

    print_table(data)
    plot_full(data, outdir / f"pareto_area_vs_achieved_{tag}.png")
    plot_zoom(data, outdir / f"pareto_zoom_{tag}.png", *args.zoom, only=args.zoom_only)
    plot_power(data, Path(args.reports).parent,
               outdir / f"pareto_power_vs_achieved_{tag}.png")


if __name__ == "__main__":
    main()
