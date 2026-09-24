# Radix-4 Booth Multiplier — 32-bit, Nangate 45 nm

A signed 32×32 multiplier in structural VHDL, plus three architectural
optimizations applied one at a time. Each variant is a different **architecture**
of the same entity, bound by a VHDL configuration — so all six variants share one
source tree, one testbench and one synthesis script.

A multiplier inferred by Design Compiler from a plain `A * B` is synthesised
under identical conditions as an absolute reference point.

| | |
|---|---|
| **Fastest achieved** | **1.76 ns** (reference: 1.63 ns) |
| **Smallest area** | **5029 µm²** (reference: 4441 µm²) |
| **Area gap to the reference closed** | **69.1%** |
| Verified | exhaustive at 8 bits, corners + 20 000 random at 32 bits |
| Swept | 6 variants × 21 clock periods = 126 synthesis runs |

📄 **[Report](docs/report.pdf)** — derivations, the Dadda schedule, methodology, provenance
🎞 **[Slides](docs/presentation.pdf)** — 26-slide summary
✏️ **[Schematic source](docs/schematic.drawio)** — editable in diagrams.net

> This README describes **what is in the repository and how to run it**.
> The derivations, the algorithm and the analysis are in the report; each
> section below links to the relevant part of it.

---

## Architecture

![Schematic](docs/figures/schematic-1.png)

| entity | file | what it does |
|---|---|---|
| `booth_encoder` | `rtl/multiplier/booth_encoder.vhd` | triplet of B → `sel = {neg, double, enable}` |
| `mux_and_shift` | `rtl/multiplier/mux_and_shift.vhd` | one partial-product row: `0`, `±A`, `±2A` |
| `corrector` | `rtl/multiplier/corrector.vhd` | the extra row: Booth `+1` bits and the bias constant |
| `reduction_tree` | `rtl/multiplier/reduction_tree.vhd` | wrapper; picks `wallace` or `dadda` |
| `wallace_tree` | `rtl/multiplier/wallace_tree.vhd` | 3:2 CSAs on whole rows |
| `dadda_tree` | `rtl/multiplier/dadda_tree.vhd` | per-column scheduling from the elaboration-time matrices |
| `CSA` | `rtl/multiplier/CSA.vhd` | one carry-save row, 2N full adders |
| `P4_adder` | `rtl/adder/P4_adder.vhd` | sparse-tree carry-propagate adder |
| `boothmul` | `rtl/multiplier/boothmul.vhd` | combinational top (`STRUCTURAL`, `BEHAVIOURAL`, `super_beh`) |
| `reg_N` | `rtl/multiplier/reg_N.vhd` | the input and output registers |
| `boothmul_registered` | `rtl/multiplier/boothmul_registered.vhd` | registered on both sides — the synthesis top |

*Report: §2 for the recoding and the datapath, §2.3 for why dropped carries are exact.*

---

## The variants

| architecture binding | what changes |
|---|---|
| `mux_and_shift(sign_extend)` + `corrector(sign_extend)` | baseline — rows sign-extended to 2N bits |
| `mux_and_shift(no_sign_extend)` + `corrector(no_sign_extend)` | Optimization 1 — one inverted bit + a constant |
| `mux_and_shift(fused_selector)` + `corrector(no_sign_extend)` | Optimization 3 — negation folded into the selection gate |
| `reduction_tree(wallace)` / `reduction_tree(dadda)` | Optimization 2 — uniform CSA rows vs per-column scheduling |
| `mux_and_shift(behavioural)` | `+` chain instead of a tree — inference comparison |
| `super_beh_multiplier_registered` | plain `A * B` — the inferred reference |

> ⚠️ **The mux and corrector architectures must stay paired.** `no_sign_extend`
> and `fused_selector` both bias each row by `+2^(2i+N)` and rely on
> `corrector(no_sign_extend)` to cancel it. The configurations pair them
> correctly; nothing in the language prevents a bad pairing.

> ⚠️ **`dadda` assumes the sign-extension-eliminated layout.**
> `making_inital_layer` hard-codes those column heights, so there is deliberately
> no baseline-plus-Dadda configuration.

*Report: §3 (Optimization 1), §4 (Optimization 2), §5 (Optimization 3), §A.3 for the configuration mechanism.*

---

## Results

![Pareto front](docs/figures/pareto_area_vs_achieved_main.png)

| variant | fastest achieved | smallest area | cells @ 3.0 ns | gap closed |
|---|---|---|---|---|
| Wallace baseline | 1.86 ns | 6346 µm² | 4639 | — |
| + sign-extension elimination | 1.87 ns | 5975 µm² | 4455 | 19.5% |
| + Dadda reduction | 1.78 ns | 5620 µm² | 3936 | 38.1% |
| **+ fused Booth selector** | **1.76 ns** | **5029 µm²** | **2819** | **69.1%** |
| Behavioural Booth (`+` chain) | 2.01 ns | 6210 µm² | 4863 | 7.1% |
| `A * B` (inferred) | 1.63 ns | 4441 µm² | 3035 | reference |

Cell census at a fixed 3.0 ns constraint:

| @ 3.0 ns | XOR+XNOR | FA cells | AOI/OAI | INV | total cells | area |
|---|---|---|---|---|---|---|
| Wallace baseline | 1346 | 139 | 1602 | 602 | 4639 | 6501 µm² |
| + sign-ext elimination | 1332 | 96 | 1439 | 559 | 4455 | 6196 µm² |
| + Dadda | 1230 | 117 | 1405 | 505 | 3936 | 5725 µm² |
| + fused selector | **85** | **448** | 1311 | 415 | 2819 | **5125 µm²** |
| `A * B` | 559 | 268 | 950 | 311 | 3035 | 4910 µm² |

Structural cost of the reduction network, computed from the elaboration-time
schedule rather than from reports:

| N | rows | dots (baseline) | dots (optimized) | Dadda stages | FA | HA | Wallace FA instances |
|---|---|---|---|---|---|---|---|
| 8 | 5 | 56 | 45 | 3 | 15 | 9 | 48 |
| 16 | 9 | 208 | 153 | 4 | 91 | 21 | 224 |
| **32** | **17** | **800** | **561** | **6** | **435** | **45** | **960** |
| 64 | 33 | 3136 | 2145 | 8 | 1891 | 93 | 3968 |

Periods are **achieved** (`constraint − slack`), not requested: a run that
violated timing still produced a real netlist, just a slower one. Curves are
Pareto fronts over the whole sweep, because `compile_ultra` is not monotonic in
the clock constraint.

The two Dadda variants cross twice, so the better choice depends on the target
period:

![Zoom](docs/figures/pareto_zoom_main.png)

*Report: §7.2 for the achieved-period metric, §8 for the analysis, §B for which report file each number came from.*

---

## Repository layout

```
rtl/
  common/                 iv, nd2, mux21, mux21_generic, fa, ha
  adder/                  the P4 sparse-tree adder chain
  multiplier/
    packages/             see below
    booth_encoder, mux_and_shift, corrector, CSA
    reduction_tree, wallace_tree, dadda_tree
    boothmul, reg_N, boothmul_registered
  super_beh_multiplier_registered.vhd   the A*B reference design

tb/                       tb_multiplier            RTL testbench, self-checking
                          tb_boothmul_registered   gate-level testbench

cfg/                      configurations_boothmul    which architectures make a variant
                          configurations_tb          binds each variant to the testbench
                          configurations_synthesis   binds each variant to the registered top

sim/                      compile.do   compile order, run first
                          sim.do       pick the variant at the top, then run

synthesis/
  configs.txt                   the configurations the sweep iterates over
  syn/synthesis.tcl             sweeps every config across the period list
  syn/boothmul_registered.sdc   constraints; sourced once per period
  syn/reports/                  the measurement data behind every number above
  plot_pareto.py                reads those reports, writes the figures and tables

docs/                     report.tex/.pdf, presentation.tex/.pdf
                          schematic.tex/.pdf, schematic.drawio, figures/
```

### The four packages

| package | file | contents |
|---|---|---|
| `common_pkg` | `packages/common_pkg.vhd` | `NBIT`, `NROWS`, `pp_word`, `pp_array`, `sign_ext_const` |
| `wallace_math_pkg` | `packages/wallace_math_pkg.vhd` | row counts and layer depth for the uniform CSA tree |
| `dadda_types_pkg` | `packages/dadda_types_pkg.vhd` | the Dadda height sequence, matrix types, `NUM_LAYERS_D` |
| `dadda_math_pkg` | `packages/dadda_math_pkg.vhd` | the schedule and the port-map analysis functions |

`NBIT` in `common_pkg` is the **single width knob** for the whole project — the
design, the reduction schedule and the testbench all derive from it, so one edit
switches all three together. It is a constant rather than a generic because the
`pp_array` port type must live in a package, and a VHDL-93 package cannot see a
generic.

`dadda_math_pkg.constructing_dadda` computes the entire reduction schedule at
elaboration time and returns three matrices — full-adder source rows, half-adder
source rows, and the bits no compressor consumed. `dadda_tree` then reads its
port-map positions back out of those matrices.

*Report: §4.4–§4.7 for the algorithm, §A.1–§A.2 for the file layout.*

---

## Running it

### Simulation

```tcl
cd sim
do compile.do
do sim.do
```

Pick the variant at the top of `sim.do`:

```tcl
set CFG work.cfg_tb_dadda_fused_sel
# set CFG work.cfg_tb_dadda
# set CFG work.cfg_tb_wal_opt
# set CFG work.cfg_tb_wal_base
# set CFG work.cfg_tb_beh
# set CFG work.cfg_tb_super_beh
```

| `NBIT` | testbench mode |
|---|---|
| ≤ 8 | exhaustive — all 65 536 operand pairs at 8 bits |
| > 8 | corner cases (0, ±1, max, min) + 20 000 random pairs |

Every configuration in `synthesis/configs.txt` has a matching `cfg_tb_*` here.
Nothing reaches synthesis without passing this first — one early variant did,
and looked excellent on area *because* it was missing logic.

### Synthesis

```tcl
cd synthesis/syn
dc_shell -f synthesis.tcl
```

Writes a netlist, SDC, SDF and five reports per configuration per clock period.
Netlists and SAIF files are gitignored (≈870 MB); the reports are kept, since
they are the data behind every number above.

### Figures and tables

```bash
cd synthesis
python3 plot_pareto.py syn/reports -o ../docs/figures --zoom 1.7 3.1
```

Parses the reports directly — no intermediate CSV — and prints the summary table
with the gap analysis.

### Documents

```bash
cd docs
pdflatex schematic.tex
pdflatex report.tex       && pdflatex report.tex
pdflatex presentation.tex && pdflatex presentation.tex
```

---

## Notes

- **No `time` generics or `after` clauses in the RTL.** The VHDL `time` type is
  not synthesizable, and keeping it would force a second stripped copy of the
  sources. Gate-level simulation is therefore zero-delay, which is fine — the
  design is purely combinational between registers.
- **`compile_ultra` is not monotonic in the clock constraint.** A looser period
  can give a larger design. Verified not to be the area constraint: a controlled
  run without `set_max_area` behaved the same way.
- `pp_layout_t` in `common_pkg` is currently unused — a leftover from an earlier
  attempt at a layout-generic tree.

---

## Roadmap

- [x] Sign-extension elimination — 6346 → 5975 µm²
- [x] Dadda reduction — 5975 → 5620 µm²
- [x] Fused Booth selector — 5620 → 5029 µm², 1.76 ns
- [ ] Switching activity and power — 1145 XOR cells removed should show up in
      dynamic power more than it did in area
- [ ] Gate-level simulation of each netlist against its SDF
- [ ] Sweep below 1 ns — every variant hit its fastest achieved period at the
      tightest constraint tried, so the left edge of the front is not found yet
- [ ] Baugh–Wooley comparison as an alternative treatment of the sign problem
