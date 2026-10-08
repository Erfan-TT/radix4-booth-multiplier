##  Constraints for boothmul_registered, place and route


##  Same numbers as synthesis/syn/boothmul_registered.sdc

##  Differences from the synthesis SDC, and why:
##   - no set_dont_touch_network / set_ideal_network on CLK: here CTS has
##     to build a real buffer tree on the clock.
##   - no set_ideal_network on RST: RST and LD reach the 128 flip flops
##     through logic (NOR2_X4 U2095 alone drives 30 gates), after
##     placement they are real long nets and the optimizer must be allowed
##     to buffer them.
##   - no set_max_area: it is a DC compile directive, not a constraint.

##  clock
create_clock -name CLK -period 3.0 [get_ports CLK]

set_clock_uncertainty 0.05 [get_clocks CLK]

##  these two only matter while the clock is ideal (before CTS). After
##  CTS the clock is propagated and the real tree delays replace them.
set_clock_transition  0.05 [get_clocks CLK]
set_clock_latency     0.05 [get_clocks CLK]

##  inputs and outputs, the clock is removed from the inputs
set data_inputs [remove_from_collection [all_inputs] [get_ports CLK]]

set_driving_cell -lib_cell BUF_X4 -pin Z $data_inputs
set_load 0.05 [all_outputs]

set_input_delay  0.25 -clock CLK $data_inputs
set_output_delay 0.15 -clock CLK [all_outputs]

set_max_transition 0.20 [current_design]
