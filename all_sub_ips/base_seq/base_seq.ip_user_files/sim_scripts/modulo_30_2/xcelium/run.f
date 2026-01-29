-makelib xcelium_lib/xpm -sv \
  "D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xbip_utils_v3_0_10 \
  "../../../ipstatic/Cyclic_Shift_Gen/base_seq/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/modulo30_mult_gen_1/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_pipe_v3_0_6 \
  "../../../ipstatic/Cyclic_Shift_Gen/base_seq/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/modulo30_mult_gen_1/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_bram18k_v3_0_6 \
  "../../../ipstatic/Cyclic_Shift_Gen/base_seq/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/modulo30_mult_gen_1/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/mult_gen_v12_0_16 \
  "../../../ipstatic/Cyclic_Shift_Gen/base_seq/base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/modulo30_mult_gen_1/hdl/mult_gen_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/modulo30_mult_gen_1/sim/modulo30_mult_gen_1.vhd" \
  "../../../../base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/ip/modulo30_mult_gen_0/sim/modulo30_mult_gen_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../base_seq.srcs/sources_1/ip/modulo_30_2/modulo_n.srcs/sources_1/new/modulo_n.v" \
  "../../../../base_seq.srcs/sources_1/ip/modulo_30_2/sim/modulo_30_2.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

