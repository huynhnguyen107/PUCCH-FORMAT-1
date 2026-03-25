//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Tue Mar 24 21:41:45 2026
//Host        : LAPTOP-CHCSI1R5 running 64-bit major release  (build 9200)
//Command     : generate_target pucch1.bd
//Design      : pucch1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module cyclic_dmrs_imp_1IXJDMF
   (clk,
    dmrs_cyclic,
    dmrs_cylcic_valid,
    in_valid,
    nfs_0,
    nfs_1,
    nfs_valid,
    rst,
    uci_NID,
    uci_first_symbol,
    uci_grouphopping,
    uci_intra_fr_hop,
    uci_m0,
    uci_nSymbs,
    uci_slot,
    wise_enable);
  input clk;
  output [31:0]dmrs_cyclic;
  output dmrs_cylcic_valid;
  input in_valid;
  output [2:0]nfs_0;
  output [2:0]nfs_1;
  output nfs_valid;
  input rst;
  input [15:0]uci_NID;
  input [7:0]uci_first_symbol;
  input [7:0]uci_grouphopping;
  input [7:0]uci_intra_fr_hop;
  input [15:0]uci_m0;
  input [7:0]uci_nSymbs;
  input [15:0]uci_slot;
  output wise_enable;

  wire [31:0]ba_seq_control_0_basequence_out;
  wire ba_seq_control_0_basequence_out_valid;
  wire [31:0]base_sequence_0_base_sequence;
  wire base_sequence_0_base_sequence_valid;
  wire [31:0]base_sequence_1_base_sequence;
  wire base_sequence_1_base_sequence_valid;
  wire clk_1;
  wire [31:0]com_mul_cyclic_0_cyclic;
  wire com_mul_cyclic_0_cyclic_valid;
  wire com_mul_cyclic_0_o_wise_enable;
  wire in_valid_1;
  wire [7:0]n_cs_gen_0_ncs;
  wire n_cs_gen_0_ncs_valid;
  wire [2:0]nfs_gen_0_nfs_0;
  wire [2:0]nfs_gen_0_nfs_1;
  wire nfs_gen_0_nfs_valid;
  wire [31:0]phase_gen_0_phase;
  wire phase_gen_0_phase_valid;
  wire [31:0]phase_gen_control_0_o_phase;
  wire phase_gen_control_0_o_phase_valid;
  wire phase_gen_control_0_start_en;
  wire rst_1;
  wire [15:0]uci_NID_1;
  wire [7:0]uci_first_symbol_1;
  wire [7:0]uci_grouphopping_1;
  wire [7:0]uci_intra_fr_hop_1;
  wire [15:0]uci_m0_1;
  wire [7:0]uci_nSymbs_1;
  wire [15:0]uci_slot_1;
  wire [3:0]xlconstant_0_dout;
  wire [0:0]xlconstant_1_dout;
  wire [0:0]xlconstant_2_dout;

  assign clk_1 = clk;
  assign dmrs_cyclic[31:0] = com_mul_cyclic_0_cyclic;
  assign dmrs_cylcic_valid = com_mul_cyclic_0_cyclic_valid;
  assign in_valid_1 = in_valid;
  assign nfs_0[2:0] = nfs_gen_0_nfs_0;
  assign nfs_1[2:0] = nfs_gen_0_nfs_1;
  assign nfs_valid = nfs_gen_0_nfs_valid;
  assign rst_1 = rst;
  assign uci_NID_1 = uci_NID[15:0];
  assign uci_first_symbol_1 = uci_first_symbol[7:0];
  assign uci_grouphopping_1 = uci_grouphopping[7:0];
  assign uci_intra_fr_hop_1 = uci_intra_fr_hop[7:0];
  assign uci_m0_1 = uci_m0[15:0];
  assign uci_nSymbs_1 = uci_nSymbs[7:0];
  assign uci_slot_1 = uci_slot[15:0];
  assign wise_enable = com_mul_cyclic_0_o_wise_enable;
  pucch1_ba_seq_control_0_0 ba_seq_control_0
       (.basequence_0(base_sequence_0_base_sequence),
        .basequence_1(base_sequence_1_base_sequence),
        .basequence_out(ba_seq_control_0_basequence_out),
        .basequence_out_valid(ba_seq_control_0_basequence_out_valid),
        .basequence_valid_0(base_sequence_0_base_sequence_valid),
        .basequence_valid_1(base_sequence_1_base_sequence_valid),
        .clk(clk_1),
        .nfs_0(nfs_gen_0_nfs_0),
        .nfs_1(nfs_gen_0_nfs_1),
        .nfs_valid(nfs_gen_0_nfs_valid),
        .rst(rst_1),
        .start_en(phase_gen_control_0_start_en));
  pucch1_base_sequence_0_0 base_sequence_0
       (.base_sequence(base_sequence_0_base_sequence),
        .base_sequence_valid(base_sequence_0_base_sequence_valid),
        .clk(clk_1),
        .in_valid(in_valid_1),
        .rst(rst_1),
        .uci_grouphopping(uci_grouphopping_1[1:0]),
        .uci_nID(uci_NID_1[10:0]),
        .uci_nhop(xlconstant_2_dout),
        .uci_slot(uci_slot_1[4:0]));
  pucch1_base_sequence_1_0 base_sequence_1
       (.base_sequence(base_sequence_1_base_sequence),
        .base_sequence_valid(base_sequence_1_base_sequence_valid),
        .clk(clk_1),
        .in_valid(in_valid_1),
        .rst(rst_1),
        .uci_grouphopping(uci_grouphopping_1[1:0]),
        .uci_nID(uci_NID_1[10:0]),
        .uci_nhop(uci_intra_fr_hop_1[0]),
        .uci_slot(uci_slot_1[4:0]));
  pucch1_com_mul_cyclic_0_0 com_mul_cyclic_0
       (.basequence(ba_seq_control_0_basequence_out),
        .basequence_valid(ba_seq_control_0_basequence_out_valid),
        .clk(clk_1),
        .cyclic(com_mul_cyclic_0_cyclic),
        .cyclic_valid(com_mul_cyclic_0_cyclic_valid),
        .o_wise_enable(com_mul_cyclic_0_o_wise_enable),
        .phase(phase_gen_control_0_o_phase),
        .phase_valid(phase_gen_control_0_o_phase_valid),
        .rst(rst_1));
  pucch1_xlconstant_0_1 mcs
       (.dout(xlconstant_0_dout));
  pucch1_n_cs_gen_0_0 n_cs_gen_0
       (.clk(clk_1),
        .in_uci_flag(xlconstant_1_dout),
        .in_valid(in_valid_1),
        .ncs(n_cs_gen_0_ncs),
        .ncs_valid(n_cs_gen_0_ncs_valid),
        .rst(rst_1),
        .uci_NID(uci_NID_1[10:0]),
        .uci_first_symbol(uci_first_symbol_1[3:0]),
        .uci_nSymbs(uci_nSymbs_1[3:0]),
        .uci_slot(uci_slot_1[4:0]));
  pucch1_nfs_gen_0_0 nfs_gen_0
       (.clk(clk_1),
        .in_valid(in_valid_1),
        .nfs_0(nfs_gen_0_nfs_0),
        .nfs_1(nfs_gen_0_nfs_1),
        .nfs_valid(nfs_gen_0_nfs_valid),
        .rst(rst_1),
        .uci_intra_fr_hop(uci_intra_fr_hop_1[0]),
        .uci_nSymbs(uci_nSymbs_1[3:0]));
  pucch1_phase_gen_0_0 phase_gen_0
       (.clk(clk_1),
        .in_valid(in_valid_1),
        .n_cs_valid(n_cs_gen_0_ncs_valid),
        .ncs(n_cs_gen_0_ncs),
        .phase(phase_gen_0_phase),
        .phase_valid(phase_gen_0_phase_valid),
        .rst(rst_1),
        .uci_m0(uci_m0_1[3:0]),
        .uci_mcs(xlconstant_0_dout));
  pucch1_phase_gen_control_0_0 phase_gen_control_0
       (.clk(clk_1),
        .i_phase(phase_gen_0_phase),
        .i_phase_valid(phase_gen_0_phase_valid),
        .in_uci_flag(xlconstant_1_dout),
        .in_valid(in_valid_1),
        .o_phase(phase_gen_control_0_o_phase),
        .o_phase_valid(phase_gen_control_0_o_phase_valid),
        .rst(rst_1),
        .start_en(phase_gen_control_0_start_en),
        .uci_nSymbs(uci_nSymbs_1[3:0]));
  pucch1_xlconstant_0_2 xlconstant_1
       (.dout(xlconstant_1_dout));
  pucch1_xlconstant_1_0 xlconstant_2
       (.dout(xlconstant_2_dout));
endmodule

module cyclic_uci_imp_LVK04D
   (clk,
    in_valid,
    nfs_0,
    nfs_1,
    nfs_valid,
    rst,
    uci_NID,
    uci_cyclic,
    uci_cyclic_valid,
    uci_first_symbol,
    uci_grouphopping,
    uci_intra_fr_hop,
    uci_m0,
    uci_nSymbs,
    uci_slot,
    wise_enable);
  input clk;
  input in_valid;
  output [2:0]nfs_0;
  output [2:0]nfs_1;
  output nfs_valid;
  input rst;
  input [15:0]uci_NID;
  output [31:0]uci_cyclic;
  output uci_cyclic_valid;
  input [7:0]uci_first_symbol;
  input [7:0]uci_grouphopping;
  input [7:0]uci_intra_fr_hop;
  input [15:0]uci_m0;
  input [7:0]uci_nSymbs;
  input [15:0]uci_slot;
  output wise_enable;

  wire [31:0]ba_seq_control_0_basequence_out;
  wire ba_seq_control_0_basequence_out_valid;
  wire [31:0]base_sequence_0_base_sequence;
  wire base_sequence_0_base_sequence_valid;
  wire [31:0]base_sequence_1_base_sequence;
  wire base_sequence_1_base_sequence_valid;
  wire clk_1;
  wire [31:0]com_mul_cyclic_0_cyclic;
  wire com_mul_cyclic_0_cyclic_valid;
  wire com_mul_cyclic_0_o_wise_enable;
  wire in_valid_1;
  wire [7:0]n_cs_gen_0_ncs;
  wire n_cs_gen_0_ncs_valid;
  wire [2:0]nfs_gen_0_nfs_0;
  wire [2:0]nfs_gen_0_nfs_1;
  wire nfs_gen_0_nfs_valid;
  wire [31:0]phase_gen_0_phase;
  wire phase_gen_0_phase_valid;
  wire [31:0]phase_gen_control_0_o_phase;
  wire phase_gen_control_0_o_phase_valid;
  wire phase_gen_control_0_start_en;
  wire rst_1;
  wire [15:0]uci_NID_1;
  wire [7:0]uci_first_symbol_1;
  wire [7:0]uci_grouphopping_1;
  wire [7:0]uci_intra_fr_hop_1;
  wire [15:0]uci_m0_1;
  wire [7:0]uci_nSymbs_1;
  wire [15:0]uci_slot_1;
  wire [3:0]xlconstant_0_dout;
  wire [0:0]xlconstant_1_dout;
  wire [0:0]xlconstant_2_dout;

  assign clk_1 = clk;
  assign in_valid_1 = in_valid;
  assign nfs_0[2:0] = nfs_gen_0_nfs_0;
  assign nfs_1[2:0] = nfs_gen_0_nfs_1;
  assign nfs_valid = nfs_gen_0_nfs_valid;
  assign rst_1 = rst;
  assign uci_NID_1 = uci_NID[15:0];
  assign uci_cyclic[31:0] = com_mul_cyclic_0_cyclic;
  assign uci_cyclic_valid = com_mul_cyclic_0_cyclic_valid;
  assign uci_first_symbol_1 = uci_first_symbol[7:0];
  assign uci_grouphopping_1 = uci_grouphopping[7:0];
  assign uci_intra_fr_hop_1 = uci_intra_fr_hop[7:0];
  assign uci_m0_1 = uci_m0[15:0];
  assign uci_nSymbs_1 = uci_nSymbs[7:0];
  assign uci_slot_1 = uci_slot[15:0];
  assign wise_enable = com_mul_cyclic_0_o_wise_enable;
  pucch1_ba_seq_control_0_1 ba_seq_control_0
       (.basequence_0(base_sequence_0_base_sequence),
        .basequence_1(base_sequence_1_base_sequence),
        .basequence_out(ba_seq_control_0_basequence_out),
        .basequence_out_valid(ba_seq_control_0_basequence_out_valid),
        .basequence_valid_0(base_sequence_0_base_sequence_valid),
        .basequence_valid_1(base_sequence_1_base_sequence_valid),
        .clk(clk_1),
        .nfs_0(nfs_gen_0_nfs_0),
        .nfs_1(nfs_gen_0_nfs_1),
        .nfs_valid(nfs_gen_0_nfs_valid),
        .rst(rst_1),
        .start_en(phase_gen_control_0_start_en));
  pucch1_base_sequence_0_1 base_sequence_0
       (.base_sequence(base_sequence_0_base_sequence),
        .base_sequence_valid(base_sequence_0_base_sequence_valid),
        .clk(clk_1),
        .in_valid(in_valid_1),
        .rst(rst_1),
        .uci_grouphopping(uci_grouphopping_1[1:0]),
        .uci_nID(uci_NID_1[10:0]),
        .uci_nhop(xlconstant_2_dout),
        .uci_slot(uci_slot_1[4:0]));
  pucch1_base_sequence_1_1 base_sequence_1
       (.base_sequence(base_sequence_1_base_sequence),
        .base_sequence_valid(base_sequence_1_base_sequence_valid),
        .clk(clk_1),
        .in_valid(in_valid_1),
        .rst(rst_1),
        .uci_grouphopping(uci_grouphopping_1[1:0]),
        .uci_nID(uci_NID_1[10:0]),
        .uci_nhop(uci_intra_fr_hop_1[0]),
        .uci_slot(uci_slot_1[4:0]));
  pucch1_com_mul_cyclic_0_1 com_mul_cyclic_0
       (.basequence(ba_seq_control_0_basequence_out),
        .basequence_valid(ba_seq_control_0_basequence_out_valid),
        .clk(clk_1),
        .cyclic(com_mul_cyclic_0_cyclic),
        .cyclic_valid(com_mul_cyclic_0_cyclic_valid),
        .o_wise_enable(com_mul_cyclic_0_o_wise_enable),
        .phase(phase_gen_control_0_o_phase),
        .phase_valid(phase_gen_control_0_o_phase_valid),
        .rst(rst_1));
  pucch1_xlconstant_0_3 mcs
       (.dout(xlconstant_0_dout));
  pucch1_n_cs_gen_0_1 n_cs_gen_0
       (.clk(clk_1),
        .in_uci_flag(xlconstant_1_dout),
        .in_valid(in_valid_1),
        .ncs(n_cs_gen_0_ncs),
        .ncs_valid(n_cs_gen_0_ncs_valid),
        .rst(rst_1),
        .uci_NID(uci_NID_1[10:0]),
        .uci_first_symbol(uci_first_symbol_1[3:0]),
        .uci_nSymbs(uci_nSymbs_1[3:0]),
        .uci_slot(uci_slot_1[4:0]));
  pucch1_nfs_gen_0_1 nfs_gen_0
       (.clk(clk_1),
        .in_valid(in_valid_1),
        .nfs_0(nfs_gen_0_nfs_0),
        .nfs_1(nfs_gen_0_nfs_1),
        .nfs_valid(nfs_gen_0_nfs_valid),
        .rst(rst_1),
        .uci_intra_fr_hop(uci_intra_fr_hop_1[0]),
        .uci_nSymbs(uci_nSymbs_1[3:0]));
  pucch1_phase_gen_0_1 phase_gen_0
       (.clk(clk_1),
        .in_valid(in_valid_1),
        .n_cs_valid(n_cs_gen_0_ncs_valid),
        .ncs(n_cs_gen_0_ncs),
        .phase(phase_gen_0_phase),
        .phase_valid(phase_gen_0_phase_valid),
        .rst(rst_1),
        .uci_m0(uci_m0_1[3:0]),
        .uci_mcs(xlconstant_0_dout));
  pucch1_phase_gen_control_0_1 phase_gen_control_0
       (.clk(clk_1),
        .i_phase(phase_gen_0_phase),
        .i_phase_valid(phase_gen_0_phase_valid),
        .in_uci_flag(xlconstant_1_dout),
        .in_valid(in_valid_1),
        .o_phase(phase_gen_control_0_o_phase),
        .o_phase_valid(phase_gen_control_0_o_phase_valid),
        .rst(rst_1),
        .start_en(phase_gen_control_0_start_en),
        .uci_nSymbs(uci_nSymbs_1[3:0]));
  pucch1_xlconstant_1_1 xlconstant_1
       (.dout(xlconstant_1_dout));
  pucch1_xlconstant_2_0 xlconstant_2
       (.dout(xlconstant_2_dout));
endmodule

(* CORE_GENERATION_INFO = "pucch1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=pucch1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=48,numReposBlks=46,numNonXlnxBlks=0,numHierBlks=2,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "pucch1.hwdef" *) 
module pucch1
   (ant_input,
    clk,
    dtx,
    harq,
    i_config_valid,
    i_group_hopping,
    i_hopping_ID,
    i_pucch1_valid,
    o_valid,
    pucch_parameter,
    rst,
    sr,
    stop_trigger,
    trigger_05);
  input [255:0]ant_input;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN pucch1_clk, FREQ_HZ 122880000, INSERT_VIP 0, PHASE 0.000" *) input clk;
  output dtx;
  output [1:0]harq;
  input i_config_valid;
  input [7:0]i_group_hopping;
  input [15:0]i_hopping_ID;
  input i_pucch1_valid;
  output o_valid;
  input [511:0]pucch_parameter;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst;
  output sr;
  input stop_trigger;
  input trigger_05;

  wire [255:0]ant_input_1;
  wire [31:0]block_wise_spreading_uci_spreading;
  wire [31:0]block_wise_spreading_uci_spreading1;
  wire block_wise_spreading_uci_spreading_valid;
  wire block_wise_spreading_uci_spreading_valid1;
  wire clk_1;
  wire [31:0]cyclic_dmrs_dmrs_cyclic;
  wire cyclic_dmrs_dmrs_cylcic_valid;
  wire [2:0]cyclic_dmrs_nfs_0;
  wire [2:0]cyclic_dmrs_nfs_1;
  wire cyclic_dmrs_nfs_valid;
  wire cyclic_dmrs_wise_enable;
  wire [2:0]cyclic_uci_nfs_0;
  wire [2:0]cyclic_uci_nfs_1;
  wire cyclic_uci_nfs_valid;
  wire [31:0]cyclic_uci_uci_cyclic;
  wire cyclic_uci_uci_cyclic_valid;
  wire cyclic_uci_wise_enable;
  wire [31:0]data_dmrs_selection_0_data;
  wire data_dmrs_selection_0_data_valid;
  wire [31:0]data_dmrs_selection_0_dmrs;
  wire data_dmrs_selection_0_dmrs_valid;
  wire [31:0]de_spread_dmrs_de_spreading_data;
  wire de_spread_dmrs_de_spreading_data_valid;
  wire [31:0]de_spread_uci_de_spreading_data;
  wire de_spread_uci_de_spreading_data_valid;
  wire demapping_0_resoureset_valid;
  wire dmrs_wise_spreading_0_o_enable;
  wire dmrs_wise_spreading_0_o_enable1;
  wire [31:0]dmrs_wise_spreading_0_wi_seq;
  wire [31:0]dmrs_wise_spreading_0_wi_seq1;
  wire dmrs_wise_spreading_0_wi_seq_valid;
  wire dmrs_wise_spreading_0_wi_seq_valid1;
  wire [31:0]dmrs_wise_spreading_1_wi_seq;
  wire [31:0]dmrs_wise_spreading_1_wi_seq1;
  wire dmrs_wise_spreading_1_wi_seq_valid;
  wire dmrs_wise_spreading_1_wi_seq_valid1;
  wire [11:0]frame_sync_0_cp;
  wire frame_sync_0_start_symbol;
  wire [8:0]frame_sync_1_rb_idx;
  wire [4:0]frame_sync_1_slot_idx;
  wire [3:0]frame_sync_1_sym_idx;
  wire frame_sync_1_valid_out;
  wire i_config_valid_1;
  wire [7:0]i_group_hopping_1;
  wire [15:0]i_hopping_ID_1;
  wire i_pucch1_valid_1;
  wire [33:0]mean_data_0_o_mean_data;
  wire mean_data_0_o_mean_data_valid;
  wire [63:0]mean_data_0_sinr;
  wire mean_data_0_sinr_valid;
  wire ofdm_demodulation_0_o_valid;
  wire [31:0]ofdm_demodulation_0_pucch_ofdm;
  wire ofdm_demodulation_0_start_symbol;
  wire [63:0]payload_est_SINR_0_mean_sinr;
  wire payload_est_SINR_0_mean_sinr_valid;
  wire [1:0]payload_est_SINR_0_payload;
  wire payload_est_SINR_0_payload_valid;
  wire physical_control_0_start_symbol;
  wire [511:0]pucch_parameter_1;
  wire rst_1;
  wire sr_ack_detector_0_dtx;
  wire [1:0]sr_ack_detector_0_harq;
  wire sr_ack_detector_0_o_valid;
  wire sr_ack_detector_0_sr;
  wire stop_trigger_1;
  wire trigger_05_1;
  wire [3:0]uci_occ_dout;
  wire [7:0]ulcch_parameter_0_group_hopping;
  wire [15:0]ulcch_parameter_0_hopping_ID;
  wire ulcch_parameter_0_pucch_valid;
  wire [15:0]ulcch_parameter_0_uci_ack;
  wire [7:0]ulcch_parameter_0_uci_frist_symbol;
  wire [7:0]ulcch_parameter_0_uci_intra_fre_hopping;
  wire [15:0]ulcch_parameter_0_uci_m0;
  wire [15:0]ulcch_parameter_0_uci_pbr_offset;
  wire [15:0]ulcch_parameter_0_uci_second_prb;
  wire [15:0]ulcch_parameter_0_uci_slot_idx;
  wire [7:0]ulcch_parameter_0_uci_symbol;
  wire [255:0]xlconcat_0_dout;
  wire [135:0]xlconcat_1_dout;
  wire [2:0]xlconstant_0_dout;
  wire [63:0]xlconstant_1_dout;
  wire [31:0]xlslice_0_Dout;

  assign ant_input_1 = ant_input[255:0];
  assign clk_1 = clk;
  assign dtx = sr_ack_detector_0_dtx;
  assign harq[1:0] = sr_ack_detector_0_harq;
  assign i_config_valid_1 = i_config_valid;
  assign i_group_hopping_1 = i_group_hopping[7:0];
  assign i_hopping_ID_1 = i_hopping_ID[15:0];
  assign i_pucch1_valid_1 = i_pucch1_valid;
  assign o_valid = sr_ack_detector_0_o_valid;
  assign pucch_parameter_1 = pucch_parameter[511:0];
  assign rst_1 = rst;
  assign sr = sr_ack_detector_0_sr;
  assign stop_trigger_1 = stop_trigger;
  assign trigger_05_1 = trigger_05;
  pucch1_block_wise_spreading_dmrs_0 block_wise_spreading_dmrs
       (.clk(clk_1),
        .cyclic(cyclic_dmrs_dmrs_cyclic),
        .cyclic_valid(cyclic_dmrs_dmrs_cylcic_valid),
        .rst(rst_1),
        .spreading(block_wise_spreading_uci_spreading),
        .spreading_valid(block_wise_spreading_uci_spreading_valid),
        .wise_0(dmrs_wise_spreading_0_wi_seq1),
        .wise_1(dmrs_wise_spreading_1_wi_seq1),
        .wise_valid_0(dmrs_wise_spreading_0_wi_seq_valid1),
        .wise_valid_1(dmrs_wise_spreading_1_wi_seq_valid1));
  pucch1_block_wise_spreading_0_0 block_wise_spreading_uci
       (.clk(clk_1),
        .cyclic(cyclic_uci_uci_cyclic),
        .cyclic_valid(cyclic_uci_uci_cyclic_valid),
        .rst(rst_1),
        .spreading(block_wise_spreading_uci_spreading1),
        .spreading_valid(block_wise_spreading_uci_spreading_valid1),
        .wise_0(dmrs_wise_spreading_0_wi_seq),
        .wise_1(dmrs_wise_spreading_1_wi_seq),
        .wise_valid_0(dmrs_wise_spreading_0_wi_seq_valid),
        .wise_valid_1(dmrs_wise_spreading_1_wi_seq_valid));
  cyclic_dmrs_imp_1IXJDMF cyclic_dmrs
       (.clk(clk_1),
        .dmrs_cyclic(cyclic_dmrs_dmrs_cyclic),
        .dmrs_cylcic_valid(cyclic_dmrs_dmrs_cylcic_valid),
        .in_valid(ulcch_parameter_0_pucch_valid),
        .nfs_0(cyclic_dmrs_nfs_0),
        .nfs_1(cyclic_dmrs_nfs_1),
        .nfs_valid(cyclic_dmrs_nfs_valid),
        .rst(rst_1),
        .uci_NID(ulcch_parameter_0_hopping_ID),
        .uci_first_symbol(ulcch_parameter_0_uci_frist_symbol),
        .uci_grouphopping(ulcch_parameter_0_group_hopping),
        .uci_intra_fr_hop(ulcch_parameter_0_uci_intra_fre_hopping),
        .uci_m0(ulcch_parameter_0_uci_m0),
        .uci_nSymbs(ulcch_parameter_0_uci_symbol),
        .uci_slot(ulcch_parameter_0_uci_slot_idx),
        .wise_enable(cyclic_dmrs_wise_enable));
  cyclic_uci_imp_LVK04D cyclic_uci
       (.clk(clk_1),
        .in_valid(ulcch_parameter_0_pucch_valid),
        .nfs_0(cyclic_uci_nfs_0),
        .nfs_1(cyclic_uci_nfs_1),
        .nfs_valid(cyclic_uci_nfs_valid),
        .rst(rst_1),
        .uci_NID(ulcch_parameter_0_hopping_ID),
        .uci_cyclic(cyclic_uci_uci_cyclic),
        .uci_cyclic_valid(cyclic_uci_uci_cyclic_valid),
        .uci_first_symbol(ulcch_parameter_0_uci_frist_symbol),
        .uci_grouphopping(ulcch_parameter_0_group_hopping),
        .uci_intra_fr_hop(ulcch_parameter_0_uci_intra_fre_hopping),
        .uci_m0(ulcch_parameter_0_uci_m0),
        .uci_nSymbs(ulcch_parameter_0_uci_symbol),
        .uci_slot(ulcch_parameter_0_uci_slot_idx),
        .wise_enable(cyclic_uci_wise_enable));
  pucch1_data_dmrs_selection_0_0 data_dmrs_selection_0
       (.clk(clk_1),
        .data(data_dmrs_selection_0_data),
        .data_valid(data_dmrs_selection_0_data_valid),
        .dmrs(data_dmrs_selection_0_dmrs),
        .dmrs_valid(data_dmrs_selection_0_dmrs_valid),
        .ofdm(ofdm_demodulation_0_pucch_ofdm),
        .ofdm_valid(ofdm_demodulation_0_o_valid),
        .resoureset_valid(demapping_0_resoureset_valid),
        .rst(rst_1),
        .uci_nsymbols(ulcch_parameter_0_uci_symbol[3:0]),
        .uci_valid(ulcch_parameter_0_pucch_valid));
  pucch1_de_spread_0_0 de_spread_dmrs
       (.clk(clk_1),
        .de_spreading_data(de_spread_dmrs_de_spreading_data),
        .de_spreading_data_valid(de_spread_dmrs_de_spreading_data_valid),
        .rst(rst_1),
        .rx_data(data_dmrs_selection_0_dmrs),
        .rx_data_valid(data_dmrs_selection_0_dmrs_valid),
        .spreading_data(block_wise_spreading_uci_spreading),
        .spreading_data_valid(block_wise_spreading_uci_spreading_valid));
  pucch1_de_spread_1_0 de_spread_uci
       (.clk(clk_1),
        .de_spreading_data(de_spread_uci_de_spreading_data),
        .de_spreading_data_valid(de_spread_uci_de_spreading_data_valid),
        .rst(rst_1),
        .rx_data(data_dmrs_selection_0_data),
        .rx_data_valid(data_dmrs_selection_0_data_valid),
        .spreading_data(block_wise_spreading_uci_spreading1),
        .spreading_data_valid(block_wise_spreading_uci_spreading_valid1));
  pucch1_demapping_0_1 demapping_0
       (.clk(clk_1),
        .fr_data_valid(frame_sync_1_valid_out),
        .fr_rb(frame_sync_1_rb_idx),
        .fr_slot(frame_sync_1_slot_idx),
        .fr_symbol(frame_sync_1_sym_idx),
        .resoureset_valid(demapping_0_resoureset_valid),
        .rst(rst_1),
        .uci_first_symbol_idx(ulcch_parameter_0_uci_frist_symbol[3:0]),
        .uci_instra_fre_hop(ulcch_parameter_0_uci_intra_fre_hopping[0]),
        .uci_nsymbols(ulcch_parameter_0_uci_symbol[3:0]),
        .uci_prbsoffset(ulcch_parameter_0_uci_pbr_offset[8:0]),
        .uci_secondhop_prb(ulcch_parameter_0_uci_second_prb[8:0]),
        .uci_slot(ulcch_parameter_0_uci_slot_idx[4:0]),
        .uci_valid(ulcch_parameter_0_pucch_valid));
  pucch1_dmrs_wise_spreading_1_0 dmrs_wise_spreading_0
       (.clk(clk_1),
        .enable(cyclic_dmrs_wise_enable),
        .in_valid(ulcch_parameter_0_pucch_valid),
        .nfs(cyclic_dmrs_nfs_0),
        .nfs_valid(cyclic_dmrs_nfs_valid),
        .o_enable(dmrs_wise_spreading_0_o_enable1),
        .rst(rst_1),
        .uci_OCC(uci_occ_dout),
        .wi_seq(dmrs_wise_spreading_0_wi_seq1),
        .wi_seq_valid(dmrs_wise_spreading_0_wi_seq_valid1));
  pucch1_dmrs_wise_spreading_0_0 dmrs_wise_spreading_1
       (.clk(clk_1),
        .enable(dmrs_wise_spreading_0_o_enable1),
        .in_valid(ulcch_parameter_0_pucch_valid),
        .nfs(cyclic_dmrs_nfs_1),
        .nfs_valid(cyclic_dmrs_nfs_valid),
        .rst(rst_1),
        .uci_OCC(uci_occ_dout),
        .wi_seq(dmrs_wise_spreading_1_wi_seq1),
        .wi_seq_valid(dmrs_wise_spreading_1_wi_seq_valid1));
  pucch1_frame_sync_0_0 frame_sync_0
       (.clk(clk_1),
        .cp(frame_sync_0_cp),
        .in_start_symbol(physical_control_0_start_symbol),
        .rst(rst_1),
        .start_symbol(frame_sync_0_start_symbol));
  pucch1_frame_sync_1_0 frame_sync_1
       (.clk(clk_1),
        .in_start_symbol(ofdm_demodulation_0_start_symbol),
        .rb_idx(frame_sync_1_rb_idx),
        .rst(rst_1),
        .slot_idx(frame_sync_1_slot_idx),
        .sym_idx(frame_sync_1_sym_idx),
        .valid_out(frame_sync_1_valid_out));
  pucch1_mean_data_0_0 mean_data_0
       (.clk(clk_1),
        .despread_dmrs(de_spread_dmrs_de_spreading_data),
        .despread_dmrs_valid(de_spread_dmrs_de_spreading_data_valid),
        .despread_uci(de_spread_uci_de_spreading_data),
        .despread_uci_valid(de_spread_uci_de_spreading_data_valid),
        .in_valid(ulcch_parameter_0_pucch_valid),
        .o_mean_data(mean_data_0_o_mean_data),
        .o_mean_data_valid(mean_data_0_o_mean_data_valid),
        .rst(rst_1),
        .sinr(mean_data_0_sinr),
        .sinr_valid(mean_data_0_sinr_valid),
        .uci_nsymbol(ulcch_parameter_0_uci_symbol[3:0]));
  pucch1_ofdm_demodulation_0_0 ofdm_demodulation_0
       (.ant_input(xlslice_0_Dout),
        .clk(clk_1),
        .i_start_symbol(frame_sync_0_start_symbol),
        .i_trigger_cp(frame_sync_0_cp),
        .o_valid(ofdm_demodulation_0_o_valid),
        .pucch_ofdm(ofdm_demodulation_0_pucch_ofdm),
        .rst(rst_1),
        .scale_factor({1'b0,xlconstant_0_dout}),
        .start_symbol(ofdm_demodulation_0_start_symbol));
  pucch1_payload_est_SINR_0_0 payload_est_SINR_0
       (.clk(clk_1),
        .in_valid(ulcch_parameter_0_pucch_valid),
        .mean_data(xlconcat_1_dout),
        .mean_data_valid(mean_data_0_o_mean_data_valid),
        .mean_sinr(payload_est_SINR_0_mean_sinr),
        .mean_sinr_valid(payload_est_SINR_0_mean_sinr_valid),
        .payload(payload_est_SINR_0_payload),
        .payload_valid(payload_est_SINR_0_payload_valid),
        .rst(rst_1),
        .sinr(xlconcat_0_dout),
        .sinr_valid(mean_data_0_sinr_valid),
        .uci_modulation(ulcch_parameter_0_uci_ack[0]));
  pucch1_physical_control_0_0 physical_control_0
       (.clk(clk_1),
        .in_0_5ms(trigger_05_1),
        .rst(rst_1),
        .start_symbol(physical_control_0_start_symbol),
        .stop_request_trigger(stop_trigger_1));
  pucch1_sr_ack_detector_0_0 sr_ack_detector_0
       (.clk(clk_1),
        .dtx(sr_ack_detector_0_dtx),
        .harq(sr_ack_detector_0_harq),
        .in_valid(ulcch_parameter_0_pucch_valid),
        .mean_sinr(payload_est_SINR_0_mean_sinr),
        .mean_sinr_valid(payload_est_SINR_0_mean_sinr_valid),
        .o_valid(sr_ack_detector_0_o_valid),
        .payload(payload_est_SINR_0_payload),
        .payload_valid(payload_est_SINR_0_payload_valid),
        .rst(rst_1),
        .sinr_threshold(xlconstant_1_dout),
        .sr(sr_ack_detector_0_sr),
        .uci_o_ack(ulcch_parameter_0_uci_ack[1:0]));
  pucch1_xlconstant_2_1 uci_occ
       (.dout(uci_occ_dout));
  pucch1_wise_spreading_0_0 uci_wise_spreading_0
       (.clk(clk_1),
        .enable(cyclic_uci_wise_enable),
        .in_valid(ulcch_parameter_0_pucch_valid),
        .nfs(cyclic_uci_nfs_0),
        .nfs_valid(cyclic_uci_nfs_valid),
        .o_enable(dmrs_wise_spreading_0_o_enable),
        .rst(rst_1),
        .uci_OCC(uci_occ_dout),
        .wi_seq(dmrs_wise_spreading_0_wi_seq),
        .wi_seq_valid(dmrs_wise_spreading_0_wi_seq_valid));
  pucch1_wise_spreading_0_1 uci_wise_spreading_1
       (.clk(clk_1),
        .enable(dmrs_wise_spreading_0_o_enable),
        .in_valid(ulcch_parameter_0_pucch_valid),
        .nfs(cyclic_uci_nfs_1),
        .nfs_valid(cyclic_uci_nfs_valid),
        .rst(rst_1),
        .uci_OCC(uci_occ_dout),
        .wi_seq(dmrs_wise_spreading_1_wi_seq),
        .wi_seq_valid(dmrs_wise_spreading_1_wi_seq_valid));
  pucch1_ulcch_parameter_0_0 ulcch_parameter_0
       (.clk(clk_1),
        .group_hopping(ulcch_parameter_0_group_hopping),
        .hopping_ID(ulcch_parameter_0_hopping_ID),
        .i_config_valid(i_config_valid_1),
        .i_group_hopping(i_group_hopping_1),
        .i_hopping_ID(i_hopping_ID_1),
        .i_pucch_valid(i_pucch1_valid_1),
        .pucch_valid(ulcch_parameter_0_pucch_valid),
        .rst(rst_1),
        .uci_ack(ulcch_parameter_0_uci_ack),
        .uci_frist_symbol(ulcch_parameter_0_uci_frist_symbol),
        .uci_intra_fre_hopping(ulcch_parameter_0_uci_intra_fre_hopping),
        .uci_m0(ulcch_parameter_0_uci_m0),
        .uci_pbr_offset(ulcch_parameter_0_uci_pbr_offset),
        .uci_second_prb(ulcch_parameter_0_uci_second_prb),
        .uci_slot_idx(ulcch_parameter_0_uci_slot_idx),
        .uci_symbol(ulcch_parameter_0_uci_symbol),
        .ulcch_para(pucch_parameter_1));
  pucch1_xlconcat_0_0 xlconcat_0
       (.In0(mean_data_0_sinr),
        .In1(mean_data_0_sinr),
        .In2(mean_data_0_sinr),
        .In3(mean_data_0_sinr),
        .dout(xlconcat_0_dout));
  pucch1_xlconcat_0_1 xlconcat_1
       (.In0(mean_data_0_o_mean_data),
        .In1(mean_data_0_o_mean_data),
        .In2(mean_data_0_o_mean_data),
        .In3(mean_data_0_o_mean_data),
        .dout(xlconcat_1_dout));
  pucch1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  pucch1_xlconstant_0_4 xlconstant_1
       (.dout(xlconstant_1_dout));
  pucch1_xlslice_0_0 xlslice_0
       (.Din(ant_input_1),
        .Dout(xlslice_0_Dout));
endmodule
