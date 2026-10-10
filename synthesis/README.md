# Synthesis and post-synthesis power flow

This directory contains the reproducible area, timing, and dynamic-power flow.
All stages read `sweep_config.tcl`, which defines the six configurations and
the requested clock periods.

## Directory layout

```text
synthesis/
  sweep_config.tcl              shared configurations and periods
  plot_pareto.py                area-latency and power-latency Pareto plots
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

The common 3.0 ns target provides a direct area and power comparison:

| Variant | Achieved period | Area | Dynamic | Leakage | Total power |
| :-- | --: | --: | --: | --: | --: |
| Wallace baseline | 3.000 ns | 6501 um^2 | 9.38 mW | 0.148 mW | 9.53 mW |
| + sign-extension elimination | 3.000 ns | 6196 um^2 | 8.58 mW | 0.138 mW | 8.72 mW |
| + Dadda reduction | 2.993 ns | 5725 um^2 | 8.25 mW | 0.129 mW | 8.38 mW |
| **+ fused selector** | **2.983 ns** | **5125 um^2** | **4.61 mW** | **0.119 mW** | **4.73 mW** |
| Behavioural Booth | 2.998 ns | 7229 um^2 | 5.87 mW | 0.158 mW | 6.03 mW |
| Inferred `A * B` | 2.998 ns | 4910 um^2 | 3.22 mW | 0.103 mW | 3.32 mW |

Dynamic power combines internal and switching power. Total power is dynamic
plus leakage. At this target, the fused selector reduces area by **21.2%** and
total power by **50.3%** relative to the Wallace baseline.

All 120 committed activity reports from the original 20-point power run show
100% annotation of nets, ports, and pins. The shared sweep now also includes
the 2.1 ns target, so a complete rerun will produce 21 power points per
configuration.

### 5. Generate Pareto figures

```bash
cd synthesis
python3 plot_pareto.py syn/reports \
  --power-reports syn/reports_power \
  -o ../docs/figures --zoom 1.7 3.1
```

The script computes each Pareto front independently:

- area versus achieved period uses the synthesis reports;
- dynamic power versus achieved period uses the activity-annotated power CSVs.

Both objectives are minimized. Dominated netlists are omitted from the plotted
curves.

## Physical design

The netlists in `syn/netlist/` are the input of the Innovus flow in
`../physical_design/`. Each one is placed and routed at its achieved period
from `syn/reports/achieved_clk/`, with constraints made from
`syn/boothmul_registered.sdc`. Its post-layout results are written in the
format of `syn/reports_power/`, so `plot_pareto.py --pd-results` draws the
post-layout fronts. See `../physical_design/README.md`.

The first routed point, fused selector at 3.0 ns, shows that the
`5K_hvratio_1_4` wire-load model used here is pessimistic. The routed netlist
reaches `T0 = 2.218 ns`, against 2.983 ns estimated by synthesis. The absolute
periods of this sweep should therefore be read as conservative estimates.
See the Physical design section of the main README.
