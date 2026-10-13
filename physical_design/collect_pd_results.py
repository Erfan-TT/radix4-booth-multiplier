#!/usr/bin/env python3
"""Collect the runs in runs/ into results/<cfg>/results_<cfg>.csv.

The CSVs have the same columns as synthesis/syn/reports_power, so
synthesis/plot_pareto.py --pd-results results draws the post-layout fronts.
The extra column achieved_slow_ns is the period at the slow corner.
"""

import csv
import gzip
import re
from pathlib import Path

RUNS = Path(__file__).resolve().parent / "runs"
RESULTS = Path(__file__).resolve().parent / "results"


def read(path):
    if not path.exists():
        return ""
    if path.suffix == ".gz":
        return gzip.open(path, "rt", errors="replace").read()
    return path.read_text(errors="replace")


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

    # setup slack of the slow corner (step 11, view "worst")
    wns_slow = number(r"[|]worst\s+[|]\s*(-?[0-9.]+)",
                      read(run / "reports/timing/11_corners.summary.gz"))
    slow = round(clock - wns_slow, 4) if wns_slow is not None else ""

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
        [float(info["period"]), wns, round(clock - wns, 4), area, dynamic, leakage, slow])

print(f"{'configuration':<36}{'runs':>5}{'fastest typ':>13}{'fastest slow':>14}{'min area':>10}")
for cfg, points in rows.items():
    points.sort()
    (RESULTS / cfg).mkdir(parents=True, exist_ok=True)
    with open(RESULTS / cfg / f"results_{cfg}.csv", "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["period_ns", "slack_ns", "achieved_ns", "area_um2",
                         "dynamic_power_W", "leakage_power_W", "achieved_slow_ns"])
        writer.writerows(points)
    fastest = min(p[2] for p in points)
    slowest = min(p[6] for p in points if p[6] != "")
    print(f"{cfg:<36}{len(points):>5}{fastest:>13.3f}{slowest:>14.3f}"
          f"{min(p[3] for p in points):>10.0f}")

print(f"\nwritten {RESULTS}")
