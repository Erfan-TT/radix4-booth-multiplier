# Synthesis and post-synthesis power flow

This directory contains the reproducible area, timing, and dynamic-power flow.
All stages read `sweep_config.tcl`, which defines the six configurations and
the requested clock periods.

## Directory layout

```text
synthesis/
  sweep_config.tcl              shared configurations and periods
  plot_pareto.py                area, power and energy plots
  sim/
    sim.do                      gate-level SDF simulation and VCD capture
    tb_boothmul_registered.vhd  500-vector registered-multiplier workload
  syn/
    synthesis.tcl               Design Compiler synthesis sweep
    extract_achieved_periods.tcl
    power_analysis.tcl          SAIF-annotated Power Compiler analysis
    boothmul_registered.sdc
    netlist/                    generated Verilog; SDC/SDF are ignored
    reports/                    canonical synthesis reports
    reports_power/              canonical post-synthesis power reports
```

The report tree contains only the canonical timing/area sweep and the matching
activity-based power results.

## Reproduce the flow

Run all commands from the directory shown in each block.

### 1. Synthesize every configuration

```tcl
cd synthesis/syn
dc_shell -f synthesis.tcl
```

Each point produces a mapped Verilog netlist, SDC, SDF, and timing/area reports.

### 2. Export achieved periods

```tcl
cd synthesis/syn
dc_shell -f extract_achieved_periods.tcl
```

For each fixed netlist:

`achieved period = requested period - setup slack`

The generated CSVs are written below `syn/reports/achieved_clk/`.

### 3. Run gate-level activity simulation

```tcl
cd synthesis/sim
vsim -c -do sim.do
```

The testbench runs 500 deterministic operand pairs. Each netlist uses its
derived achieved period, its matching maximum-delay SDF, and its own work
library. The simulation records internal activity to VCD.

### 4. Measure power

```tcl
cd synthesis/syn
dc_shell -f power_analysis.tcl
```

The script converts each VCD to SAIF, annotates the mapped netlist, and invokes
the Power Compiler `report_power` engine. It records dynamic power, leakage
power, achieved period, and cell area in
`reports_power/<configuration>/results_<configuration>.csv`.

All 120 committed activity reports show 100% annotation of nets, ports, and
pins. The shared sweep now also includes the 2.1 ns target, so a complete
rerun will produce 21 power points per configuration. The results are in the
main README.

### 5. Generate Pareto figures

```bash
cd synthesis
python3 plot_pareto.py syn/reports \
  --power-reports syn/reports_power \
  -o ../docs/figures --zoom 1.7 3.1
```

Area and dynamic power are drawn as Pareto fronts against the achieved
period. Energy per multiplication (power times period) is drawn for every
netlist, ordered by period.

## Physical design

The netlists in `syn/netlist/` are the input of the Innovus flow in
`../physical_design/`. Its results show that the `5K_hvratio_1_4` wire-load
model is pessimistic, so the absolute periods of this sweep are conservative.
See the Physical design section of the main README.
