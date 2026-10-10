##  Post-layout simulation of every routed netlist in ../runs, with its SDF
##  and timing checks on, at its post-route achieved period. The VCD is
##  recorded for the power.

set BlockName {boothmul_registered}

set cell_models /eda/dk/nangate45/verilog/NangateOpenCellLibrary.v

vlib work_pl
vlog -work work_pl $cell_models
vcom -work work_pl ../../synthesis/sim/tb_boothmul_registered.vhd

foreach run [lsort [glob -type d ../runs/*]] {

    set sdf $run/outputs/${BlockName}_routed.sdf

    ##  not routed yet, or already simulated
    if {![file exists $sdf] || [file exists $run/reports/12_sim.txt]} {
        continue
    }

    ##  clock of the layout, line "clock 2.9826" of run_info.txt
    set fp [open $run/outputs/run_info.txt r]
    regexp {clock (\S+)} [read $fp] -> clock
    close $fp

    ##  worst setup slack: the second line of the slack file, for example
    ##  "CLK(R)->CLK(R)  2.988  0.782/*  0.030/*  p_reg/D  1"
    ##  the third field is the slack of the rising/falling data (* = none)
    set fp [open $run/reports/timing/10_final.slk r]
    gets $fp
    gets $fp line
    close $fp
    set wns 1000
    foreach slack [split [lindex $line 2] /] {
        if {$slack ne "*" && $slack < $wns} { set wns $slack }
    }

    ##  achieved period after routing, same definition as in synthesis
    set period [format %.3f [expr {$clock - $wns}]]

    echo "=========================================="
    echo "  $run at $period ns"
    echo "=========================================="

    vlog -work work_pl $run/outputs/${BlockName}_routed.v

    ##  no +notimingchecks here: a setup or hold violation gives X and the
    ##  testbench counts it as an error
    vsim -t 1ps -voptargs=+acc \
        -sdfmax /tb_${BlockName}/dut=$sdf \
        -gCLK_PERIOD=${period}ns \
        work_pl.tb_${BlockName}

    vcd file $run/outputs/${BlockName}_routed.vcd
    vcd add -r /tb_${BlockName}/dut/*

    run -all

    set errors [examine -radix decimal /tb_${BlockName}/errors]
    echo "  $errors errors"

    set fp [open $run/reports/12_sim.txt w]
    puts $fp "$period $errors"
    close $fp

    quit -sim
}

quit -f
