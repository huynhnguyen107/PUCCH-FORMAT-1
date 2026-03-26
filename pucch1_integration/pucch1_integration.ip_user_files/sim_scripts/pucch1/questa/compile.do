vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xbip_utils_v3_0_10
vlib questa_lib/msim/axi_utils_v2_0_6
vlib questa_lib/msim/c_reg_fd_v12_0_6
vlib questa_lib/msim/xbip_dsp48_wrapper_v3_0_4
vlib questa_lib/msim/xbip_pipe_v3_0_6
vlib questa_lib/msim/xbip_dsp48_addsub_v3_0_6
vlib questa_lib/msim/xbip_addsub_v3_0_6
vlib questa_lib/msim/c_addsub_v12_0_14
vlib questa_lib/msim/c_mux_bit_v12_0_6
vlib questa_lib/msim/c_shift_ram_v12_0_14
vlib questa_lib/msim/xbip_bram18k_v3_0_6
vlib questa_lib/msim/mult_gen_v12_0_16
vlib questa_lib/msim/cmpy_v6_0_18
vlib questa_lib/msim/floating_point_v7_0_17
vlib questa_lib/msim/xfft_v9_1_3
vlib questa_lib/msim/xlconstant_v1_1_6
vlib questa_lib/msim/xlslice_v1_0_2
vlib questa_lib/msim/fifo_generator_v13_2_5
vlib questa_lib/msim/blk_mem_gen_v8_4_4
vlib questa_lib/msim/xbip_dsp48_mult_v3_0_6
vlib questa_lib/msim/xbip_dsp48_multadd_v3_0_6
vlib questa_lib/msim/div_gen_v5_1_16
vlib questa_lib/msim/xlconcat_v2_1_3

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xbip_utils_v3_0_10 questa_lib/msim/xbip_utils_v3_0_10
vmap axi_utils_v2_0_6 questa_lib/msim/axi_utils_v2_0_6
vmap c_reg_fd_v12_0_6 questa_lib/msim/c_reg_fd_v12_0_6
vmap xbip_dsp48_wrapper_v3_0_4 questa_lib/msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_6 questa_lib/msim/xbip_pipe_v3_0_6
vmap xbip_dsp48_addsub_v3_0_6 questa_lib/msim/xbip_dsp48_addsub_v3_0_6
vmap xbip_addsub_v3_0_6 questa_lib/msim/xbip_addsub_v3_0_6
vmap c_addsub_v12_0_14 questa_lib/msim/c_addsub_v12_0_14
vmap c_mux_bit_v12_0_6 questa_lib/msim/c_mux_bit_v12_0_6
vmap c_shift_ram_v12_0_14 questa_lib/msim/c_shift_ram_v12_0_14
vmap xbip_bram18k_v3_0_6 questa_lib/msim/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 questa_lib/msim/mult_gen_v12_0_16
vmap cmpy_v6_0_18 questa_lib/msim/cmpy_v6_0_18
vmap floating_point_v7_0_17 questa_lib/msim/floating_point_v7_0_17
vmap xfft_v9_1_3 questa_lib/msim/xfft_v9_1_3
vmap xlconstant_v1_1_6 questa_lib/msim/xlconstant_v1_1_6
vmap xlslice_v1_0_2 questa_lib/msim/xlslice_v1_0_2
vmap fifo_generator_v13_2_5 questa_lib/msim/fifo_generator_v13_2_5
vmap blk_mem_gen_v8_4_4 questa_lib/msim/blk_mem_gen_v8_4_4
vmap xbip_dsp48_mult_v3_0_6 questa_lib/msim/xbip_dsp48_mult_v3_0_6
vmap xbip_dsp48_multadd_v3_0_6 questa_lib/msim/xbip_dsp48_multadd_v3_0_6
vmap div_gen_v5_1_16 questa_lib/msim/div_gen_v5_1_16
vmap xlconcat_v2_1_3 questa_lib/msim/xlconcat_v2_1_3

vlog -work xpm -64 -sv \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/pucch1/ipshared/4cc8/demapping.srcs/sources_1/new/demapping.v" \
"../../../bd/pucch1/ip/pucch1_demapping_0_1/sim/pucch1_demapping_0_1.v" \
"../../../bd/pucch1/ipshared/fcfe/physical_control.srcs/sources_1/new/physical_control.v" \
"../../../bd/pucch1/ip/pucch1_physical_control_0_0/sim/pucch1_physical_control_0_0.v" \
"../../../bd/pucch1/ipshared/5e8b/frame_sync.srcs/sources_1/new/frame_sync.v" \
"../../../bd/pucch1/ip/pucch1_frame_sync_0_0/sim/pucch1_frame_sync_0_0.v" \

vcom -work xbip_utils_v3_0_10 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_6 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_6 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_6 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_14 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work c_mux_bit_v12_0_6 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/c_mux_bit_v12_0_vh_rfs.vhd" \

vcom -work c_shift_ram_v12_0_14 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/c_shift_ram_v12_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work cmpy_v6_0_18 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/cmpy_v6_0_vh_rfs.vhd" \

vcom -work floating_point_v7_0_17 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/floating_point_v7_0_vh_rfs.vhd" \

vcom -work xfft_v9_1_3 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/xfft_v9_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/sim/xfft_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/ctr_pre_fft_0/ctr_pre_fft.srcs/sources_1/new/ctr_pre_fft.v" \
"../../../bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/ctr_pre_fft_0/sim/ctr_pre_fft_0.v" \
"../../../bd/pucch1/ipshared/d443/ofdm_demodulation.srcs/sources_1/new/fft.v" \
"../../../bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/sim/pucch1_ofdm_demodulation_0_0.v" \

vlog -work xlconstant_v1_1_6 -64 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ipshared/34f7/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 \
"../../../bd/pucch1/ip/pucch1_xlconstant_0_0/sim/pucch1_xlconstant_0_0.v" \

vlog -work xlslice_v1_0_2 -64 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ipshared/11d0/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 \
"../../../bd/pucch1/ip/pucch1_xlslice_0_0/sim/pucch1_xlslice_0_0.v" \
"../../../bd/pucch1/ip/pucch1_frame_sync_1_0/sim/pucch1_frame_sync_1_0.v" \
"../../../bd/pucch1/ipshared/a151/ulcch_parameter.v" \
"../../../bd/pucch1/ip/pucch1_ulcch_parameter_0_0/sim/pucch1_ulcch_parameter_0_0.v" \

vlog -work fifo_generator_v13_2_5 -64 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_data_dmrs_selection_0_0/data_dmrs_selection.srcs/sources_1/ip/data_dmrs_fifo_1/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_data_dmrs_selection_0_0/data_dmrs_selection.srcs/sources_1/ip/data_dmrs_fifo_1/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5 -64 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_data_dmrs_selection_0_0/data_dmrs_selection.srcs/sources_1/ip/data_dmrs_fifo_1/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib -64 \
"../../../bd/pucch1/ip/pucch1_data_dmrs_selection_0_0/data_dmrs_selection.srcs/sources_1/ip/data_dmrs_fifo_1/sim/data_dmrs_fifo_1.v" \
"../../../bd/pucch1/ip/pucch1_data_dmrs_selection_0_0/data_dmrs_selection.srcs/sources_1/ip/data_dmrs_fifo_0/sim/data_dmrs_fifo_0.v" \
"../../../bd/pucch1/ipshared/0c12/data_dmrs_selection.srcs/sources_1/new/data_dmrs_selection.v" \
"../../../bd/pucch1/ip/pucch1_data_dmrs_selection_0_0/sim/pucch1_data_dmrs_selection_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/pucch1/ip/pucch1_de_spread_0_0/de_spread.srcs/sources_1/ip/de_spread_cmpy_0/sim/de_spread_cmpy_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/pucch1/ip/pucch1_de_spread_0_0/de_spread.srcs/sources_1/ip/de_spread_fifo_0/sim/de_spread_fifo_0.v" \
"../../../bd/pucch1/ipshared/b055/de_spread.srcs/sources_1/new/de_spread.v" \
"../../../bd/pucch1/ip/pucch1_de_spread_0_0/sim/pucch1_de_spread_0_0.v" \
"../../../bd/pucch1/ip/pucch1_de_spread_1_0/sim/pucch1_de_spread_1_0.v" \
"../../../bd/pucch1/ip/pucch1_n_cs_gen_0_0/sources_1/ip/ncs_gen_fifo/sim/ncs_gen_fifo.v" \
"../../../bd/pucch1/ip/pucch1_n_cs_gen_0_0/sources_1/ip/ncs_scra_seq_8/scamble_sequence.srcs/sources_1/new/scramble_sequence.v" \
"../../../bd/pucch1/ip/pucch1_n_cs_gen_0_0/sources_1/ip/ncs_scra_seq_8/sim/ncs_scra_seq_8.v" \
"../../../bd/pucch1/ipshared/2aa0/sources_1/new/n_cs_gen.v" \
"../../../bd/pucch1/ip/pucch1_n_cs_gen_0_0/sim/pucch1_n_cs_gen_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/pucch1/ip/pucch1_phase_gen_0_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_1/sim/modulo12_mult_gen_1.vhd" \
"../../../bd/pucch1/ip/pucch1_phase_gen_0_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/ip/modulo12_mult_gen_2/sim/modulo12_mult_gen_2.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/pucch1/ip/pucch1_phase_gen_0_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/new/modulo_12.v" \
"../../../bd/pucch1/ip/pucch1_phase_gen_0_0/phase_gen.srcs/sources_1/ip/modulo_12_1_nomalize/sim/modulo_12_1_nomalize.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/pucch1/ip/pucch1_phase_gen_0_0/phase_gen.srcs/sources_1/ip/dis_alpha_gen_0/ip/mult_gen_dis_alpha/sim/mult_gen_dis_alpha.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/pucch1/ip/pucch1_phase_gen_0_0/phase_gen.srcs/sources_1/ip/dis_alpha_gen_0/new/dis_alpha_gen.v" \
"../../../bd/pucch1/ip/pucch1_phase_gen_0_0/phase_gen.srcs/sources_1/ip/dis_alpha_gen_0/sim/dis_alpha_gen_0.v" \
"../../../bd/pucch1/ip/pucch1_phase_gen_0_0/phase_gen.srcs/sources_1/ip/alpha_modulo_12_0/sim/alpha_modulo_12_0.v" \
"../../../bd/pucch1/ipshared/ce59/phase_gen.srcs/sources_1/new/phase_gen.v" \
"../../../bd/pucch1/ip/pucch1_phase_gen_0_0/sim/pucch1_phase_gen_0_0.v" \
"../../../bd/pucch1/ip/pucch1_phase_gen_control_0_0/phase_gen_control.srcs/sources_1/ip/phase_fifo_0/sim/phase_fifo_0.v" \
"../../../bd/pucch1/ipshared/1744/phase_gen_control.srcs/sources_1/new/phase_gen_control.v" \
"../../../bd/pucch1/ip/pucch1_phase_gen_control_0_0/sim/pucch1_phase_gen_control_0_0.v" \

vlog -work blk_mem_gen_v8_4_4 -64 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_base_sequence_0_0/base_seq.srcs/sources_1/ip/phi_matrix_0/phi_matrix.srcs/sources_1/ip/blk_mem_gen_0/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 \
"../../../bd/pucch1/ip/pucch1_base_sequence_0_0/base_seq.srcs/sources_1/ip/phi_matrix_0/phi_matrix.srcs/sources_1/ip/blk_mem_gen_0/sim/blk_mem_gen_0.v" \
"../../../bd/pucch1/ip/pucch1_base_sequence_0_0/base_seq.srcs/sources_1/ip/phi_matrix_0/phi_matrix.srcs/sources_1/new/phi_matrix.v" \
"../../../bd/pucch1/ip/pucch1_base_sequence_0_0/base_seq.srcs/sources_1/ip/phi_matrix_0/sim/phi_matrix_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/pucch1/ip/pucch1_base_sequence_0_0/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/m30_mul1/sim/m30_mul1.vhd" \
"../../../bd/pucch1/ip/pucch1_base_sequence_0_0/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/m30_mul0/sim/m30_mul0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/pucch1/ip/pucch1_base_sequence_0_0/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/new/modulo_n.v" \
"../../../bd/pucch1/ip/pucch1_base_sequence_0_0/base_seq.srcs/sources_1/ip/modulo_30_2/sim/modulo_30_2.v" \
"../../../bd/pucch1/ip/pucch1_base_sequence_0_0/base_seq.srcs/sources_1/ip/scramble_sequence_1bit_0/scamble_sequence.srcs/sources_1/new/scramble_sequence.v" \
"../../../bd/pucch1/ip/pucch1_base_sequence_0_0/base_seq.srcs/sources_1/ip/scramble_sequence_1bit_0/sim/scramble_sequence_1bit_0.v" \
"../../../bd/pucch1/ip/pucch1_base_sequence_0_0/base_seq.srcs/sources_1/ip/modulo_30_1/sim/modulo_30_1.v" \
"../../../bd/pucch1/ip/pucch1_base_sequence_0_0/base_seq.srcs/sources_1/ip/scramble_sequence_8bits_0/sim/scramble_sequence_8bits_0.v" \
"../../../bd/pucch1/ip/pucch1_base_sequence_0_0/base_seq.srcs/sources_1/ip/modulo_30_0/sim/modulo_30_0.v" \
"../../../bd/pucch1/ipshared/85a1/base_seq.srcs/sources_1/new/base_sequence.v" \
"../../../bd/pucch1/ip/pucch1_base_sequence_0_0/sim/pucch1_base_sequence_0_0.v" \
"../../../bd/pucch1/ip/pucch1_base_sequence_1_0/sim/pucch1_base_sequence_1_0.v" \
"../../../bd/pucch1/ipshared/1390/sources_1/new/nfs_gen.v" \
"../../../bd/pucch1/ip/pucch1_nfs_gen_0_0/sim/pucch1_nfs_gen_0_0.v" \
"../../../bd/pucch1/ip/pucch1_ba_seq_control_0_0/ba_seq_control.srcs/sources_1/ip/base_se_control_blk_1/sim/base_se_control_blk_1.v" \
"../../../bd/pucch1/ip/pucch1_ba_seq_control_0_0/ba_seq_control.srcs/sources_1/ip/ba_seq_control_blk_0/sim/ba_seq_control_blk_0.v" \
"../../../bd/pucch1/ipshared/1353/ba_seq_control.srcs/sources_1/new/ba_seq_control.v" \
"../../../bd/pucch1/ip/pucch1_ba_seq_control_0_0/sim/pucch1_ba_seq_control_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/pucch1/ip/pucch1_com_mul_cyclic_0_0/sources_1/ip/cyclic_cmpy_0/sim/cyclic_cmpy_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/pucch1/ipshared/7068/sources_1/new/com_mul_cyclic.v" \
"../../../bd/pucch1/ip/pucch1_com_mul_cyclic_0_0/sim/pucch1_com_mul_cyclic_0_0.v" \
"../../../bd/pucch1/ip/pucch1_xlconstant_0_1/sim/pucch1_xlconstant_0_1.v" \
"../../../bd/pucch1/ip/pucch1_xlconstant_0_2/sim/pucch1_xlconstant_0_2.v" \
"../../../bd/pucch1/ip/pucch1_xlconstant_1_0/sim/pucch1_xlconstant_1_0.v" \
"../../../bd/pucch1/ip/pucch1_n_cs_gen_0_1/sim/pucch1_n_cs_gen_0_1.v" \
"../../../bd/pucch1/ip/pucch1_phase_gen_0_1/sim/pucch1_phase_gen_0_1.v" \
"../../../bd/pucch1/ip/pucch1_phase_gen_control_0_1/sim/pucch1_phase_gen_control_0_1.v" \
"../../../bd/pucch1/ip/pucch1_base_sequence_0_1/sim/pucch1_base_sequence_0_1.v" \
"../../../bd/pucch1/ip/pucch1_base_sequence_1_1/sim/pucch1_base_sequence_1_1.v" \
"../../../bd/pucch1/ip/pucch1_nfs_gen_0_1/sim/pucch1_nfs_gen_0_1.v" \
"../../../bd/pucch1/ip/pucch1_ba_seq_control_0_1/sim/pucch1_ba_seq_control_0_1.v" \
"../../../bd/pucch1/ip/pucch1_com_mul_cyclic_0_1/sim/pucch1_com_mul_cyclic_0_1.v" \
"../../../bd/pucch1/ip/pucch1_xlconstant_0_3/sim/pucch1_xlconstant_0_3.v" \
"../../../bd/pucch1/ip/pucch1_xlconstant_1_1/sim/pucch1_xlconstant_1_1.v" \
"../../../bd/pucch1/ip/pucch1_xlconstant_2_0/sim/pucch1_xlconstant_2_0.v" \
"../../../bd/pucch1/ip/pucch1_wise_spreading_0_0/wise_spreading.srcs/sources_1/ip/wise_rom_7/sim/wise_rom_7.v" \
"../../../bd/pucch1/ip/pucch1_wise_spreading_0_0/wise_spreading.srcs/sources_1/ip/wise_rom_6/sim/wise_rom_6.v" \
"../../../bd/pucch1/ip/pucch1_wise_spreading_0_0/wise_spreading.srcs/sources_1/ip/wise_rom_5/sim/wise_rom_5.v" \
"../../../bd/pucch1/ip/pucch1_wise_spreading_0_0/wise_spreading.srcs/sources_1/ip/wise_rom_4/sim/wise_rom_4.v" \
"../../../bd/pucch1/ip/pucch1_wise_spreading_0_0/wise_spreading.srcs/sources_1/ip/wise_rom_3/sim/wise_rom_3.v" \
"../../../bd/pucch1/ipshared/63d0/wise_spreading.srcs/sources_1/new/wise_spreading.v" \
"../../../bd/pucch1/ip/pucch1_wise_spreading_0_0/sim/pucch1_wise_spreading_0_0.v" \
"../../../bd/pucch1/ip/pucch1_wise_spreading_0_1/sim/pucch1_wise_spreading_0_1.v" \
"../../../bd/pucch1/ip/pucch1_dmrs_wise_spreading_0_0/sim/pucch1_dmrs_wise_spreading_0_0.v" \
"../../../bd/pucch1/ip/pucch1_dmrs_wise_spreading_1_0/sim/pucch1_dmrs_wise_spreading_1_0.v" \
"../../../bd/pucch1/ipshared/a3ad/payload_est_SINR.srcs/sources_1/new/payload_est_SINR.v" \
"../../../bd/pucch1/ip/pucch1_payload_est_SINR_0_0/sim/pucch1_payload_est_SINR_0_0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/pucch1/ip/pucch1_mean_data_0_0/mean_data.srcs/sources_1/ip/c1_cmpy/sim/c1_cmpy.vhd" \
"../../../bd/pucch1/ip/pucch1_mean_data_0_0/mean_data.srcs/sources_1/ip/mean_data_cmpy_4/sim/mean_data_cmpy_4.vhd" \
"../../../bd/pucch1/ip/pucch1_mean_data_0_0/mean_data.srcs/sources_1/ip/mean_data_cmpy_3/sim/mean_data_cmpy_3.vhd" \
"../../../bd/pucch1/ip/pucch1_mean_data_0_0/mean_data.srcs/sources_1/ip/mean_data_cmpy_2/sim/mean_data_cmpy_2.vhd" \
"../../../bd/pucch1/ip/pucch1_mean_data_0_0/mean_data.srcs/sources_1/ip/mean_data_cmpy_1/sim/mean_data_cmpy_1.vhd" \

vcom -work xbip_dsp48_mult_v3_0_6 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_mean_data_0_0/mean_data.srcs/sources_1/ip/mean_data_div_gen_0/hdl/xbip_dsp48_mult_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_6 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_mean_data_0_0/mean_data.srcs/sources_1/ip/mean_data_div_gen_0/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work div_gen_v5_1_16 -64 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_mean_data_0_0/mean_data.srcs/sources_1/ip/mean_data_div_gen_0/hdl/div_gen_v5_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/pucch1/ip/pucch1_mean_data_0_0/mean_data.srcs/sources_1/ip/mean_data_div_gen_0/sim/mean_data_div_gen_0.vhd" \
"../../../bd/pucch1/ip/pucch1_mean_data_0_0/mean_data.srcs/sources_1/ip/mean_noise_mult_0/sim/mean_noise_mult_0.vhd" \
"../../../bd/pucch1/ip/pucch1_mean_data_0_0/mean_data.srcs/sources_1/ip/power_cmpy_0/sim/power_cmpy_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/pucch1/ip/pucch1_mean_data_0_0/mean_data.srcs/sources_1/ip/mean_data_fifo0/sim/mean_data_fifo0.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/pucch1/ip/pucch1_mean_data_0_0/mean_data.srcs/sources_1/ip/sig_power_cmpy_4/sim/sig_power_cmpy_4.vhd" \
"../../../bd/pucch1/ip/pucch1_mean_data_0_0/mean_data.srcs/sources_1/ip/sig_power_cmpy_3/sim/sig_power_cmpy_3.vhd" \
"../../../bd/pucch1/ip/pucch1_mean_data_0_0/mean_data.srcs/sources_1/ip/sig_power_cmpy_2/sim/sig_power_cmpy_2.vhd" \
"../../../bd/pucch1/ip/pucch1_mean_data_0_0/mean_data.srcs/sources_1/ip/sig_power_cmpy_1/sim/sig_power_cmpy_1.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/pucch1/ipshared/ff26/mean_data.srcs/sources_1/new/mean_data.v" \
"../../../bd/pucch1/ip/pucch1_mean_data_0_0/sim/pucch1_mean_data_0_0.v" \
"../../../bd/pucch1/ipshared/c1d2/sr_ack_detector.srcs/sources_1/new/sr_ack_detector.v" \
"../../../bd/pucch1/ip/pucch1_sr_ack_detector_0_0/sim/pucch1_sr_ack_detector_0_0.v" \
"../../../bd/pucch1/ip/pucch1_xlconstant_0_4/sim/pucch1_xlconstant_0_4.v" \

vlog -work xlconcat_v2_1_3 -64 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ipshared/442e/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 \
"../../../bd/pucch1/ip/pucch1_xlconcat_0_0/sim/pucch1_xlconcat_0_0.v" \
"../../../bd/pucch1/ip/pucch1_xlconcat_0_1/sim/pucch1_xlconcat_0_1.v" \
"../../../bd/pucch1/ip/pucch1_xlconstant_2_1/sim/pucch1_xlconstant_2_1.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/pucch1/ip/pucch1_block_wise_spreading_0_0/block_wise_spreading.srcs/sources_1/ip/spreading_cmpy_0/sim/spreading_cmpy_0.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/pucch1/ipshared/7c92/block_wise_spreading.srcs/sources_1/new/block_wise_spreading.v" \
"../../../bd/pucch1/ip/pucch1_block_wise_spreading_0_0/sim/pucch1_block_wise_spreading_0_0.v" \
"../../../bd/pucch1/ip/pucch1_block_wise_spreading_dmrs_0/sim/pucch1_block_wise_spreading_dmrs_0.v" \
"../../../bd/pucch1/sim/pucch1.v" \

vlog -work xil_defaultlib \
"glbl.v"

