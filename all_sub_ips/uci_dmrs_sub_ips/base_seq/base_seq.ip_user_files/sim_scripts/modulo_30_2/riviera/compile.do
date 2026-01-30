vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/xbip_utils_v3_0_10
vlib riviera/xbip_pipe_v3_0_6
vlib riviera/xbip_bram18k_v3_0_6
vlib riviera/mult_gen_v12_0_16
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xbip_utils_v3_0_10 riviera/xbip_utils_v3_0_10
vmap xbip_pipe_v3_0_6 riviera/xbip_pipe_v3_0_6
vmap xbip_bram18k_v3_0_6 riviera/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 riviera/mult_gen_v12_0_16
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -sv2k12 \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_10 -93 \
"../../../ipstatic/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/m30_mul1/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"../../../ipstatic/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/m30_mul1/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -93 \
"../../../ipstatic/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/m30_mul1/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -93 \
"../../../ipstatic/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/m30_mul1/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../../base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/m30_mul1/sim/m30_mul1.vhd" \
"../../../../base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/m30_mul0/sim/m30_mul0.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/new/modulo_n.v" \
"../../../../base_seq.srcs/sources_1/ip/modulo_30_2/sim/modulo_30_2.v" \

vlog -work xil_defaultlib \
"glbl.v"

