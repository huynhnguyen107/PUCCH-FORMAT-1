vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/blk_mem_gen_v8_4_4
vlib riviera/xil_defaultlib
vlib riviera/xbip_utils_v3_0_10
vlib riviera/xbip_pipe_v3_0_6
vlib riviera/xbip_bram18k_v3_0_6
vlib riviera/mult_gen_v12_0_16
vlib riviera/fifo_generator_v13_2_5
vlib riviera/axi_utils_v2_0_6
vlib riviera/cmpy_v6_0_18
vlib riviera/xlconstant_v1_1_6

vmap xpm riviera/xpm
vmap blk_mem_gen_v8_4_4 riviera/blk_mem_gen_v8_4_4
vmap xil_defaultlib riviera/xil_defaultlib
vmap xbip_utils_v3_0_10 riviera/xbip_utils_v3_0_10
vmap xbip_pipe_v3_0_6 riviera/xbip_pipe_v3_0_6
vmap xbip_bram18k_v3_0_6 riviera/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 riviera/mult_gen_v12_0_16
vmap fifo_generator_v13_2_5 riviera/fifo_generator_v13_2_5
vmap axi_utils_v2_0_6 riviera/axi_utils_v2_0_6
vmap cmpy_v6_0_18 riviera/cmpy_v6_0_18
vmap xlconstant_v1_1_6 riviera/xlconstant_v1_1_6

vlog -work xpm  -sv2k12 \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 \
"../../../../cyclic_shift.srcs/sources_1/bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/phi_matrix_0/phi_matrix.srcs/sources_1/ip/blk_mem_gen_0/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/phi_matrix_0/phi_matrix.srcs/sources_1/ip/blk_mem_gen_0/sim/blk_mem_gen_0.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/phi_matrix_0/phi_matrix.srcs/sources_1/new/phi_matrix.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/phi_matrix_0/sim/phi_matrix_0.v" \

vcom -work xbip_utils_v3_0_10 -93 \
"../../../../cyclic_shift.srcs/sources_1/bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/m30_mul1/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"../../../../cyclic_shift.srcs/sources_1/bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/m30_mul1/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -93 \
"../../../../cyclic_shift.srcs/sources_1/bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/m30_mul1/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -93 \
"../../../../cyclic_shift.srcs/sources_1/bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/m30_mul1/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/m30_mul1/sim/m30_mul1.vhd" \
"../../../bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/m30_mul0/sim/m30_mul0.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/new/modulo_n.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/modulo_30_2/sim/modulo_30_2.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/scramble_sequence_1bit_0/scamble_sequence.srcs/sources_1/new/scramble_sequence.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/scramble_sequence_1bit_0/sim/scramble_sequence_1bit_0.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/modulo_30_1/sim/modulo_30_1.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/scramble_sequence_8bits_0/scamble_sequence.srcs/sources_1/new/scramble_sequence.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/scramble_sequence_8bits_0/sim/scramble_sequence_8bits_0.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/base_seq.srcs/sources_1/ip/modulo_30_0/sim/modulo_30_0.v" \
"../../../bd/cyclic_gen/ipshared/85a1/base_seq.srcs/sources_1/new/base_sequence.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_0/sim/cyclic_gen_base_sequence_0_0.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_base_sequence_0_1/sim/cyclic_gen_base_sequence_0_1.v" \

vlog -work fifo_generator_v13_2_5  -v2k5 \
"../../../../cyclic_shift.srcs/sources_1/bd/cyclic_gen/ip/cyclic_gen_n_cs_gen_0_0/sources_1/ip/ncs_gen_fifo/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../cyclic_shift.srcs/sources_1/bd/cyclic_gen/ip/cyclic_gen_n_cs_gen_0_0/sources_1/ip/ncs_gen_fifo/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 \
"../../../../cyclic_shift.srcs/sources_1/bd/cyclic_gen/ip/cyclic_gen_n_cs_gen_0_0/sources_1/ip/ncs_gen_fifo/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/cyclic_gen/ip/cyclic_gen_n_cs_gen_0_0/sources_1/ip/ncs_gen_fifo/sim/ncs_gen_fifo.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_n_cs_gen_0_0/sources_1/ip/ncs_scra_seq_8/sim/ncs_scra_seq_8.v" \
"../../../bd/cyclic_gen/ipshared/2aa0/sources_1/new/n_cs_gen.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_n_cs_gen_0_0/sim/cyclic_gen_n_cs_gen_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/cyclic_gen/ip/cyclic_gen_phase_gen_0_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/sim/modulo12_mult_gen_1.vhd" \
"../../../bd/cyclic_gen/ip/cyclic_gen_phase_gen_0_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_2/sim/modulo12_mult_gen_2.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/cyclic_gen/ip/cyclic_gen_phase_gen_0_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/new/modulo_12.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_phase_gen_0_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/sim/modulo_12_1_nomalize.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/cyclic_gen/ip/cyclic_gen_phase_gen_0_0/phase_gen.srcs/sources_1/ip/dis_alpha_gen_0/ip/mult_gen_dis_alpha/sim/mult_gen_dis_alpha.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/cyclic_gen/ip/cyclic_gen_phase_gen_0_0/phase_gen.srcs/sources_1/ip/dis_alpha_gen_0/new/dis_alpha_gen.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_phase_gen_0_0/phase_gen.srcs/sources_1/ip/dis_alpha_gen_0/sim/dis_alpha_gen_0.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_phase_gen_0_0/phase_gen.srcs/sources_1/ip/alpha_modulo_12_0/sim/alpha_modulo_12_0.v" \
"../../../bd/cyclic_gen/ipshared/ce59/phase_gen.srcs/sources_1/new/phase_gen.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_phase_gen_0_0/sim/cyclic_gen_phase_gen_0_0.v" \
"../../../bd/cyclic_gen/ipshared/1390/sources_1/new/nfs_gen.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_nfs_gen_0_0/sim/cyclic_gen_nfs_gen_0_0.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_ba_seq_control_0_0/ba_seq_control.srcs/sources_1/ip/base_se_control_blk_1/sim/base_se_control_blk_1.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_ba_seq_control_0_0/ba_seq_control.srcs/sources_1/ip/ba_seq_control_blk_0/sim/ba_seq_control_blk_0.v" \
"../../../bd/cyclic_gen/ipshared/1353/ba_seq_control.srcs/sources_1/new/ba_seq_control.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_ba_seq_control_0_0/sim/cyclic_gen_ba_seq_control_0_0.v" \

vcom -work axi_utils_v2_0_6 -93 \
"../../../../cyclic_shift.srcs/sources_1/bd/cyclic_gen/ip/cyclic_gen_com_mul_cyclic_0_0/sources_1/ip/cyclic_cmpy_0/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work cmpy_v6_0_18 -93 \
"../../../../cyclic_shift.srcs/sources_1/bd/cyclic_gen/ip/cyclic_gen_com_mul_cyclic_0_0/sources_1/ip/cyclic_cmpy_0/hdl/cmpy_v6_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/cyclic_gen/ip/cyclic_gen_com_mul_cyclic_0_0/sources_1/ip/cyclic_cmpy_0/sim/cyclic_cmpy_0.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/cyclic_gen/ipshared/5c1d/sources_1/new/com_mul_cyclic.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_com_mul_cyclic_0_0/sim/cyclic_gen_com_mul_cyclic_0_0.v" \

vlog -work xlconstant_v1_1_6  -v2k5 \
"../../../../cyclic_shift.srcs/sources_1/bd/cyclic_gen/ipshared/34f7/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/cyclic_gen/ip/cyclic_gen_xlconstant_0_0/sim/cyclic_gen_xlconstant_0_0.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_xlconstant_0_1/sim/cyclic_gen_xlconstant_0_1.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_xlconstant_0_2/sim/cyclic_gen_xlconstant_0_2.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_phase_gen_control_0_0/phase_gen_control.srcs/sources_1/ip/phase_fifo_0/sim/phase_fifo_0.v" \
"../../../bd/cyclic_gen/ipshared/cdc1/phase_gen_control.srcs/sources_1/new/phase_gen_control.v" \
"../../../bd/cyclic_gen/ip/cyclic_gen_phase_gen_control_0_0/sim/cyclic_gen_phase_gen_control_0_0.v" \
"../../../bd/cyclic_gen/sim/cyclic_gen.v" \

vlog -work xil_defaultlib \
"glbl.v"

