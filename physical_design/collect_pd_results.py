#!/usr/bin/env python3
"""Collect the runs in runs/ into results/<cfg>/results_<cfg>.csv.

The CSVs have the same columns as synthesis/syn/reports_power, so
synthesis/plot_pareto.py --pd-results results draws the post-layout fronts.
"""

import csv
import re
from pathlib import Path

RUNS = Path(__file__).resolve().parent / "runs"
RESULTS = Path(__file__).resolve().parent / "results"


def read(path):
    return path.read_text(errors="replace") if path.exists() else ""


def number(pattern, text):
    m = re.search(pattern, text)
    return float(m.group(1)) if m else None


rows = {}
for run in sorted(RUNS.iterdir()):
    info = dict(line.split() for line in read(run / "outputs/run_info.txt").splitlines())
    slk = read(run / "reports/timing/10_final.slk").splitlines()
    if not info or len(slk) < 2:
        continue                                   # not finished

    # worst setup slack: third field of the first path, "rise/fall"
    wns = min(float(s) for s in slk[1].split()[2].split("/") if s != "*")
    clock = float(info["clock"])

    area = number(r"boothmul_registered\s+\d+\s+([0-9.]+)", read(run / "reports/10_area.rpt"))

    # power only if the post-layout simulation had no error
    power = read(run / "reports/12_power_vcd.rpt")
    sim = read(run / "reports/12_sim.txt").split()
    dynamic = leakage = ""
    if power and sim and sim[1] == "0":
        internal = number(r"Total Internal Power:\s*([0-9.eE+-]+)", power)
        switching = number(r"Total Switching Power:\s*([0-9.eE+-]+)", power)
        leakage = number(r"Total Leakage Power:\s*([0-9.eE+-]+)", power) * 1e-3   # mW -> W
        dynamic = (internal + switching) * 1e-3

    rows.setdefault(info["cfg"], []).append(
        [float(info["period"]), wns, round(clock - wns, 4), area, dynamic, leakage])

print(f"{'run':<44}{'T0 routed':>10}{'area':>9}{'dyn mW':>9}")
for cfg, points in rows.items():
    points.sort()
    (RESULTS / cfg).mkdir(parents=True, exist_ok=True)
    with open(RESULTS / cfg / f"results_{cfg}.csv", "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["period_ns", "slack_ns", "achieved_ns", "area_um2",
                         "dynamic_power_W", "leakage_power_W"])
        writer.writerows(points)
    for period, wns, achieved, area, dynamic, leakage in points:
        name = f"{cfg}_{str(period).replace('.', 'p')}"
        dyn = f"{dynamic * 1e3:.2f}" if dynamic != "" else "-"
        print(f"{name:<44}{achieved:>10.3f}{area:>9.0f}{dyn:>9}")

print(f"\nwritten {RESULTS}")
