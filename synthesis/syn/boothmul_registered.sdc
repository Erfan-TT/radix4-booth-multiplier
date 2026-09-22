##  Constraints for boothmul_registered, Nangate 45nm.
##
##  This file is sourced by synthesis.tcl inside the foreach loop, once
##  for every period of the sweep. The variable clockPeriod comes from
##  that loop, so this same file gives a different clock every time.

##  The input and output delays are fixed numbers, they are not a
##  percentage of the clock period. The circuit is registered on both
##  sides, so the critical path is register -> multiplier -> register
##  and it is completely inside the design. The paths from the ports
##  only go to a flip flop, they are short and they never become the
##  critical path, even at 1.0 ns.

##  clock
create_clock -name CLK -period $clockPeriod [get_ports CLK]

set_clock_uncertainty 0.05 [get_clocks CLK]
set_clock_transition  0.05 [get_clocks CLK]
set_clock_latency     0.05 [get_clocks CLK]

##  before place and route the clock and the reset are ideal, we do not
##  want the tool to buffer them or to try to fix their timing
set_dont_touch_network [get_ports CLK]
set_ideal_network      [get_ports CLK]
set_dont_touch_network [get_ports RST]
set_ideal_network      [get_ports RST]

##  inputs and outputs
##  the clock is removed from the list, it must not get a driving cell or an input delay 
set data_inputs [remove_from_collection [all_inputs] [get_ports CLK]]

## good practice sets for the rest of the ports:
set_driving_cell -lib_cell BUF_X4 -pin Z $data_inputs
set_load 0.05 [all_outputs]

set_input_delay  0.25 -clock CLK $data_inputs
set_output_delay 0.15 -clock CLK [all_outputs]

set_max_transition 0.20 [current_design]


## minimum area constraint
set_max_area 0
