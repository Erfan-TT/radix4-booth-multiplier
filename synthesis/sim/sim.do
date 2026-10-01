##  Gate level simulation of the synthesised Booth multiplier.

## The same configurations and periods used by synthesis and power analysis.
source ../sweep_config.tcl

proc read_achieved_periods {filename} {
    set fp [open $filename r]

    gets $fp header

    set achieved_by_period [dict create]

    while {[gets $fp line] >= 0} {

        ## empty line skip
        if {[string trim $line] eq ""} {
            continue
        }

        set fields [split $line ","]
        set period   [lindex $fields 0]
        set achieved [lindex $fields 2]
        dict set achieved_by_period $period $achieved
    }

    close $fp

    return $achieved_by_period
}

set BlockName {boothmul_registered}

## nandgate library cell
set cell_models /eda/dk/nangate45/verilog/NangateOpenCellLibrary.v

set netlist ../syn/netlist
file mkdir vcd


foreach cfg $configs {

    set cfg_wk_dir $cfg

    ## Each configuration gets an independent work library.
    if {[file exists work_${cfg_wk_dir}]} {
        vdel -all -lib work_${cfg_wk_dir}
    }
    vlib work_${cfg_wk_dir}
    vlog -work work_${cfg_wk_dir} $cell_models
    vcom -work work_${cfg_wk_dir} tb_boothmul_registered.vhd
        
    # directory for the netlist for each cfg
    set netlist_dir "${netlist}/${cfg}"
    file mkdir $netlist_dir

    # directory of the vcd file for each cfg
    set vcd_dir "./vcd/${cfg}"
    file mkdir $vcd_dir

    ## the achieved clocks
    set csv_achieved "../syn/reports/achieved_clk/results_${cfg}.csv"
    set achieved_by_period [read_achieved_periods $csv_achieved]
    ## THE SWEEP
    foreach period $periods {

        set tag [string map {. p} $period]

        if {![dict exists $achieved_by_period $period]} {
            error "No achieved period for $cfg at requested period $period"
        }
        set sim_clk [dict get $achieved_by_period $period]

        echo "=========================================="
        echo "  simulation with achieved clock period $sim_clk ns, synthesized at $period"
        echo "=========================================="

        ##  the netlist of this period, was synthesized by the synthesis script in this directory.
        vlog -work work_${cfg_wk_dir} $netlist_dir/${BlockName}_${cfg}_$tag.v

        ##  -voptargs=+acc   : keep the internal signals visible, otherwise the optimiser removes them and the VCD is almost empty
        ##  +notimingchecks  : we want the power, not a setup/hold check, otherwise flip flop models complain at time 0 and put X everywhere.
        ##  -sdfmax          : take the gate delays from the SDF file
        ##  -gCLK_PERIOD     : setting the generic CLK_PERIOD of testbench
        vsim -t 1ps -voptargs=+acc +notimingchecks \
            -sdfmax /tb_${BlockName}/dut=$netlist_dir/${BlockName}_${cfg}_${tag}.sdf \
            -gCLK_PERIOD=${sim_clk}ns \
            work_${cfg_wk_dir}.tb_${BlockName}

        ##  record the VCD
        vcd file $vcd_dir/boothmul_${cfg}_${tag}.vcd
        vcd add -r /tb_${BlockName}/dut/*

        run -all

        quit -sim
    }
}
echo "======================================================"
echo "  DONE "
echo "  the vcd files in ./vcd"
echo "======================================================"

quit -f
