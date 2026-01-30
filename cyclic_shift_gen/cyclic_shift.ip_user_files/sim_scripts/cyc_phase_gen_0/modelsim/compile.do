vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xbip_utils_v3_0_10
vlib modelsim_lib/msim/xbip_pipe_v3_0_6
vlib modelsim_lib/msim/xbip_bram18k_v3_0_6
vlib modelsim_lib/msim/mult_gen_v12_0_16
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xbip_utils_v3_0_10 modelsim_lib/msim/xbip_utils_v3_0_10
vmap xbip_pipe_v3_0_6 modelsim_lib/msim/xbip_pipe_v3_0_6
vmap xbip_bram18k_v3_0_6 modelsim_lib/msim/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 modelsim_lib/msim/mult_gen_v12_0_16
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm -64 -incr -sv \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_10 -64 -93 \
"../../../ipstatic/cyclic_shift_gen/cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -64 -93 \
"d:/FPGA/Vivaldo Project/PUCCH-FORMAT-0/cyclic_shift_gen/cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -64 -93 \
"d:/FPGA/Vivaldo Project/PUCCH-FORMAT-0/cyclic_shift_gen/cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -64 -93 \
"d:/FPGA/Vivaldo Project/PUCCH-FORMAT-0/cyclic_shift_gen/cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/sim/modulo12_mult_gen_1.vhd" \
"../../../../cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_2/sim/modulo12_mult_gen_2.vhd" \

vlog -work xil_defaultlib -64 -incr \
"../../../../cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/new/modulo_12.v" \
"../../../../cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/sim/modulo_12_1_nomalize.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../../cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/dis_alpha_gen_0/ip/mult_gen_dis_alpha/sim/mult_gen_dis_alpha.vhd" \

vlog -work xil_defaultlib -64 -incr \
"../../../../cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/dis_alpha_gen_0/new/dis_alpha_gen.v" \
"../../../../cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/dis_alpha_gen_0/sim/dis_alpha_gen_0.v" \
"../../../../cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/alpha_modulo_12_0/sim/alpha_modulo_12_0.v" \
"../../../../cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/scramble_sequence_8bits_0/scamble_sequence.srcs/sources_1/new/scramble_sequence.v" \
"../../../../cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/ip/scramble_sequence_8bits_0/sim/scramble_sequence_8bits_0.v" \
"../../../../cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/phase_gen.srcs/sources_1/new/phase_gen.v" \
"../../../../cyclic_shift.srcs/sources_1/ip/cyc_phase_gen_0/sim/cyc_phase_gen_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

