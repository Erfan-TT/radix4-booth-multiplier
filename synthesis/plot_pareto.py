import csv
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt


# Configuration file
config_file = "configs.txt"

with open(config_file) as f:
    configs = f.read().split()

print("Configurations:")
for configuration in configs:
    print("  " + configuration)


def make_plot(x, y, labels, xlabel, ylabel, title, filename):
    plt.figure()

    plt.plot(
        x,
        y,
        marker="o"
    )

    # Add period_ns beside every point
    for i in range(len(x)):
        plt.annotate(
            "%g" % labels[i],
            (x[i], y[i]),
            textcoords="offset points",
            xytext=(5, 5),
            fontsize=8
        )

    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.title(title)
    plt.grid(True)

    plt.tight_layout()
    plt.savefig(filename, dpi=150)
    plt.close()

    print("saved", filename)


# ============================================================
# Loop through all configurations
# ============================================================

for configuration in configs:

    print()
    print("================================================")
    print("Configuration:", configuration)
    print("================================================")

    # Expected CSV location:
    #
    # syn/reports_power/<configuration>/results_<configuration>.csv
    #
    csv_file = (
        Path("syn")
        / "reports_power"
        / configuration
        / f"results_{configuration}.csv"
    )

    print("Reading:", csv_file)

    # Check that the CSV exists
    if not csv_file.exists():
        print("WARNING: CSV file does not exist:")
        print(" ", csv_file)
        print("Skipping this configuration.")
        continue

    # --------------------------------------------------------
    # Data arrays for this configuration
    # --------------------------------------------------------

    period = []
    slack = []
    achieved = []
    area = []
    dynamic = []
    leakage = []
    total = []

    # --------------------------------------------------------
    # Read CSV
    # --------------------------------------------------------

    with open(csv_file, newline="") as f:
        reader = csv.DictReader(f)

        print("CSV columns:", reader.fieldnames)

        for row in reader:

            period.append(
                float(row["period_ns"])
            )

            slack.append(
                float(row["slack_ns"])
            )

            achieved.append(
                float(row["achieved_ns"])
            )

            area.append(
                float(row["area_um2"])
            )

            dynamic.append(
                float(row["dynamic_power_W"])
            )

            leakage.append(
                float(row["leakage_power_W"])
            )

            total_power = (
                float(row["dynamic_power_W"])
                + float(row["leakage_power_W"])
            )

            total.append(total_power)

    # --------------------------------------------------------
    # Print table
    # --------------------------------------------------------

    print()
    print(
        "period    slack   achieved        area"
        "       dynamic       leakage         total"
    )

    for i in range(len(period)):
        print(
            "%6.1f  %7.4f  %8.4f  %10.2f"
            "  %12.6e  %12.6e  %12.6e"
            % (
                period[i],
                slack[i],
                achieved[i],
                area[i],
                dynamic[i],
                leakage[i],
                total[i]
            )
        )

    # --------------------------------------------------------
    # Plot 1: Area vs delay
    # --------------------------------------------------------

    make_plot(
        achieved,
        area,
        period,
        "Achieved clock period [ns]",
        "Area [um2]",
        f"{configuration} : Area vs Delay",
        f"pareto_area_vs_delay_{configuration}.png"
    )

    # --------------------------------------------------------
    # Plot 2: Power vs delay
    # --------------------------------------------------------

    make_plot(
        achieved,
        total,
        period,
        "Achieved clock period [ns]",
        "Total power [W]",
        f"{configuration} : Power vs Delay",
        f"pareto_power_vs_delay_{configuration}.png"
    )

    # --------------------------------------------------------
    # Plot 3: Area vs power
    # --------------------------------------------------------

    make_plot(
        total,
        area,
        period,
        "Total power [W]",
        "Area [um2]",
        f"{configuration} : Area vs Power",
        f"pareto_area_vs_power_{configuration}.png"
    )


print()
print("================================================")
print("All configurations processed.")
print("================================================")