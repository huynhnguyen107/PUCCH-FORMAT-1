`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/17/2025 06:28:10 PM
// Design Name: tb
// Module Name: modulo
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
	reg  in_valid ;
	reg [10:0] in ;
	wire  out_valid ;
	wire [5:0] quotient;	
	wire [4:0] remainder;	
	//instance Module
	modulo_30 modulo_n_0 (clk, rst, in_valid,  in, out_valid, quotient, remainder);
	// initial all signals and create rst
	initial begin
		clk = 0;
		in_valid = 0;
		in = 0;
		rst = 1;
		in = 0;
		#50 rst =0;
	end
	// create clock
	always #0.5 clk = ~clk;
	// create in
	initial begin
		wait (!rst);
		@(posedge clk) begin
			in_valid <= 1;
			in <= 35;
		end
		@(posedge clk) begin
			in_valid <= 0;
			in <= 0;
		end
	
	end
endmodule
