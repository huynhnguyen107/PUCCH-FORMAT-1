vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../n_cs_gen.srcs/sources_1/ip/ncs_scra_seq_8/scamble_sequence.srcs/sources_1/new/scramble_sequence.v" \
"../../../../n_cs_gen.srcs/sources_1/ip/ncs_scra_seq_8/sim/ncs_scra_seq_8.v" \


vlog -work xil_defaultlib \
"glbl.v"

