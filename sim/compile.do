# compile all sources
# usage: do compile.do      (run from the sim/ directory)

vlib work
vmap work work

# packages first
vcom -work work ../rtl/multiplier/packages/common_pkg.vhd
vcom -work work ../rtl/multiplier/packages/dadda_types_pkg.vhd
vcom -work work ../rtl/multiplier/packages/wallace_math_pkg.vhd
vcom -work work ../rtl/multiplier/packages/dadda_math_pkg.vhd
vcom -work work ../rtl/common/constants.vhd

# basic gates
vcom -work work ../rtl/common/iv.vhd
vcom -work work ../rtl/common/nd2.vhd
vcom -work work ../rtl/common/mux21.vhd
vcom -work work ../rtl/common/mux21_generic.vhd
vcom -work work ../rtl/common/fa.vhd
vcom -work work ../rtl/common/ha.vhd

# P4 sparse-tree adder
vcom -work work ../rtl/adder/rca.vhd
vcom -work work ../rtl/adder/carry_select_block.vhd
vcom -work work ../rtl/adder/PG_block.vhd
vcom -work work ../rtl/adder/G_block.vhd
vcom -work work ../rtl/adder/PG_elem.vhd
vcom -work work ../rtl/adder/carry_generator.vhd
vcom -work work ../rtl/adder/sum_generator.vhd
vcom -work work ../rtl/adder/P4_adder.vhd

# multiplier
vcom -work work ../rtl/multiplier/booth_encoder.vhd
vcom -work work ../rtl/multiplier/mux_and_shift.vhd
vcom -work work ../rtl/multiplier/corrector.vhd
vcom -work work ../rtl/multiplier/CSA.vhd
vcom -work work ../rtl/multiplier/dadda_tree.vhd
vcom -work work ../rtl/multiplier/wallace_tree.vhd
vcom -work work ../rtl/multiplier/reduction_tree.vhd
vcom -work work ../rtl/multiplier/boothmul.vhd

# testbench
vcom -work work ../tb/tb_multiplier.vhd

# configurations last: they depend on both BOOTHMUL and MULTIPLIER_tb
vcom -work work ../cfg/configurations.vhd
