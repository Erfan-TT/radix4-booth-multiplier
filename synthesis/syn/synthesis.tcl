##  Synthesis of the behavioral Booth multiplier, Nangate 45nm.

##  each period gives us one netlist to be simulated in ../sim, one SDF and one set of reports, 
##  which become one point in the Pareto curve.


suppress_message VER-130
suppress_message UID-401
suppress_message LINK-14
suppress_message TIM-134

set blockName boothmul_registered

#define_design_lib WORK_SEC -path ./work_second

# set fp [open "../configs.txt" r]
# set configs [read $fp]
# close $fp
set configs {CFG_BOOTHMUL_REG_DADDA_FUSED_SEL CFG_BOOTHMUL_REG_WAL_BASE CFG_BOOTHMUL_REG_WAL_OPT CFG_BOOTHMUL_REG_DADDA CFG_BOOTHMUL_REG_BEH}
#set configs {CFG_REG_SUPER_BEH}
#set configs {CFG_BOOTHMUL_REG_DADDA_FUSED_SEL CFG_BOOTHMUL_REG_DADDA}
# the clock periods of the sweep
set periods {1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0 2.2 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0}
#set periods {1.1 1.3 1.4 1.6 1.8 1.9}
#set periods {0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0 2.1 2.2}
#set periods {0.4 0.5 0.6 0.7 0.8 0.9 }
file mkdir netlist
file mkdir reports

set FILES {
    ../../rtl/multiplier/packages/common_pkg.vhd
    ../../rtl/multiplier/packages/dadda_types_pkg.vhd
    ../../rtl/multiplier/packages/wallace_math_pkg.vhd
    ../../rtl/multiplier/packages/dadda_math_pkg.vhd
    ../../rtl/common/iv.vhd
    ../../rtl/common/nd2.vhd
    ../../rtl/common/mux21.vhd
    ../../rtl/common/mux21_generic.vhd
    ../../rtl/common/fa.vhd
    ../../rtl/common/ha.vhd
    ../../rtl/adder/rca.vhd
    ../../rtl/adder/carry_select_block.vhd
    ../../rtl/adder/PG_block.vhd
    ../../rtl/adder/G_block.vhd
    ../../rtl/adder/PG_elem.vhd
    ../../rtl/adder/carry_generator.vhd
    ../../rtl/adder/sum_generator.vhd
    ../../rtl/adder/P4_adder.vhd
    ../../rtl/multiplier/booth_encoder.vhd
    ../../rtl/multiplier/mux_and_shift.vhd
    ../../rtl/multiplier/corrector.vhd
    ../../rtl/multiplier/CSA.vhd
    ../../rtl/multiplier/dadda_tree.vhd
    ../../rtl/multiplier/wallace_tree.vhd
    ../../rtl/multiplier/reduction_tree.vhd
    ../../rtl/multiplier/boothmul.vhd
    ../../rtl/multiplier/reg_N.vhd
    ../../rtl/multiplier/boothmul_registered.vhd
    ../../cfg/configurations_boothmul.vhd
    ../../cfg/configurations_synthesis.vhd
}

foreach f $FILES {
    if {![file exists $f]} {
        echo "*** MISSING: $f"
        exit 1
    }
    if {[catch {analyze -library WORK -format vhdl $f} msg]} {
        echo "*** ANALYZE FAILED: $f"
        echo "    $msg"
        exit 1
    }
}
echo "=== analyze OK: [llength $FILES] files ==="


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
        
        ## no ungroup flatten, to use the the FA_X cells of the library instead of gates
        #ungroup -all -flatten

        
        compile_ultra 


        ## SAVE
        # saving the ddc so later doing STA on them
        #write -format ddc -hierarchy -output $netlist_dir/${blockName}_${configuration}_${tag}.ddc

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
