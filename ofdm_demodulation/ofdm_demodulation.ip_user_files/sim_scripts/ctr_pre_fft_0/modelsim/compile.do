vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm -64 -incr -sv \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr \
"../../../../ofdm_demodulation.srcs/sources_1/ip/ctr_pre_fft_0/ctr_pre_fft.srcs/sources_1/new/ctr_pre_fft.v" \
"../../../../ofdm_demodulation.srcs/sources_1/ip/ctr_pre_fft_0/sim/ctr_pre_fft_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

