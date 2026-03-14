vlib work
vlib riviera

vlib riviera/fifo_generator_v13_2_5
vlib riviera/xil_defaultlib

vmap fifo_generator_v13_2_5 riviera/fifo_generator_v13_2_5
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work fifo_generator_v13_2_5  -v2k5 \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../de_spread.srcs/sources_1/ip/de_spread_fifo_0/sim/de_spread_fifo_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

