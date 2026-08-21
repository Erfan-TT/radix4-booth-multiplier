import csv
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt



# Directory containing this Python script
config_file = "config.txt"

with open(config_file) as f:
    configs = f.read().split()

print("Configurations:")
for configuration in configs:
    print("  " + configuration)


 
def make_plot(x, y, labels, xlabel, ylabel, title, filename):
    plt.figure()
    plt.plot(x, y, marker="o")

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
    plt.savefig(filename, dpi=150)
    plt.close()

    print("saved " + str(filename))




 
# Loop through configurations
for configuration in configs:

    print()
    print("================================================")
    print("Configuration:", configuration)
    print("================================================")

    # CSV:
    # ./syn/$configuration/results_$configuration.csv
    csv_file = ("syn"/configuration/f"results_{configuration}.csv")

   
    # Data arrays for this configuration
    period = []
    achieved = []
    area = []
    dynamic = []
    leakage = []
    total = []


    # Read CSV
    with open(csv_file) as f:
        for row in csv.DictReader(f):
            period.append(float(row["period_ns"]))
            achieved.append(float(row["achieved_ns"]))
            area.append(float(row["area_um2"]))
            dynamic.append(float(row["dynamic_power"]))
            leakage.append(float(row["leakage_power"]))
            total.append(
                float(row["dynamic_power"])
                + float(row["leakage_power"])
            )


    # Print table
    print("period  achieved      area      dynamic      leakage")

    for i in range(len(period)):
        print(
            "%6.1f  %8.3f  %9.1f  %11.3e  %11.3e"
            % (
                period[i],
                achieved[i],
                area[i],
                dynamic[i],
                leakage[i]
            )
        )

    # Make and save the plots
    make_plot(
        achieved,
        area,
        period,
        "achieved clock period [ns]",
        "area [um2]",
        f"{configuration} : area vs delay",
        f"pareto_area_vs_delay_{configuration}.png"
    )

    make_plot(
        achieved,
        total,
        period,
        "achieved clock period [ns]",
        "total power",
        f"{configuration} : power vs delay",
        f"pareto_power_vs_delay_{configuration}.png"
    )

    make_plot(
        total,
        area,
        period,
        "total power",
        "area [um2]",
        f"{configuration} : area vs power",
        f"pareto_area_vs_power_{configuration}.png"
    )