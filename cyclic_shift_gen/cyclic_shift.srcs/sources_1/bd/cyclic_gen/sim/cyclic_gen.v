//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Mon Mar 16 19:16:51 2026
//Host        : LAPTOP-CHCSI1R5 running 64-bit major release  (build 9200)
//Command     : generate_target cyclic_gen.bd
//Design      : cyclic_gen
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "cyclic_gen,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=cyclic_gen,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=11,numReposBlks=11,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "cyclic_gen.hwdef" *) 
module cyclic_gen
   (clk,
    cyclic,
    cyclic_valid,
    rst,
    uci_NID,
    uci_first_symbol,
    uci_grouphopping,
    uci_intra_fr_hop,
    uci_m0,
    uci_nsymbols,
    uci_slot,
    uci_valid);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN cyclic_gen_clk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clk;
  output [31:0]cyclic;
  output cyclic_valid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst;
  input [10:0]uci_NID;
  input [3:0]uci_first_symbol;
  input [1:0]uci_grouphopping;
  input uci_intra_fr_hop;
  input [3:0]uci_m0;
  input [3:0]uci_nsymbols;
  input [4:0]uci_slot;
  input uci_valid;

  wire [31:0]ba_seq_control_0_basequence_out;
  wire ba_seq_control_0_basequence_out_valid;
  wire [31:0]base_sequence_0_base_sequence;
  wire base_sequence_0_base_sequence_valid;
  wire [31:0]base_sequence_1_base_sequence;
  wire base_sequence_1_base_sequence_valid;
  wire clk_1;
  wire [31:0]com_mul_cyclic_0_cyclic;
  wire com_mul_cyclic_0_cyclic_valid;
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
  wire [10:0]uci_NID_1;
  wire [3:0]uci_first_symbol_1;
  wire [1:0]uci_grouphopping_1;
  wire uci_intra_fr_hop_1;
  wire [3:0]uci_m0_1;
  wire [3:0]uci_nsymbols_1;
  wire [4:0]uci_slot_1;
  wire [0:0]xlconstant_0_dout;
  wire [3:0]xlconstant_1_dout;
  wire [0:0]xlconstant_2_dout;

  assign clk_1 = clk;
  assign cyclic[31:0] = com_mul_cyclic_0_cyclic;
  assign cyclic_valid = com_mul_cyclic_0_cyclic_valid;
  assign in_valid_1 = uci_valid;
  assign rst_1 = rst;
  assign uci_NID_1 = uci_NID[10:0];
  assign uci_first_symbol_1 = uci_first_symbol[3:0];
  assign uci_grouphopping_1 = uci_grouphopping[1:0];
  assign uci_intra_fr_hop_1 = uci_intra_fr_hop;
  assign uci_m0_1 = uci_m0[3:0];
  assign uci_nsymbols_1 = uci_nsymbols[3:0];
  assign uci_slot_1 = uci_slot[4:0];
  cyclic_gen_ba_seq_control_0_0 ba_seq_control_0
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
  cyclic_gen_base_sequence_0_0 base_sequence_0
       (.base_sequence(base_sequence_0_base_sequence),
        .base_sequence_valid(base_sequence_0_base_sequence_valid),
        .clk(clk_1),
        .in_valid(in_valid_1),
        .rst(rst_1),
        .uci_grouphopping(uci_grouphopping_1),
        .uci_nID(uci_NID_1),
        .uci_nhop(uci_intra_fr_hop_1),
        .uci_slot(uci_slot_1));
  cyclic_gen_base_sequence_0_1 base_sequence_1
       (.base_sequence(base_sequence_1_base_sequence),
        .base_sequence_valid(base_sequence_1_base_sequence_valid),
        .clk(clk_1),
        .in_valid(in_valid_1),
        .rst(rst_1),
        .uci_grouphopping(uci_grouphopping_1),
        .uci_nID(uci_NID_1),
        .uci_nhop(xlconstant_2_dout),
        .uci_slot(uci_slot_1));
  cyclic_gen_com_mul_cyclic_0_0 com_mul_cyclic_0
       (.basequence(ba_seq_control_0_basequence_out),
        .basequence_valid(ba_seq_control_0_basequence_out_valid),
        .clk(clk_1),
        .cyclic(com_mul_cyclic_0_cyclic),
        .cyclic_valid(com_mul_cyclic_0_cyclic_valid),
        .phase(phase_gen_control_0_o_phase),
        .phase_valid(phase_gen_control_0_o_phase_valid),
        .rst(rst_1));
  cyclic_gen_n_cs_gen_0_0 n_cs_gen_0
       (.clk(clk_1),
        .in_uci_flag(xlconstant_0_dout),
        .in_valid(in_valid_1),
        .ncs(n_cs_gen_0_ncs),
        .ncs_valid(n_cs_gen_0_ncs_valid),
        .rst(rst_1),
        .uci_NID(uci_NID_1),
        .uci_first_symbol(uci_first_symbol_1),
        .uci_nSymbs(uci_nsymbols_1),
        .uci_slot(uci_slot_1));
  cyclic_gen_nfs_gen_0_0 nfs_gen_0
       (.clk(clk_1),
        .in_valid(in_valid_1),
        .nfs_0(nfs_gen_0_nfs_0),
        .nfs_1(nfs_gen_0_nfs_1),
        .nfs_valid(nfs_gen_0_nfs_valid),
        .rst(rst_1),
        .uci_intra_fr_hop(uci_intra_fr_hop_1),
        .uci_nSymbs(uci_nsymbols_1));
  cyclic_gen_phase_gen_0_0 phase_gen_0
       (.clk(clk_1),
        .in_valid(in_valid_1),
        .n_cs_valid(n_cs_gen_0_ncs_valid),
        .ncs(n_cs_gen_0_ncs),
        .phase(phase_gen_0_phase),
        .phase_valid(phase_gen_0_phase_valid),
        .rst(rst_1),
        .uci_m0(uci_m0_1),
        .uci_mcs(xlconstant_1_dout));
  cyclic_gen_phase_gen_control_0_0 phase_gen_control_0
       (.clk(clk_1),
        .i_phase(phase_gen_0_phase),
        .i_phase_valid(phase_gen_0_phase_valid),
        .in_uci_flag(xlconstant_0_dout),
        .in_valid(in_valid_1),
        .o_phase(phase_gen_control_0_o_phase),
        .o_phase_valid(phase_gen_control_0_o_phase_valid),
        .rst(rst_1),
        .start_en(phase_gen_control_0_start_en),
        .uci_nSymbs(uci_nsymbols_1));
  cyclic_gen_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  cyclic_gen_xlconstant_0_1 xlconstant_1
       (.dout(xlconstant_1_dout));
  cyclic_gen_xlconstant_0_2 xlconstant_2
       (.dout(xlconstant_2_dout));
endmodule
