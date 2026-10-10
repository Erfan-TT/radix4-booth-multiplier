# Physical design

Place and route of the synthesized netlists with Cadence Innovus (Nangate
45 nm), followed by post-layout simulation and power, to redraw the
synthesis Pareto curves after layout.

Each netlist is placed and routed at the period it achieved in synthesis.
After routing, its achieved period is again `clock - slack`. The netlist is
simulated at that period with its routed SDF, and the VCD gives the power.

## Run

From this directory, after `setinnovus` and the ModelSim setup:

```bash
./run_pd.sh                                      # place and route every netlist
cd sim && vsim -c -do sim_postlayout.do && cd ..  # simulate every routed netlist
./run_power.sh                                   # power from the simulation VCD
python3 collect_pd_results.py                    # results/<cfg>/results_<cfg>.csv
cd ../synthesis && python3 plot_pareto.py --pd-results ../physical_design/results -o ../docs/figures
```

Each step skips the runs it has already done.

To run one netlist step by step in the GUI (type `resume` at every stop):

```bash
mkdir -p runs/test && cd runs/test
innovus -files ../../scripts/innovus_script.tcl
```

This uses the fused selector at 3.0 ns. Set `PD_CFG`, `PD_PERIOD` and
`PD_CLOCK` in the shell to choose another netlist.

## Files

```text
run_pd.sh, run_power.sh       loops over the netlists / the runs
collect_pd_results.py         runs/ -> results/
scripts/innovus_script.tcl    the flow, settings at the top
scripts/boothmul.globals      design import (netlist, LEF, libraries)
scripts/Default.view          MMMC: libraries, RC corners, views
scripts/power_postlayout.tcl  power from the VCD
sim/sim_postlayout.do         routed netlist + SDF, timing checks on
runs/<cfg>_<period>/          reports/, outputs/ (netlist, SDF, SPEF, SDC)
```

The constraints of each run are the synthesis SDC with the run's clock,
without `set_ideal_network`, `set_dont_touch_network` and `set_max_area`.
