##  Gate level simulation of the synthesised Booth multiplier.

##  the same periods as in synthesis.tcl
set periods {1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9 2.0 2.2 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0}

proc read_csv_col {filename} {
    set fp [open $filename r]

    gets $fp header

    set achieved_clk {}

    while {[gets $fp line] >= 0} {

        ## empty line skip
        if {[string trim $line] eq ""} {
            continue
        }

        set fields [split $line ","]
        set achieved [lindex $fields 2]
        lappend achieved_clk $achieved
    }

    close $fp

    return $achieved_clk
}

set BlockName {boothmul_registered}

## nandgate library cell
set cell_models /eda/dk/nangate45/verilog/NangateOpenCellLibrary.v

#set fp [open "../configs.txt" r]
#set configs [read $fp]
#close $fp

#set configs {CFG_BOOTHMUL_REG_WAL_BASE CFG_BOOTHMUL_REG_WAL_OPT CFG_BOOTHMUL_REG_DADDA CFG_BOOTHMUL_REG_BEH}

#set configs {CFG_BOOTHMUL_REG_WAL_BASE}
set configs {CFG_BOOTHMUL_REG_WAL_OPT}
set configs {CFG_BOOTHMUL_REG_DADDA}
set configs {CFG_BOOTHMUL_REG_DADDA_FUSED_SEL}
set configs {CFG_REG_SUPER_BEH}
set configs {CFG_BOOTHMUL_REG_BEH}

#set cfg_wk_dir {CFG_BOOTHMUL_REG_WAL_BASE}
set cfg_wk_dir {CFG_BOOTHMUL_REG_WAL_OPT}
set cfg_wk_dir {CFG_BOOTHMUL_REG_DADDA}
set cfg_wk_dir {CFG_BOOTHMUL_REG_DADDA_FUSED_SEL}
set cfg_wk_dir {CFG_REG_SUPER_BEH}
set cfg_wk_dir {CFG_BOOTHMUL_REG_BEH}



set netlist ../syn/netlist
file mkdir vcd



## COMPILE

if {[file exists work_${cfg_wk_dir}]} { vdel -all -lib work_${cfg_wk_dir} }
vlib work_${cfg_wk_dir}

## Nangate cell model compiling
vlog -work work_${cfg_wk_dir} $cell_models

##  the testbench
vcom -work work_${cfg_wk_dir} tb_boothmul_registered.vhd


foreach cfg $configs {
        
    # directory for the netlist for each cfg
    set netlist_dir "${netlist}/${cfg}"
    file mkdir $netlist_dir

    # directory of the vcd file for each cfg
    set vcd_dir "./vcd/${cfg}"
    file mkdir $vcd_dir

    ## the achieved clocks
    set csv_achieved "../syn/reports/achieved_clk/results_${cfg}.csv"
    set achieved_clks [read_csv_col $csv_achieved]
    set i 0
    ## THE SWEEP
    foreach period $periods {

        set tag [string map {. p} $period]

        set sim_clk [lindex $achieved_clks $i]
        incr i

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
