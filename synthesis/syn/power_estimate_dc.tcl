###############################################################
## Post-synthesis timing + power analysis using
## Design Compiler / Power Compiler
##
## INPUT:
##   - already synthesized gate-level Verilog
##   - SDC written during synthesis
##   - gate-level VCD from SDF simulation
##
## OUTPUT:
##   - timing reports
##   - power reports
##   - SAIF annotation reports
##   - results_<configuration>.csv
###############################################################

set report_default_significant_digits 6

suppress_message VER-130
suppress_message UID-401
suppress_message LINK-14
suppress_message TIM-134

set blockName boothmul_registered

# set fp [open "../configs.txt" r]
# set configs [read $fp]
# close $fp

set configs {CFG_super_beh}

# Use exactly the points for which you have netlists + VCDs
set periods {1.0 1.5 1.7 2.0 2.2 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0}

file mkdir reports_power


################################################################
## Convert a report_power value to watts
##
## report_power may print for example:
##     1.23 mW
##     450.2 uW
##     12.1 nW
################################################################

proc power_to_watts {value unit} {
    switch $unit {
        "W"  { return $value }
        "mW" { return [expr {$value * 1.0e-3}] }
        "uW" { return [expr {$value * 1.0e-6}] }
        "nW" { return [expr {$value * 1.0e-9}] }
        "pW" { return [expr {$value * 1.0e-12}] }
        default { error "Unknown power unit: $unit" }
    }
}

proc extract_area_from_report {filename} {

    set fp [open $filename r]
    set txt [read $fp]
    close $fp

    if {![regexp {Total[ \t]+cell[ \t]+area:[ \t]*([0-9.eE+-]+)} \
            $txt dummy area]} {

        error "Could not find Total cell area in $filename"
    }

    return $area
}

proc extract_power_from_report {filename} {

    set fp [open $filename r]
    set txt [read $fp]
    close $fp

    if {![regexp {Total[ \t]+Dynamic[ \t]+Power[ \t]*=[ \t]*([0-9.eE+-]+)[ \t]+([munp]?W)} \
        $txt dummy dynValue dynUnit]} {
        error "Could not find Total Dynamic Power in $filename"
    }

    if {![regexp {Cell[ \t]+Leakage[ \t]+Power[ \t]*=[ \t]*([0-9.eE+-]+)[ \t]+([munp]?W)} \
        $txt dummy leakValue leakUnit]} {
        error "Could not find Cell Leakage Power in $filename"
    }

    set dynamic [power_to_watts $dynValue $dynUnit]
    set leakage [power_to_watts $leakValue $leakUnit]

    return [list $dynamic $leakage]
}


################################################################
## Extract total dynamic and leakage power from report_power
##
## Returns both values in W so the CSV behaves similarly to
## PrimeTime's power attributes.
################################################################

proc extract_area_from_report {filename} {

    set fp [open $filename r]
    set txt [read $fp]
    close $fp

    if {![regexp {Total[ \t]+cell[ \t]+area:[ \t]*([0-9.eE+-]+)} \
        $txt dummy area]} {
        error "Could not find Total cell area in $filename"
    }

    return $area
}


################################################################
## CONFIGURATION SWEEP
################################################################

foreach configuration $configs {

    set netlist_dir "./netlist/${configuration}"

    set reports_dir "./reports_power/${configuration}"
    file mkdir $reports_dir

    set vcd_dir "../sim/vcd/${configuration}"
    set saif_dir "../sim/saif/${configuration}"

    file mkdir "../sim/saif"
    file mkdir $saif_dir


    ############################################################
    ## CSV
    ############################################################

    set csvFile $reports_dir/results_${configuration}.csv

    set fp [open $csvFile "w"]

    puts $fp \
        "period_ns,slack_ns,achieved_ns,area_um2,dynamic_power_W,leakage_power_W"

    close $fp


    ############################################################
    ## CLOCK-PERIOD SWEEP
    ############################################################

    foreach clockPeriod $periods {

        set tag [string map {. p} $clockPeriod]

        echo "=============================================================="
        echo " DC POWER ANALYSIS"
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

        set vcdFile \
            $vcd_dir/boothmul_${configuration}_${tag}.vcd

        set saifFile \
            $saif_dir/boothmul_${configuration}_${tag}.saif


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

        if {![file exists $vcdFile]} {
            echo "ERROR: missing $vcdFile"
            continue
        }


        ########################################################
        ## VCD -> SAIF
        ##
        ## Do it only if the SAIF does not already exist.
        ########################################################

        if {![file exists $saifFile]} {

            echo "Converting VCD to SAIF..."

            set VCD2SAIF \
    "/eda/synopsys/2024-25/RHELx86/SYN_2024.09-SP2/linux64/syn/bin/vcd2saif"

            sh $VCD2SAIF \
                -input $vcdFile \
                -output $saifFile
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
        ## SWITCHING ACTIVITY
        ########################################################

        reset_switching_activity

        read_saif \
            -input $saifFile \
            -instance_name tb_boothmul_registered/dut \
            -verbose


        ########################################################
        ## SAIF ANNOTATION REPORT
        ########################################################

        report_saif -hier \
    > $reports_dir/activity_${configuration}_${tag}.rpt

        report_saif -hier -missing \
    > $reports_dir/activity_missing_${configuration}_${tag}.rpt

        ########################################################
        ## TIMING REPORT
        ########################################################

        report_timing \
            > $reports_dir/timing_${configuration}_${tag}.rpt


   ########################################################
## AREA
########################################################

set areaReport \
    $reports_dir/area_${configuration}_${tag}.rpt

report_area > $areaReport

set area [extract_area_from_report $areaReport]

        ########################################################
        ## POWER REPORT
        ##
        ## report_power invokes the Power Compiler power engine.
        ########################################################

        set powerReport \
            $reports_dir/power_${configuration}_${tag}.rpt

        report_power > $powerReport


        ########################################################
        ## GET TIMING
        ########################################################

        set timingPath [get_timing_paths -max_paths 1]

        set slack \
            [get_attribute $timingPath slack]

        set achieved \
            [expr {$clockPeriod - $slack}]



        ########################################################
        ## GET POWER
        ##
        ## Parse report_power because this is portable across
        ## DC/Power Compiler versions.
        ########################################################

        set powerValues \
            [extract_power_from_report $powerReport]

        set dynamic [lindex $powerValues 0]
        set leakage [lindex $powerValues 1]


        ########################################################
        ## WRITE CSV
        ########################################################

        set fp [open $csvFile "a"]

        puts $fp [format "%s,%.4f,%.4f,%.2f,%.6e,%.6e" \
            $clockPeriod \
            $slack \
            $achieved \
            $area \
            $dynamic \
            $leakage]

        close $fp


        ########################################################
        ## CONSOLE SUMMARY
        ########################################################

        echo "---------------------------------------------"
        echo " period   : $clockPeriod ns"
        echo " slack    : $slack ns"
        echo " achieved : $achieved ns"
        echo " area     : $area"
        echo " dynamic  : $dynamic W"
        echo " leakage  : $leakage W"
        echo "---------------------------------------------"
    }


    echo "=============================================================="
    echo " Analysis finished for $configuration"
    echo " CSV: $csvFile"
    echo "=============================================================="
}

exit