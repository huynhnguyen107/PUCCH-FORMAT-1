`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2025 02:39:49 PM
// Design Name: scramble_sequence
// Module Name: tb
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  modulo the input with N to find quotient and remainder
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
	reg [30:0] ID;
	reg [30:0] markP;
	wire out_valid;
	wire [7:0] scramble;
	//instance scramble_sequence
	scramble_sequence_8bits scramble_sequence_8bits (clk, rst, in_valid, ID, markP, scramble);
	//intial all signals and create rst
	initial begin
		clk =0;
		rst =1;
		in_valid =0;
		ID =0;
		markP =0;
		#50 rst=0;
	end
	//create clock
	always #0.5 clk=~clk;
	//create others
	initial begin
		wait(!rst)
		@(posedge clk) begin
			in_valid <= 1;
			ID <= 1;
			markP <= 9;
		end
		@(posedge clk) begin
			in_valid <= 0;
			ID <= 0;
			markP <= 0;
		end
	end
endmodule
