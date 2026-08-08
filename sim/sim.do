# run the booth multiplier testbench
# usage: do sim.do

vsim -voptargs=+acc work.multiplier_tb(test)

add wave -radix hexadecimal /multiplier_tb/A_i
add wave -radix hexadecimal /multiplier_tb/B_i
add wave -radix hexadecimal /multiplier_tb/P_i
add wave -radix binary      /multiplier_tb/uut/sel
add wave -radix binary      /multiplier_tb/uut/neg_bits
add wave -radix hexadecimal /multiplier_tb/uut/pp
add wave -radix hexadecimal /multiplier_tb/uut/tree_c
add wave -radix hexadecimal /multiplier_tb/uut/tree_s

run -all
