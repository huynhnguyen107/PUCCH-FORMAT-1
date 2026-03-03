vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../n_cs_gen.srcs/sources_1/ip/ncs_scra_seq_8/scamble_sequence.srcs/sources_1/new/scramble_sequence.v" \
"../../../../n_cs_gen.srcs/sources_1/ip/ncs_scra_seq_8/sim/ncs_scra_seq_8.v" \


vlog -work xil_defaultlib \
"glbl.v"

