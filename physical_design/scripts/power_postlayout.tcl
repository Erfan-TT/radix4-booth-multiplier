##  Post-layout power from the VCD of the post-layout simulation.
##  Run inside a run directory, see physical_design/README.md.

set DESIGN boothmul_registered
set VCD    outputs/${DESIGN}_routed.vcd

if {![file exists $VCD]} {
    puts "**SCRIPT-NOTE: $VCD not found, run sim/sim_postlayout.do first"
    exit
}

restoreDesign dbs/10_final.enc.dat $DESIGN

##  same extraction as the flow, from the routed wires
setExtractRCMode -engine postRoute -effortLevel low
extractRC

##  the scope is the design instance inside the testbench. If the activity
##  cannot be read, stop: report_power would silently fall back to the
##  default activity and the number would mean something else.
if {[catch {read_activity_file -format VCD -scope tb_boothmul_registered/dut $VCD} err]} {
    puts "**SCRIPT-NOTE: read_activity_file failed, no power report written:\n   $err"
    exit
}

report_power > reports/12_power_vcd.rpt

exit
