#!/usr/bin/env python3
"""
Pareto plots for the Booth multiplier synthesis sweep.

Reads the Design Compiler reports directly -- no intermediate CSV needed, so it
works straight after synthesis.tcl finishes. Power columns are picked up from
reports_power/<cfg>/results_<cfg>.csv when that file exists, and quietly skipped
when it does not.

    python3 plot_pareto.py                      # default: syn/reports_area_zero
    python3 plot_pareto.py syn/reports_no_area_constraint
    python3 plot_pareto.py syn/reports_area_zero -o ../docs/figures

Two things this script is careful about:

  * Points that did not meet timing are NOT plotted as achievable design points.
    A netlist with negative slack is functionally fine but it does not run at
    the period it was constrained to, so putting it on a Pareto curve is a lie.
    Violating points are drawn faintly so you can still see where the wall is.

  * compile_ultra is not monotonic in the clock constraint -- a looser period
    can give a larger design. The solid line is therefore the Pareto FRONT
    (non-dominated met-timing points), not the raw per-period numbers.
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
# presentation: short names, fixed colours, and a dash pattern per series so
# the plot survives being printed in black and white
# --------------------------------------------------------------------------

STYLE = {
    "CFG_BOOTHMUL_REG_WAL_BASE":       ("Wallace baseline",        "#2a78d6", "-"),
    "CFG_BOOTHMUL_REG_WAL_OPT":        ("Wallace + sign-ext elim", "#eb6834", (0, (6, 2))),
    "CFG_BOOTHMUL_REG_DADDA":          ("Dadda",                   "#1baf7a", "-"),
    "CFG_BOOTHMUL_REG_DADDA_FUSED_SEL":("Dadda + fused selector",  "#4a3aa7", "-"),
    "CFG_BOOTHMUL_REG_BEH":            ("Behavioural Booth",       "#eda100", (0, (3, 2))),
    "CFG_REG_SUPER_BEH":               ("A*B (DesignWare)",        "#e87ba4", (0, (5, 3))),
}
FALLBACK = ("#888780", "-")

# draw order, so the interesting curves land on top
ORDER = list(STYLE.keys())


def style_for(cfg):
    if cfg in STYLE:
        return STYLE[cfg]
    return (cfg, *FALLBACK)


# --------------------------------------------------------------------------
# report parsing
# --------------------------------------------------------------------------

def grab(pattern, text):
    m = re.search(pattern, text)
    return float(m.group(1)) if m else None


def read_reports(reports_dir):
    """{config: [ {period, area, slack, cp, comb, seq}, ... ]} sorted by period."""
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

            timing_rpt = area_rpt.with_name(area_rpt.name.replace("area_", "timing_", 1))
            qor_rpt = area_rpt.with_name(area_rpt.name.replace("area_", "qor_", 1))
            if not (timing_rpt.exists() and qor_rpt.exists()):
                continue

            a = area_rpt.read_text(errors="ignore")
            t = timing_rpt.read_text(errors="ignore")
            q = qor_rpt.read_text(errors="ignore")

            points.append({
                "period": period,
                "area":   grab(r"Total cell area:\s+([\d.]+)", a),
                "comb":   grab(r"Number of combinational cells:\s+(\d+)", a),
                "seq":    grab(r"Number of sequential cells:\s+(\d+)", a),
                "slack":  grab(r"slack \((?:MET|VIOLATED)\)\s+(-?[\d.]+)", t),
                "cp":     grab(r"Critical Path Length:\s+([\d.]+)", q),
            })

        if points:
            data[cfg_dir.name] = sorted(points, key=lambda r: r["period"])

    if not data:
        sys.exit(f"no readable reports under {reports_dir}")
    return data


def read_power(cfg, syn_dir):
    """{period: total_power_W} from the optional power CSV, or {}."""
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
# a design point only counts if it met timing; the front is the non-dominated
# subset of those, walking from the tightest period upwards
# --------------------------------------------------------------------------

def pareto_front(points, xkey="period", ykey="area"):
    met = [p for p in points if p["slack"] is not None and p["slack"] >= 0]
    met.sort(key=lambda p: p[xkey])
    front, best = [], float("inf")
    for p in met:
        if p[ykey] is not None and p[ykey] < best:
            front.append(p)
            best = p[ykey]
    return front


# --------------------------------------------------------------------------
# plotting
# --------------------------------------------------------------------------

def setup_axes(ax, xlabel, ylabel, title):
    ax.set_xlabel(xlabel, fontsize=10, color="#52514e")
    ax.set_ylabel(ylabel, fontsize=10, color="#52514e")
    ax.set_title(title, fontsize=12, loc="left", pad=12)
    ax.grid(True, axis="y", color="#e1e0d9", linewidth=0.8)
    ax.set_axisbelow(True)
    for side in ("top", "right"):
        ax.spines[side].set_visible(False)
    for side in ("left", "bottom"):
        ax.spines[side].set_color("#c3c2b7")
    ax.tick_params(colors="#898781", labelsize=9)


def plot_area_vs_period(data, out_png, annotate_min=True):
    fig, ax = plt.subplots(figsize=(9.5, 5.6))

    for cfg in [c for c in ORDER if c in data] + [c for c in data if c not in ORDER]:
        label, colour, dash = style_for(cfg)
        pts = data[cfg]

        viol = [p for p in pts if p["slack"] is not None and p["slack"] < 0]
        if viol:
            ax.scatter([p["period"] for p in viol], [p["area"] for p in viol],
                       s=14, facecolors="none", edgecolors=colour,
                       alpha=0.30, linewidths=0.9, zorder=2)

        front = pareto_front(pts)
        if not front:
            continue
        ax.plot([p["period"] for p in front], [p["area"] for p in front],
                marker="o", markersize=4.5, linewidth=2,
                color=colour, linestyle=dash, label=label, zorder=3)

        if annotate_min:
            fastest = front[0]
            ax.annotate(f"{fastest['period']:.1f} ns",
                        (fastest["period"], fastest["area"]),
                        textcoords="offset points", xytext=(6, 7),
                        fontsize=8, color=colour)

    setup_axes(ax, "clock period met [ns]", "total cell area [um2]",
               "Pareto front: area vs achieved clock period\n"
               "solid = met timing (non-dominated)   hollow = timing violated")
    ax.yaxis.set_major_formatter(FuncFormatter(lambda v, _: f"{v:,.0f}"))
    ax.legend(frameon=False, fontsize=9, loc="upper right")
    fig.tight_layout()
    fig.savefig(out_png, dpi=160)
    plt.close(fig)
    print("saved", out_png)


def plot_power_vs_period(data, syn_dir, out_png):
    have = {cfg: read_power(cfg, syn_dir) for cfg in data}
    if not any(have.values()):
        print("no power CSVs found -- skipping the power plot")
        return

    fig, ax = plt.subplots(figsize=(9.5, 5.6))
    for cfg in [c for c in ORDER if c in data] + [c for c in data if c not in ORDER]:
        pw = have.get(cfg) or {}
        if not pw:
            continue
        label, colour, dash = style_for(cfg)
        front = pareto_front(data[cfg])
        xs = [p["period"] for p in front if p["period"] in pw]
        ys = [pw[p["period"]] * 1e3 for p in front if p["period"] in pw]
        if xs:
            ax.plot(xs, ys, marker="o", markersize=4.5, linewidth=2,
                    color=colour, linestyle=dash, label=label)

    setup_axes(ax, "clock period met [ns]", "total power [mW]",
               "Total power vs achieved clock period")
    ax.legend(frameon=False, fontsize=9, loc="upper right")
    fig.tight_layout()
    fig.savefig(out_png, dpi=160)
    plt.close(fig)
    print("saved", out_png)


def print_table(data):
    print()
    print(f"{'configuration':<34}{'min period':>11}{'area @min':>11}"
          f"{'best area':>11}{'at period':>11}{'best CP':>9}")
    print("-" * 87)
    for cfg in [c for c in ORDER if c in data] + [c for c in data if c not in ORDER]:
        front = pareto_front(data[cfg])
        label = style_for(cfg)[0]
        if not front:
            print(f"{label:<34}{'never met timing':>53}")
            continue
        fastest, smallest = front[0], front[-1]
        best_cp = min(p["cp"] for p in data[cfg] if p["cp"] is not None)
        print(f"{label:<34}{fastest['period']:>10.1f}{fastest['area']:>11.1f}"
              f"{smallest['area']:>11.1f}{smallest['period']:>11.1f}{best_cp:>9.2f}")

    ref = "CFG_REG_SUPER_BEH"
    base = "CFG_BOOTHMUL_REG_WAL_BASE"
    if ref in data and base in data:
        fb = pareto_front(data[base])
        fr = pareto_front(data[ref])
        if fb and fr:
            b, r = fb[-1]["area"], fr[-1]["area"]
            print(f"\n  reference gap: baseline {b:.1f} -> DesignWare {r:.1f}  = {b - r:.1f} um2")
            for cfg in data:
                if cfg in (ref, base):
                    continue
                f = pareto_front(data[cfg])
                if not f:
                    continue
                v = f[-1]["area"]
                print(f"    {style_for(cfg)[0]:<28} {v:8.1f}   closes {100*(b-v)/(b-r):5.1f}% "
                      f"of the gap   ({100*(v/r-1):+6.1f}% vs DesignWare)")


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("reports", nargs="?", default="syn/reports_area_zero",
                    help="directory holding one subdirectory per configuration")
    ap.add_argument("-o", "--outdir", default=".", help="where to write the PNGs")
    args = ap.parse_args()

    data = read_reports(args.reports)
    outdir = Path(args.outdir)
    outdir.mkdir(parents=True, exist_ok=True)
    suffix = Path(args.reports).name.replace("reports_", "")

    print(f"read {len(data)} configurations from {args.reports}")
    for cfg, pts in data.items():
        met = sum(1 for p in pts if p["slack"] is not None and p["slack"] >= 0)
        print(f"  {cfg:<36} {len(pts):>3} points, {met:>3} met timing")

    print_table(data)
    plot_area_vs_period(data, outdir / f"pareto_area_vs_period_{suffix}.png")
    plot_power_vs_period(data, Path(args.reports).parent,
                         outdir / f"pareto_power_vs_period_{suffix}.png")


if __name__ == "__main__":
    main()
