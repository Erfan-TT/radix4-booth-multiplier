##  Timing and power analysis with PrimeTime, for every clock period of
##  the sweep.
##
##  For each period it reads the netlist that Design Compiler wrote, the
##  constraints, and the VCD from the gate level simulation of the same
##  period. Then it writes one line into results.csv. That file is the
##  data of the Pareto curve.
##
##  Run after synthesis.tcl and sim.do

set power_enable_analysis true
set report_default_significant_digits 6

suppress_message PTE-003
suppress_message UID-401
suppress_message CMD-041

##  the same blockname, configs and periods as in synthesis.tcl and sim.do
set blockName boothmul_registered

set fp [open "../configs.txt" r]
set configs [read $fp]
close $fp
#set configs {CFG_BOOTHMUL_REG_WAL_BASE CFG_BOOTHMUL_REG_WAL_OPT CFG_BOOTHMUL_REG_DADDA CFG_BOOTHMUL_REG_BEH}
set periods {1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0}

file mkdir reports

foreach configuration in $configs {

    # directories for each configuration
    set netlist_dir "./netlist/${configuration}"
    file mkdir $netlist_dir

    set reports_dir "./reports/${configuration}"
    file mkdir $reports_dir

    set vcd_dir "../sim/vcd/${configuration}"

    ## the CSV file for each configuration 
    set csvFile $reports_dir/results_${configuration}.csv
    set fp [open $csvFile "w"]
    puts $fp "period_ns,slack_ns,achieved_ns,area_um2,dynamic_power,leakage_power"
    close $fp

    ## THE SWEEP
    foreach clockPeriod $periods {

        set tag [string map {. p} $clockPeriod]

        echo "================================================================"
        echo " analysis of ${configuration} with clock period $clockPeriod ns"
        echo "================================================================"

        ##  remove the design of the previous period
        remove_design -all

        read_verilog netlist/${blockName}_${configuration}_${tag}.v
        current_design $blockName
        link_design $blockName
        read_sdc netlist/${blockName}_${configuration}_${tag}.sdc

        update_timing -full

        ##################################################################
        ## SWITCHING ACTIVITY
        ##
        ## The VCD comes from the gate level simulation of this same
        ## period, so the delays in it are real and we do not use
        ## -zero_delay. -strip_path removes the testbench part of the
        ## hierarchy, because in the netlist the multiplier is the top.
        ##################################################################

        read_vcd $vcd_dir/boothmul_${configuration}_${tag}.vcd \
            -strip_path /tb_boothmul_registered/dut

        update_power

        ##################################################################
        ## To check if the vcd was valid or not, we can count how many net
        ## was given the toggle rate more than zero and is not empty.
        ## If the path is wrong, PrimeTime does not stop, it just uses a
        ## default activity and gives a number that looks fine but is
        ## wrong. So we count how many nets really got an activity.
        ##################################################################

        report_switching_activity > $reports_dir/activity_${configuration}_${tag}.rpt

        set total 0
        set annotated 0
        foreach_in_collection net [get_nets -hierarchical] {
            set total [expr {$total + 1}]
            set tr [get_attribute -quiet $net toggle_rate]
            if {$tr != "" && $tr > 0} {
                set annotated [expr {$annotated + 1}]
            }
        }
        set percent [expr {100.0 * $annotated / $total}]
        echo "  nets with switching activity : [format %.1f $percent] %"

        ##################################################################
        ## REPORTS
        ##################################################################

        report_timing > $reports_dir/pt_timing_${configuration}_${tag}.rpt
        report_power  > $reports_dir/pt_power_${configuration}_${tag}.rpt

        ##################################################################
        ## THE NUMBERS FOR THE PARETO CURVE
        ##################################################################

        set slack   [get_attribute [get_timing_paths] slack]
        set area    [get_attribute [current_design] area]
        set dynamic [get_attribute [current_design] dynamic_power]
        set leakage [get_attribute [current_design] leakage_power]

        ##  The period the circuit can really run at. If we ask for 1.0 ns
        ##  and the slack is -0.4 ns, the circuit is really a 1.4 ns
        ##  circuit, and the curve has to be drawn at 1.4 and not at 1.0.
        set achieved [expr {$clockPeriod - $slack}]

        set fp [open $csvFile "a"]
        puts $fp [format "%s,%.4f,%.4f,%.2f,%.4e,%.4e" \
                $clockPeriod $slack $achieved $area $dynamic $leakage]
        close $fp

        echo "  slack   : $slack ns"
        echo "  area    : $area"
        echo "  dynamic : $dynamic"
        echo "  leakage : $leakage"
    }
  
    echo "=============================================================="
    echo " analysis of $configuration finished, results are in $csvFile"
    echo "=============================================================="
}

exit
