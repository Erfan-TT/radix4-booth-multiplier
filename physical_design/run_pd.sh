#!/bin/bash
##  Place and route every synthesized netlist, one Innovus run per netlist,
##  at the period the netlist achieved in synthesis.

# configs="CFG_BOOTHMUL_REG_WAL_BASE CFG_BOOTHMUL_REG_WAL_OPT CFG_BOOTHMUL_REG_DADDA
#          CFG_BOOTHMUL_REG_DADDA_FUSED_SEL CFG_BOOTHMUL_REG_BEH CFG_REG_SUPER_BEH"

# configs="CFG_BOOTHMUL_REG_WAL_BASE"

# configs="CFG_BOOTHMUL_REG_WAL_OPT"

# configs="CFG_BOOTHMUL_REG_DADDA"

# configs="CFG_BOOTHMUL_REG_DADDA_FUSED_SEL"

# configs="CFG_BOOTHMUL_REG_BEH"

configs="CFG_REG_SUPER_BEH"

csv_dir=../synthesis/syn/reports/achieved_clk

for cfg in $configs; do
    ##  each line of the CSV: requested period, slack, achieved period
    tail -n +2 $csv_dir/results_$cfg.csv | tr -d '\r' |
    while IFS=, read period slack achieved; do

        run=runs/${cfg}_${period/./p}

        if [ -f $run/outputs/boothmul_registered_routed.v ]; then
            echo "$run: already done"
            continue
        fi

        echo "$run: clock $achieved ns, started $(date +%H:%M)"
        mkdir -p $run

        ##  < /dev/null: if a command fails, Innovus exits instead of
        ##  waiting at its prompt
        ( cd $run &&
          PD_CFG=$cfg PD_PERIOD=$period PD_CLOCK=$achieved PD_BATCH=1 \
          innovus -nowin -files ../../scripts/innovus_script.tcl \
              < /dev/null > innovus_run.log 2>&1 )
    done
done
