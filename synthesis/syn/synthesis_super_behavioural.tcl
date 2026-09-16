set blockName super_beh_multiplier_registered

set periods {1.0 1.5 1.7 2.0 2.2 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0}

file mkdir netlist
file mkdir reports

set configuration {CFG_super_beh}

# directory for the netlist for each configuration
    set netlist_dir "./netlist/${configuration}"
    file mkdir $netlist_dir

    # directory for the reports of each configuration
    set reports_dir "./reports/${configuration}"
    file mkdir $reports_dir

analyze -library WORK -format vhdl {../../rtl/multiplier/packages/common_pkg.vhd}

analyze -library WORK -format vhdl {../../rtl/super_beh_multiplier_registered.vhd}

foreach clockPeriod $periods {

        # 2.5 becomes 2p5, so we can use it in file names
        set tag [string map {. p} $clockPeriod]

        echo "==============================================================="
        echo "  Synthesising $configuration with clock period $clockPeriod ns"
        echo "==============================================================="


        ## ELABORATE
        elaborate $blockName -architecture beh -library WORK
        current_design $blockName
        link

        ## DESIGN ENVIRONMENT
        set_wire_load_model -name 5K_hvratio_1_4 -library NangateOpenCellLibrary

    ## CONSTRAINTS
        source ./boothmul_registered.sdc


        ## COMPILE
        
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

echo "==========================================="
echo "  synthesis sweep finished"
echo "  netlists and sdf files are in ./netlist"
echo "  reports are in ./reports"
echo "==========================================="

exit