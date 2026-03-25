`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 02/23/2026 01:55:05 PM
// Design Name: tb
// Module Name: phase_generator
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  with Mzc=12, input u find phi
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb();
	reg clk;
	reg rst;
	reg in_uci_flag;
	reg in_valid;
	reg [10:0] uci_NID;
	reg [4:0] uci_slot;
	reg [3:0] uci_first_symbol;
	reg [3:0] uci_nSymbs;
	wire ncs_valid;
	wire [7:0] ncs;
	//call instance
	n_cs_gen n_cs_gen0(clk, rst, in_uci_flag, in_valid, uci_NID, uci_slot, 
									  uci_first_symbol, uci_nSymbs, ncs_valid, ncs  );
	// create rst and init all signals
	initial begin
		clk = 0;
		rst = 1;
		in_uci_flag = 0;
		in_valid = 0;
		uci_NID = 0;
		uci_slot = 0;
		uci_first_symbol = 0;
		uci_nSymbs = 0;
		#50 rst =0;
	end
	//create clock
	always #0.5 clk=!clk;
	//create others
	initial begin
		wait(!rst)
		@(posedge clk) begin
			in_uci_flag <= 1;
			in_valid <= 1;
			uci_NID <= 0;
			uci_slot <= 0;
			uci_first_symbol <= 0;
			uci_nSymbs <= 13;
		end
		@(posedge clk) begin
			in_uci_flag <= 0;
			in_valid <= 0;
			uci_NID <= 0;
			uci_slot <= 0;
			uci_first_symbol <= 0;
			uci_nSymbs <= 0;
		end
	end
endmodule