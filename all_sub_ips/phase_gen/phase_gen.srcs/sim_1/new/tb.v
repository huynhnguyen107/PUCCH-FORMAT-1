`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/23/2025 08:02:31 PM
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
	reg in_valid;
	reg [10:0] uci_NID;
	reg [4:0] uci_slot;
	reg [3:0] uci_first_symbol;
	reg  uci_sym_alloc;
	reg [3:0] uci_m0;
	reg [1:0] uci_ack;
	wire phase_valid;
	wire [31:0] phase;
	//call instance
	phase_gen phase_gen0(clk, rst, in_valid, uci_NID, uci_slot, 
									  uci_first_symbol, uci_sym_alloc, uci_m0, uci_ack, phase_valid, phase  );
	// create rst and init all signals
	initial begin
		clk = 0;
		rst = 1;
		in_valid = 0;
		uci_NID = 0;
		uci_slot = 0;
		uci_first_symbol = 0;
		uci_sym_alloc = 0;
		uci_m0 = 0;
		uci_ack = 0;
		#50 rst =0;
	end
	//create clock
	always #0.5 clk=!clk;
	//create others
	initial begin
		wait(!rst)
		@(posedge clk) begin
			in_valid <= 1;
			uci_NID <= 35;
			uci_slot <= 4;
			uci_first_symbol <= 0;
			uci_sym_alloc <= 1;
			uci_m0 <= 0;
			uci_ack <= 2;
		end
		@(posedge clk) begin
			in_valid <= 0;
			uci_NID <= 0;
			uci_slot <= 0;
			uci_first_symbol <= 0;
			uci_sym_alloc <= 0;
			uci_m0 <= 0;
			uci_ack <= 0;
		end
	end
endmodule
