##  Synthesis of the behavioral Booth multiplier, Nangate 45nm.

##  each period gives us one netlist to be simulated in ../sim, one SDF and one set of reports, 
##  which become one point in the Pareto curve.


suppress_message VER-130
suppress_message UID-401
suppress_message LINK-14
suppress_message TIM-134

set blockName boothmul_registered
set fp [open "../configs.txt" r]
set configs [read $fp]
close $fp
#set configs {CFG_BOOTHMUL_REG_WAL_BASE CFG_BOOTHMUL_REG_WAL_OPT CFG_BOOTHMUL_REG_DADDA CFG_BOOTHMUL_REG_BEH}

# the clock periods of the sweep
set periods {1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0}

file mkdir netlist
file mkdir reports


## the packages
analyze -library WORK -format vhdl {../../rtl/multiplier/packages/common_pkg.vhd}
analyze -library WORK -format vhdl {../../rtl/multiplier/packages/dadda_types_pkg.vhd}
analyze -library WORK -format vhdl {../../rtl/multiplier/packages/wallace_math_pkg.vhd}
analyze -library WORK -format vhdl {../../rtl/multiplier/packages/dadda_math_pkg.vhd}
analyze -library WORK -format vhdl {../../rtl/common/constants.vhd}

# basic gates
analyze -library WORK -format vhdl {../../rtl/common/iv.vhd}
analyze -library WORK -format vhdl {../../rtl/common/nd2.vhd}
analyze -library WORK -format vhdl {../../rtl/common/mux21.vhd}
analyze -library WORK -format vhdl {../../rtl/common/mux21_generic.vhd}
analyze -library WORK -format vhdl {../../rtl/common/fa.vhd}
analyze -library WORK -format vhdl {../../rtl/common/ha.vhd}

# P4 sparse-tree adder
analyze -library WORK -format vhdl {../../rtl/adder/rca.vhd}
analyze -library WORK -format vhdl {../../rtl/adder/carry_select_block.vhd}
analyze -library WORK -format vhdl {../../rtl/adder/PG_block.vhd}
analyze -library WORK -format vhdl {../../rtl/adder/G_block.vhd}
analyze -library WORK -format vhdl {../../rtl/adder/PG_elem.vhd}
analyze -library WORK -format vhdl {../../rtl/adder/carry_generator.vhd}
analyze -library WORK -format vhdl {../../rtl/adder/sum_generator.vhd}
analyze -library WORK -format vhdl {../../rtl/adder/P4_adder.vhd}

# the multiplier
analyze -library WORK -format vhdl {../../rtl/multiplier/booth_encoder.vhd}
analyze -library WORK -format vhdl {../../rtl/multiplier/mux_and_shift.vhd}
analyze -library WORK -format vhdl {../../rtl/multiplier/corrector.vhd}
analyze -library WORK -format vhdl {../../rtl/multiplier/CSA.vhd}
analyze -library WORK -format vhdl {../../rtl/multiplier/dadda_tree.vhd}
analyze -library WORK -format vhdl {../../rtl/multiplier/wallace_tree.vhd}
analyze -library WORK -format vhdl {../../rtl/multiplier/reduction_tree.vhd}
analyze -library WORK -format vhdl {../../rtl/multiplier/boothmul.vhd}
analyze -library WORK -format vhdl {../../rtl/multiplier/reg_N.vhd}
analyze -library WORK -format vhdl {../../rtl/multiplier/boothmul_registered.vhd}

# the configuration, different arch combinations for booth
analyze -library WORK -format vhdl {../../cfg/configurations_synthesis.vhd}

foreach configuration $configs {

    # directory for the netlist for each configuration
    set netlist_dir "./netlist/${configuration}"
    file mkdir $netlist_dir

    # directory for the reports of each configuration
    set reports_dir "./reports/${configuration}"
    file mkdir $reports_dir


    foreach clockPeriod $periods {

        # 2.5 becomes 2p5, so we can use it in file names
        set tag [string map {. p} $clockPeriod]

        echo "==============================================================="
        echo "  Synthesising $configuration with clock period $clockPeriod ns"
        echo "==============================================================="


        ## ELABORATE
        elaborate $configuration -library WORK
        current_design $blockName
        link

        ## DESIGN ENVIRONMENT
        set_wire_load_model -name 5K_hvratio_1_4 -library NangateOpenCellLibrary

    ## CONSTRAINTS
        ## The sdc file uses the variable clockPeriod, which is set by this loop,
        ## so the same file gives a different constraint every time.
        source ./boothmul_registered.sdc


        ## COMPILE
        ## ungroup -all -flatten restructure the adder chain of the partial products across the boundaries of the
        ## encoder and the mux blocks. This is what makes the area optimization better.
        ungroup -all -flatten

        
        compile_ultra 


        ## SAVE
        change_names -rules verilog -hierarchy

        write -format verilog -hierarchy -output $netlist_dir/${blockName}_${configuration}_${tag}.v
        write_sdc $netlist_dir/${blockName}_${configuration}_${tag}.sdc
        write_sdf $netlist_dir/${blockName}_${configuration}_${tag}.sdf

        ## REPORTS
        report_timing       > $reports_dir/timing_${configuration}_${tag}.rpt
        report_area         > $reports_dir/area_${configuration}_${tag}.rpt
        report_qor          > $reports_dir/qor_${configuration}_${tag}.rpt
        report_reference    > $reports_dir/reference_${configuration}_${tag}.rpt
        report_clock_gating > $reports_dir/clock_gating_${configuration}_${tag}.rpt


        ## CLEAN FOR THE NEXT PERIOD
        remove_design -all
    }
}
echo "==========================================="
echo "  synthesis sweep finished"
echo "  netlists and sdf files are in ./netlist"
echo "  reports are in ./reports"
echo "==========================================="

exit
