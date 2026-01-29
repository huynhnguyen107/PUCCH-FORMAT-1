`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/17/2025 05:49:01 PM
// Design Name: base sequence
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


module modulo_30 (
	input clk,	
	input rst,	
	input  in_valid,	
	input [10:0] in,	
	output  out_valid,
	output [5:0] quotient,	
	output [4:0] remainder
	);
	wire [15: 0] divisor;
	assign divisor = 16'd1092;
	wire [26:0] floor_temp;
	wire [5:0] floor;
	wire [10:0] in_less;//30*floor
	reg  [10:0] reg_in;
	reg  reg_valid;
	reg  d_reg_valid;
	reg  d2_reg_valid;
	modulo30_mult_gen_0 modulo30_mult_gen_0 (
	  .CLK(clk),  // input wire CLK
	  .A(reg_in),      // input wire [10 : 0] A
	  .B(divisor),      // input wire [15 : 0] B
	  .P(floor_temp)      // output wire [26 : 0] P
	);
	assign floor = floor_temp[20:15];
	modulo30_mult_gen_1 modulo30_mult_gen_1 (
	  .CLK(clk),  // input wire CLK
	  .A(floor),      // input wire [5 : 0] A
	  .B(5'd30),      // input wire [4 : 0] B
	  .P(in_less)      // output wire [10 : 0] P
	);
	always @(posedge clk)
		if (rst) begin
			reg_valid <= 0;
			d_reg_valid <= 0;
			d2_reg_valid <= 0;
			reg_in <= 0;
		end
		else begin
			reg_in <= in_valid ? in: reg_in;
			reg_valid <= in_valid;
			d_reg_valid <= reg_valid;
			d2_reg_valid <= d_reg_valid;
		end
			
	//output 
	assign out_valid = d2_reg_valid;
	assign quotient = floor;
	assign remainder = reg_in -in_less;
endmodule 
