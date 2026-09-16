# run the registered booth multiplier testbench
# usage: do sim.do

# which variant to simulate
set CFG work.cfg_tb_super_beh

vsim -voptargs=+acc $CFG

add wave -radix hexadecimal /tb_boothmul_registered/A
add wave -radix hexadecimal /tb_boothmul_registered/B
add wave -radix hexadecimal /tb_boothmul_registered/P

add wave /tb_boothmul_registered/CLK
add wave /tb_boothmul_registered/RST
add wave /tb_boothmul_registered/LD

run -all
quit -f