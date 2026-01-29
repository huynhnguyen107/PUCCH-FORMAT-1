`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/22/2025 07:59:40 PM
// Design Name: tb
// Module Name: scramble_sequence
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  create scramble_sequence with init value and number of bits
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
	reg [1:0] uci_grouphopping;
	reg [10:0] uci_nID;
	reg uci_nhop;
	wire [31:0] base_sequence;
	wire base_sequence_valid;
	//call instance
	base_sequence base_sequence_0 (clk, rst, in_valid, uci_slot, uci_grouphopping, uci_nID, uci_nhop, base_sequence, base_sequence_valid);
	//create initial signals and create rst
	initial begin
		clk = 0;
		rst = 1;
		in_valid = 0;
		uci_slot = 0;
		uci_grouphopping = 0;
		uci_nID = 0;
		uci_nhop = 0;
		#50 rst =0;
	end
	//create clock
	always #0.5 clk = !clk;
	//create others
	initial begin
		wait (!rst)
		@(posedge clk) begin
			in_valid <= 1;
			uci_slot <= 4;
			uci_grouphopping <= 1;
			uci_nID <= 35;
			uci_nhop <= 1;
		end
			@(posedge clk) begin
			in_valid <= 0;
			uci_slot <= 0;
			uci_grouphopping <= 0;
			uci_nID <= 0;
			uci_nhop <= 0;
		end
	end
endmodule
