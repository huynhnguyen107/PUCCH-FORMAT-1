-makelib ies_lib/xpm -sv \
  "D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../n_cs_gen.srcs/sources_1/ip/scra_seq_8_ncs_0/scra_seq_8_ncs.v" \
  "../../../../n_cs_gen.srcs/sources_1/ip/scra_seq_8_ncs_0/sim/scra_seq_8_ncs_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

