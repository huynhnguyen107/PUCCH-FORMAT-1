//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Tue Mar 24 21:41:29 2026
//Host        : LAPTOP-CHCSI1R5 running 64-bit major release  (build 9200)
//Command     : generate_target cyclic_gen_wrapper.bd
//Design      : cyclic_gen_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module cyclic_gen_wrapper
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
  input clk;
  output [31:0]cyclic;
  output cyclic_valid;
  input rst;
  input [10:0]uci_NID;
  input [3:0]uci_first_symbol;
  input [1:0]uci_grouphopping;
  input uci_intra_fr_hop;
  input [3:0]uci_m0;
  input [3:0]uci_nsymbols;
  input [4:0]uci_slot;
  input uci_valid;

  wire clk;
  wire [31:0]cyclic;
  wire cyclic_valid;
  wire rst;
  wire [10:0]uci_NID;
  wire [3:0]uci_first_symbol;
  wire [1:0]uci_grouphopping;
  wire uci_intra_fr_hop;
  wire [3:0]uci_m0;
  wire [3:0]uci_nsymbols;
  wire [4:0]uci_slot;
  wire uci_valid;

  cyclic_gen cyclic_gen_i
       (.clk(clk),
        .cyclic(cyclic),
        .cyclic_valid(cyclic_valid),
        .rst(rst),
        .uci_NID(uci_NID),
        .uci_first_symbol(uci_first_symbol),
        .uci_grouphopping(uci_grouphopping),
        .uci_intra_fr_hop(uci_intra_fr_hop),
        .uci_m0(uci_m0),
        .uci_nsymbols(uci_nsymbols),
        .uci_slot(uci_slot),
        .uci_valid(uci_valid));
endmodule
