vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/xbip_utils_v3_0_10
vlib activehdl/xbip_pipe_v3_0_6
vlib activehdl/xbip_bram18k_v3_0_6
vlib activehdl/mult_gen_v12_0_16
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xbip_utils_v3_0_10 activehdl/xbip_utils_v3_0_10
vmap xbip_pipe_v3_0_6 activehdl/xbip_pipe_v3_0_6
vmap xbip_bram18k_v3_0_6 activehdl/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 activehdl/mult_gen_v12_0_16
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_10 -93 \
"../../../ipstatic/Cyclic_Shift_Gen/base_seq/base_seq.srcs/sources_1/ip/modulo_30_0/modulo_n.srcs/sources_1/ip/modulo30_mult_gen_1/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"../../../ipstatic/Cyclic_Shift_Gen/base_seq/base_seq.srcs/sources_1/ip/modulo_30_0/modulo_n.srcs/sources_1/ip/modulo30_mult_gen_1/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -93 \
"../../../ipstatic/Cyclic_Shift_Gen/base_seq/base_seq.srcs/sources_1/ip/modulo_30_0/modulo_n.srcs/sources_1/ip/modulo30_mult_gen_1/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -93 \
"../../../ipstatic/Cyclic_Shift_Gen/base_seq/base_seq.srcs/sources_1/ip/modulo_30_0/modulo_n.srcs/sources_1/ip/modulo30_mult_gen_1/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../base_seq.srcs/sources_1/ip/modulo_30_0/modulo_n.srcs/sources_1/ip/modulo30_mult_gen_1/sim/modulo30_mult_gen_1.vhd" \
"../../../../base_seq.srcs/sources_1/ip/modulo_30_0/modulo_n.srcs/sources_1/ip/modulo30_mult_gen_0/sim/modulo30_mult_gen_0.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../base_seq.srcs/sources_1/ip/modulo_30_0/modulo_n.srcs/sources_1/new/modulo_n.v" \
"../../../../base_seq.srcs/sources_1/ip/modulo_30_0/sim/modulo_30_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

