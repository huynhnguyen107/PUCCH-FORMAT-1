`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/24/2025 07:59:40 PM
// Design Name: tb
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



module tb( );
	reg clk;
	reg rst;
	reg in_valid;
	reg [4:0] uci_slot;
	reg [3:0] uci_first_symbol;
	reg [3:0] uci_m0;
	reg [3:0] uci_nSymbs;
	reg [10:0] uci_nID;
	reg [1:0] uci_grouphopping;
	reg  uci_intra_fr_hop;
	wire [31:0] cyclic_shift;
	wire cyclic_shift_valid;
	//call instance
	cyclic_gen #(1)cyclic_gen0 (clk, rst, in_valid, uci_nID, uci_slot, 
		uci_first_symbol, uci_m0, uci_nSymbs,
		uci_grouphopping, uci_intra_fr_hop,  cyclic_shift_valid, cyclic_shift );
	//create initial signals and create rst
	initial begin
		clk = 0;
		rst = 1;
		in_valid = 0;
		uci_slot = 0;
		uci_first_symbol = 0;
		uci_m0 = 0;
		uci_nSymbs = 0;
		uci_grouphopping = 0;
		uci_intra_fr_hop = 0;
		uci_nID = 0;
		#50 rst =0;
	end
	//create clock
	always #0.5 clk = !clk;
	//create others
	initial begin
		wait (!rst)
		@(posedge clk) begin
			in_valid <= 1;
			uci_slot <= 0;
			uci_first_symbol <= 0;
			uci_m0 <= 0;
			uci_nSymbs <= 14;
			uci_grouphopping <= 0;
			uci_intra_fr_hop <= 1;
			uci_nID <= 0;
		end
			@(posedge clk) begin
			in_valid <= 0;
			uci_slot <= 0;
			uci_first_symbol <= 0;
			uci_m0 <= 0;
			uci_nSymbs <= 0;
			uci_grouphopping <= 0;
			uci_intra_fr_hop <= 0;
			uci_nID <= 0;
		end
	end
endmodule
