//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Mon Mar 16 15:24:22 2026
//Host        : LAPTOP-CHCSI1R5 running 64-bit major release  (build 9200)
//Command     : generate_target pucch1_wrapper.bd
//Design      : pucch1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module pucch1_wrapper
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
  input clk;
  input i_config_valid;
  input [7:0]i_group_hopping;
  input [15:0]i_hopping_ID;
  input i_pucch1_valid;
  input [511:0]pucch_parameter;
  input rst;
  input stop_trigger;
  input trigger_05;

  wire [255:0]ant_input;
  wire clk;
  wire i_config_valid;
  wire [7:0]i_group_hopping;
  wire [15:0]i_hopping_ID;
  wire i_pucch1_valid;
  wire [511:0]pucch_parameter;
  wire rst;
  wire stop_trigger;
  wire trigger_05;

  pucch1 pucch1_i
       (.ant_input(ant_input),
        .clk(clk),
        .i_config_valid(i_config_valid),
        .i_group_hopping(i_group_hopping),
        .i_hopping_ID(i_hopping_ID),
        .i_pucch1_valid(i_pucch1_valid),
        .pucch_parameter(pucch_parameter),
        .rst(rst),
        .stop_trigger(stop_trigger),
        .trigger_05(trigger_05));
endmodule
