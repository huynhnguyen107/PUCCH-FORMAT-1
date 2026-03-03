-makelib xcelium_lib/xpm -sv \
  "D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../base_sequence.srcs/sources_1/ip/scramble_sequence_1bit_0/scamble_sequence.srcs/sources_1/new/scramble_sequence.v" \
  "../../../../base_sequence.srcs/sources_1/ip/scramble_sequence_1bit_0/sim/scramble_sequence_1bit_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

