`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/24/2025 08:02:31 PM
// Design Name: modulo_12
// Module Name: phase_generator
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  with input N find to floor and modulo
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module modulo_12 (
	input clk,	
	input rst,	
	input  in_valid,	
	input [8:0] in,	
	output  out_valid,
	output [5:0] quotient,	
	output [3:0] remainder
	);
	wire [15: 0] divisor;
	assign divisor = 16'd2731;
	wire [24:0] floor_temp;
	wire [5:0] floor;
	reg [5:0] d_floor;
	wire [9:0] in_less;//30*floor
	reg  [8:0] reg_in;
	reg  [8:0] d1_reg_in;
	reg  [8:0] d2_reg_in;
	reg  reg_valid;
	reg  d_reg_valid;
	reg  d2_reg_valid;
	modulo12_mult_gen_2 modulo12_mult_gen_2 (
	  .CLK(clk),  // input wire CLK
	  .A(reg_in),      // input wire [8 : 0] A
	  .B(divisor),      // input wire [15 : 0] B
	  .P(floor_temp)      // output wire [24 : 0] P
	);
	assign floor = floor_temp[20:15];
	modulo12_mult_gen_1 modulo12_mult_gen_1 (
	  .CLK(clk),  // input wire CLK
	  .A(floor),      // input wire [5 : 0] A
	  .B(4'd12),      // input wire [3 : 0] B
	  .P(in_less)      // output wire [9 : 0] P
	);
	always @(posedge clk)
		if (rst) begin
			reg_valid <= 0;
			d_reg_valid <= 0;
			d2_reg_valid <= 0;
			d_floor <= 0;
			reg_in <= 0;
			d1_reg_in <= 0;
			d2_reg_in <= 0;
		end
		else begin
			if (in_valid) begin
                reg_in <=  in;
                d_floor <= floor;
			end
			d1_reg_in <= reg_in;
			d2_reg_in <= d1_reg_in;
			reg_valid <= in_valid;
			d_reg_valid <= reg_valid;
			d2_reg_valid <= d_reg_valid;
		end
			
	//output 
	assign out_valid = d2_reg_valid;
	assign quotient = d_floor;
	assign remainder = d2_reg_in -in_less;
endmodule 

