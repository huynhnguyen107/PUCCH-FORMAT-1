vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xbip_utils_v3_0_10
vlib activehdl/axi_utils_v2_0_6
vlib activehdl/c_reg_fd_v12_0_6
vlib activehdl/xbip_dsp48_wrapper_v3_0_4
vlib activehdl/xbip_pipe_v3_0_6
vlib activehdl/xbip_dsp48_addsub_v3_0_6
vlib activehdl/xbip_addsub_v3_0_6
vlib activehdl/c_addsub_v12_0_14
vlib activehdl/c_mux_bit_v12_0_6
vlib activehdl/c_shift_ram_v12_0_14
vlib activehdl/xbip_bram18k_v3_0_6
vlib activehdl/mult_gen_v12_0_16
vlib activehdl/cmpy_v6_0_18
vlib activehdl/floating_point_v7_0_17
vlib activehdl/xfft_v9_1_3
vlib activehdl/xlconstant_v1_1_6
vlib activehdl/xlslice_v1_0_2

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xbip_utils_v3_0_10 activehdl/xbip_utils_v3_0_10
vmap axi_utils_v2_0_6 activehdl/axi_utils_v2_0_6
vmap c_reg_fd_v12_0_6 activehdl/c_reg_fd_v12_0_6
vmap xbip_dsp48_wrapper_v3_0_4 activehdl/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_6 activehdl/xbip_pipe_v3_0_6
vmap xbip_dsp48_addsub_v3_0_6 activehdl/xbip_dsp48_addsub_v3_0_6
vmap xbip_addsub_v3_0_6 activehdl/xbip_addsub_v3_0_6
vmap c_addsub_v12_0_14 activehdl/c_addsub_v12_0_14
vmap c_mux_bit_v12_0_6 activehdl/c_mux_bit_v12_0_6
vmap c_shift_ram_v12_0_14 activehdl/c_shift_ram_v12_0_14
vmap xbip_bram18k_v3_0_6 activehdl/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 activehdl/mult_gen_v12_0_16
vmap cmpy_v6_0_18 activehdl/cmpy_v6_0_18
vmap floating_point_v7_0_17 activehdl/floating_point_v7_0_17
vmap xfft_v9_1_3 activehdl/xfft_v9_1_3
vmap xlconstant_v1_1_6 activehdl/xlconstant_v1_1_6
vmap xlslice_v1_0_2 activehdl/xlslice_v1_0_2

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/pucch1/ipshared/aca9/demapping.srcs/sources_1/new/demapping.v" \
"../../../bd/pucch1/ip/pucch1_demapping_0_1/sim/pucch1_demapping_0_1.v" \
"../../../bd/pucch1/ipshared/fcfe/physical_control.srcs/sources_1/new/physical_control.v" \
"../../../bd/pucch1/ip/pucch1_physical_control_0_0/sim/pucch1_physical_control_0_0.v" \
"../../../bd/pucch1/ipshared/5e8b/frame_sync.srcs/sources_1/new/frame_sync.v" \
"../../../bd/pucch1/ip/pucch1_frame_sync_0_0/sim/pucch1_frame_sync_0_0.v" \

vcom -work xbip_utils_v3_0_10 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_6 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_6 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_6 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_14 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work c_mux_bit_v12_0_6 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/c_mux_bit_v12_0_vh_rfs.vhd" \

vcom -work c_shift_ram_v12_0_14 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/c_shift_ram_v12_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work cmpy_v6_0_18 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/cmpy_v6_0_vh_rfs.vhd" \

vcom -work floating_point_v7_0_17 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/floating_point_v7_0_vh_rfs.vhd" \

vcom -work xfft_v9_1_3 -93 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/hdl/xfft_v9_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/xfft_0/sim/xfft_0.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/ctr_pre_fft_0/ctr_pre_fft.srcs/sources_1/new/ctr_pre_fft.v" \
"../../../bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/ofdm_demodulation.srcs/sources_1/ip/ctr_pre_fft_0/sim/ctr_pre_fft_0.v" \
"../../../bd/pucch1/ipshared/d443/ofdm_demodulation.srcs/sources_1/new/fft.v" \
"../../../bd/pucch1/ip/pucch1_ofdm_demodulation_0_0/sim/pucch1_ofdm_demodulation_0_0.v" \

vlog -work xlconstant_v1_1_6  -v2k5 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ipshared/34f7/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/pucch1/ip/pucch1_xlconstant_0_0/sim/pucch1_xlconstant_0_0.v" \

vlog -work xlslice_v1_0_2  -v2k5 \
"../../../../pucch1_integration.srcs/sources_1/bd/pucch1/ipshared/11d0/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/pucch1/ip/pucch1_xlslice_0_0/sim/pucch1_xlslice_0_0.v" \
"../../../bd/pucch1/ip/pucch1_frame_sync_1_0/sim/pucch1_frame_sync_1_0.v" \
"../../../bd/pucch1/ipshared/a151/ulcch_parameter.v" \
"../../../bd/pucch1/ip/pucch1_ulcch_parameter_0_0/sim/pucch1_ulcch_parameter_0_0.v" \
"../../../bd/pucch1/sim/pucch1.v" \

vlog -work xil_defaultlib \
"glbl.v"

