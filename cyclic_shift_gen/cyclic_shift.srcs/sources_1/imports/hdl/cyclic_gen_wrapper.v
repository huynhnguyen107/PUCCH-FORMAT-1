`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 02/24/2026 08:02:31 PM
// Design Name: cylic shift generator
// Module Name: cylic_shift_generator
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  mutiply phase and base sequence
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module cyclic_gen_wrapper(
  input clk,
  input rst,
  input uci_valid,
  input [10:0]uci_NID,
  input [3:0]uci_first_symbol,
  input [1:0]uci_grouphopping,
  input uci_intra_fr_hop,
  input [3:0]uci_m0,
  input [3:0]uci_nsymbols,
  input [4:0]uci_slot,
  output [31:0]cyclic,
  output cyclic_valid
   );

  cyclic_gen cyclic_gen_i
       (.clk(clk),
        .cyclic(cyclic),
        .cyclic_valid(cyclic_valid),
        .uci_valid(uci_valid),
        .rst(rst),
        .uci_NID(uci_NID),
        .uci_first_symbol(uci_first_symbol),
        .uci_grouphopping(uci_grouphopping),
        .uci_intra_fr_hop(uci_intra_fr_hop),
        .uci_m0(uci_m0),
        .uci_nsymbols(uci_nsymbols),
        .uci_slot(uci_slot));
endmodule
