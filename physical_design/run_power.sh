#!/bin/bash
##  Power of every simulated run, from the VCD of sim/sim_postlayout.do.

for run in runs/*; do

    if [ ! -f $run/outputs/boothmul_registered_routed.vcd ] ||
       [ -f $run/reports/12_power_vcd.rpt ]; then
        continue
    fi

    echo "$run: power"
    ( cd $run &&
      innovus -nowin -files ../../scripts/power_postlayout.tcl < /dev/null > power.log 2>&1 )

    ##  the saved design (about 90 MB) and the VCD are not needed any more
    if [ -f $run/reports/12_power_vcd.rpt ]; then
        rm -rf $run/dbs $run/outputs/boothmul_registered_routed.vcd
    fi
done
