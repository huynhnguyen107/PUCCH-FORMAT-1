-makelib xcelium_lib/xpm -sv \
  "D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../cyclic_shift.srcs/sources_1/ip/uci_ncs_gen/sources_1/ip/ncs_gen_fifo/sim/ncs_gen_fifo.v" \
  "../../../../cyclic_shift.srcs/sources_1/ip/uci_ncs_gen/sources_1/ip/ncs_scra_seq_8/scamble_sequence.srcs/sources_1/new/scramble_sequence.v" \
  "../../../../cyclic_shift.srcs/sources_1/ip/uci_ncs_gen/sources_1/ip/ncs_scra_seq_8/sim/ncs_scra_seq_8.v" \
  "../../../../cyclic_shift.srcs/sources_1/ip/uci_ncs_gen/sources_1/new/n_cs_gen.v" \
  "../../../../cyclic_shift.srcs/sources_1/ip/uci_ncs_gen/sim/uci_ncs_gen.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

