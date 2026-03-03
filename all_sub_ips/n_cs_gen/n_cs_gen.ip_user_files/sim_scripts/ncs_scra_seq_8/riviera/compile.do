vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../n_cs_gen.srcs/sources_1/ip/ncs_scra_seq_8/scamble_sequence.srcs/sources_1/new/scramble_sequence.v" \
"../../../../n_cs_gen.srcs/sources_1/ip/ncs_scra_seq_8/sim/ncs_scra_seq_8.v" \


vlog -work xil_defaultlib \
"glbl.v"

