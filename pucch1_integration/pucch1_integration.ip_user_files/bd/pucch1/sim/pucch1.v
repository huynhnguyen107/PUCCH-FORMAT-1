//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Mon Mar 16 15:24:22 2026
//Host        : LAPTOP-CHCSI1R5 running 64-bit major release  (build 9200)
//Command     : generate_target pucch1.bd
//Design      : pucch1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "pucch1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=pucch1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=8,numReposBlks=8,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "pucch1.hwdef" *) 
module pucch1
   (ant_input,
    clk,
    i_config_valid,
    i_group_hopping,
    i_hopping_ID,
    i_pucch1_valid,
    pucch_parameter,
    rst,
    stop_trigger,
    trigger_05);
  input [255:0]ant_input;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN pucch1_clk, FREQ_HZ 122880000, INSERT_VIP 0, PHASE 0.000" *) input clk;
  input i_config_valid;
  input [7:0]i_group_hopping;
  input [15:0]i_hopping_ID;
  input i_pucch1_valid;
  input [511:0]pucch_parameter;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst;
  input stop_trigger;
  input trigger_05;

  wire [255:0]ant_input_1;
  wire clk_1;
  wire [11:0]frame_sync_0_cp;
  wire frame_sync_0_start_symbol;
  wire i_config_valid_1;
  wire [7:0]i_group_hopping_1;
  wire [15:0]i_hopping_ID_1;
  wire i_pucch1_valid_1;
  wire ofdm_demodulation_0_start_symbol;
  wire physical_control_0_start_symbol;
  wire [511:0]pucch_parameter_1;
  wire rst_1;
  wire stop_trigger_1;
  wire trigger_05_1;
  wire [2:0]xlconstant_0_dout;
  wire [31:0]xlslice_0_Dout;

  assign ant_input_1 = ant_input[255:0];
  assign clk_1 = clk;
  assign i_config_valid_1 = i_config_valid;
  assign i_group_hopping_1 = i_group_hopping[7:0];
  assign i_hopping_ID_1 = i_hopping_ID[15:0];
  assign i_pucch1_valid_1 = i_pucch1_valid;
  assign pucch_parameter_1 = pucch_parameter[511:0];
  assign rst_1 = rst;
  assign stop_trigger_1 = stop_trigger;
  assign trigger_05_1 = trigger_05;
  pucch1_demapping_0_1 demapping_0
       (.clk(1'b0),
        .fr_data_valid(1'b0),
        .fr_rb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .fr_slot({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .fr_symbol({1'b0,1'b0,1'b0,1'b0}),
        .rst(1'b0),
        .uci_first_symbol_idx({1'b0,1'b0,1'b0,1'b0}),
        .uci_instra_fre_hop(1'b0),
        .uci_nsymbols({1'b0,1'b0,1'b0,1'b0}),
        .uci_prbsoffset({1'b0,1'b0}),
        .uci_secondhop_prb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .uci_slot({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .uci_valid(1'b0));
  pucch1_frame_sync_0_0 frame_sync_0
       (.clk(clk_1),
        .cp(frame_sync_0_cp),
        .in_start_symbol(physical_control_0_start_symbol),
        .rst(rst_1),
        .start_symbol(frame_sync_0_start_symbol));
  pucch1_frame_sync_1_0 frame_sync_1
       (.clk(clk_1),
        .in_start_symbol(ofdm_demodulation_0_start_symbol),
        .rst(rst_1));
  pucch1_ofdm_demodulation_0_0 ofdm_demodulation_0
       (.ant_input(xlslice_0_Dout),
        .clk(clk_1),
        .i_start_symbol(frame_sync_0_start_symbol),
        .i_trigger_cp(frame_sync_0_cp),
        .rst(rst_1),
        .scale_factor({1'b0,xlconstant_0_dout}),
        .start_symbol(ofdm_demodulation_0_start_symbol));
  pucch1_physical_control_0_0 physical_control_0
       (.clk(clk_1),
        .in_0_5ms(trigger_05_1),
        .rst(rst_1),
        .start_symbol(physical_control_0_start_symbol),
        .stop_request_trigger(stop_trigger_1));
  pucch1_ulcch_parameter_0_0 ulcch_parameter_0
       (.clk(clk_1),
        .i_config_valid(i_config_valid_1),
        .i_group_hopping(i_group_hopping_1),
        .i_hopping_ID(i_hopping_ID_1),
        .i_pucch_valid(i_pucch1_valid_1),
        .rst(rst_1),
        .ulcch_para(pucch_parameter_1));
  pucch1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  pucch1_xlslice_0_0 xlslice_0
       (.Din(ant_input_1),
        .Dout(xlslice_0_Dout));
endmodule
