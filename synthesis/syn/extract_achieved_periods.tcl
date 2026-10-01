
set report_default_significant_digits 6

set blockName boothmul_registered
source ../sweep_config.tcl




################################################################
## CONFIGURATION SWEEP
################################################################

foreach configuration $configs {

    set netlist_dir "./netlist/${configuration}"

    set csv_dir "./reports/achieved_clk"
    file mkdir $csv_dir


    ############################################################
    ## CSV
    ############################################################

    set csvFile $csv_dir/results_${configuration}.csv

    set fp [open $csvFile "w"]

    puts $fp \
        "period_ns,slack_ns,achieved_ns"

    close $fp


    ############################################################
    ## CLOCK-PERIOD SWEEP
    ############################################################

    foreach clockPeriod $periods {

        set tag [string map {. p} $clockPeriod]

        echo "=============================================================="
        echo " ACHIEVED-PERIOD EXTRACTION"
        echo " configuration : $configuration"
        echo " clock period  : $clockPeriod ns"
        echo "=============================================================="


        ########################################################
        ## FILE NAMES
        ########################################################

        set netlistFile \
            $netlist_dir/${blockName}_${configuration}_${tag}.v

        set sdcFile \
            $netlist_dir/${blockName}_${configuration}_${tag}.sdc

        ########################################################
        ## CHECK FILES
        ########################################################

        if {![file exists $netlistFile]} {
            echo "ERROR: missing $netlistFile"
            continue
        }

        if {![file exists $sdcFile]} {
            echo "ERROR: missing $sdcFile"
            continue
        }

        ########################################################
        ## REMOVE PREVIOUS DESIGN
        ########################################################

        remove_design -all


        ########################################################
        ## READ THE EXISTING SYNTHESIZED NETLIST
        ##
        ## NO compile_ultra HERE.
        ########################################################

        read_verilog $netlistFile

        current_design $blockName

        link


        ########################################################
        ## SAME ENVIRONMENT USED DURING SYNTHESIS
        ########################################################

        set_wire_load_model \
            -name 5K_hvratio_1_4 \
            -library NangateOpenCellLibrary


        ########################################################
        ## READ THE EXACT SDC WRITTEN DURING SYNTHESIS
        ########################################################

        read_sdc $sdcFile


        ########################################################
        ## GET TIMING
        ########################################################

        set timingPath [get_timing_paths -max_paths 1]

        set slack \
            [get_attribute $timingPath slack]

        set achieved \
            [expr {$clockPeriod - $slack}]


        ########################################################
        ## WRITE CSV
        ########################################################

        set fp [open $csvFile "a"]

        puts $fp [format "%s,%.4f,%.4f" \
            $clockPeriod \
            $slack \
            $achieved]

        close $fp


        ########################################################
        ## CONSOLE SUMMARY
        ########################################################

        echo "---------------------------------------------"
        echo " period   : $clockPeriod ns"
        echo " slack    : $slack ns"
        echo " achieved : $achieved ns"
        echo "---------------------------------------------"
    }


    echo "=============================================================="
    echo " Analysis finished for $configuration"
    echo " CSV: $csvFile"
    echo "=============================================================="
}

exit
