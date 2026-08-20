##  Gate level simulation of the synthesised Booth multiplier.


##  the same periods as in synthesis.tcl
set periods {1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0}

## nandgate library cell
set cell_models /eda/dk/nangate45/verilog/NangateOpenCellLibrary.v

set fp [open "../configs.txt" r]
set configs [read $fp]
close $fp

#set configs {CFG_BOOTHMUL_REG_WAL_BASE CFG_BOOTHMUL_REG_WAL_OPT CFG_BOOTHMUL_REG_DADDA CFG_BOOTHMUL_REG_BEH}
set netlist ../syn/netlist
file mkdir vcd



## COMPILE

if {[file exists work]} { vdel -all -lib work }
vlib work

## Nangate cell model compiling
vlog -work work $cell_models

##  the testbench
vcom -work work tb_boothmul_registered.vhd


foreach configuration $configs {
        
    # directory for the netlist for each configuration
    set netlist_dir "${netlist}/${configuration}"
    file mkdir $netlist_dir

    # directory of the vcd file for each configuration
    set vcd_dir "./vcd/${configuration}"
    file mkdir $vcd_dir

    ## THE SWEEP
    foreach period $periods {

        set tag [string map {. p} $period]

        echo "=========================================="
        echo "  simulation with clock period $period ns"
        echo "=========================================="

        ##  the netlist of this period, was synthesized by the synthesis script in this directory.
        vlog -work work $netlist_dir/boothmul_registered_$tag.v

        ##  -voptargs=+acc   : keep the internal signals visible, otherwise the optimiser removes them and the VCD is almost empty
        ##  +notimingchecks  : we want the power, not a setup/hold check, otherwise flip flop models complain at time 0 and put X everywhere.
        ##  -sdfmax          : take the gate delays from the SDF file
        ##  -gCLK_PERIOD     : setting the generic CLK_PERIOD of testbench
        vsim -t 1ps -voptargs=+acc +notimingchecks \
            -sdfmax /tb_boothmul_registered/dut=$netlist_dir/boothmul_registered_$configuration_$tag.sdf \
            -gCLK_PERIOD=${period}ns \
            work.tb_boothmul_registered

        ##  record the VCD
        vcd file $vcd_dir/boothmul_$configuration_$tag.vcd
        vcd add -r /tb_boothmul_registered/dut/*

        run -all

        quit -sim
    }
}
echo "======================================================"
echo "  DONE "
echo "  the vcd files in ./vcd"
echo "======================================================"

quit -f
