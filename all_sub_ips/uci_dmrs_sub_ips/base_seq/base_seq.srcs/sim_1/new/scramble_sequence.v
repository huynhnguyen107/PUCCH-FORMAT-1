`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/17/2025 07:59:40 PM
// Design Name: 
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


module scramble_sequence(
	input clk,
	input rst,
	input in_valid,
	input [5:0] ID,
	input [7:0] markP,
	output out_valid,
	output [7:0] scramble
    );
	wire out_valid_16;
	wire [30:0] x1_16;
	wire [30:0] x2_16;
	//x1 x1_1600-1631
	x1_x2_init x1_x2_init_0 (clk, rst, in_valid, ID, out_valid_16, x1_16, x2_16);
	reg [30:0] x1_next;
	reg [30:0] x2_next;
	reg [7:0] c;
	reg [8:0] cnt;
	reg [7:0] max_cnt;
	reg scramble_valid;
	//control
	always @(posedge clk)
		if (rst) begin
			cnt <=0;
			scramble_valid <=0;
			max_cnt <=0;
		end
		else begin
			max_cnt <= in_valid ? markP: max_cnt;
			scramble_valid <= (in_valid & cnt <= max_cnt) ? 1'b1: (cnt > max_cnt ? 1'b0 : scramble_valid);
			cnt <= (scramble_valid|in_valid) ? cnt +1: 0;
		end
	//Calculate scramble sequence
	always @(posedge clk)
		if (rst) begin
			x1_next <= 0;
			x2_next <= 0;
			c <= 0;
		end
		else begin
			if (out_valid_16) begin
				x1_next <= x1_16;
				x2_next <= x2_16;
			end
			else if (scramble_valid) begin
				c <= x1_next[7:0] ^ x2_next[7:0];
				x1_next = {x1_next[10]^x1_next[7], x1_next[9]^x1_next[6], x1_next[8]^x1_next[5],
						   x1_next[7]^x1_next[4], x1_next[6]^x1_next[3], x1_next[5]^x1_next[2],
						   x1_next[4]^x1_next[1], x1_next[3]^x1_next[0], x1_next[30:8]
									};
				x2_next = {x2_next[10]^x2_next[9]^x2_next[8]^x2_next[7],x2_next[9]^x2_next[8]^x2_next[7]^x2_next[6] , x2_next[8]^x2_next[7]^x2_next[6]^x2_next[5],
						   x2_next[7]^x2_next[6]^x2_next[5]^x2_next[4], x2_next[6]^x2_next[5]^x2_next[4]^x2_next[3], x2_next[5]^x2_next[4]^x2_next[3]^x2_next[2],
						   x2_next[4]^x2_next[3]^x2_next[2]^x2_next[1], x2_next[3]^x2_next[2]^x2_next[1]^x2_next[0], x2_next[30:8]
								};
			end
			else begin
				x1_next <= 0;
				x2_next <= 0;
				c <= 0;
			end
			
		end
		assign scramble = out_valid ? c :0;
		assign out_valid = cnt== max_cnt+2;
endmodule

// find the x1 x2 at i=1600 first
// it costs a lot of cycles to find x1[1600] and x2[1600]
// we use a alternative method to find x1[1600] and x2[1600] which costs few cycles
//ref https://patents.google.com/patent/US8793295B2/en
//https://patents.google.com/patent/WO2022001427A1/en details the mask
// This means that x2(1600) is a Boolean function of the initial state x2(0..30),
// i.e., x2(1600) = f(x2(0), x2(1), ..., x2(30)).
// It can be computed using a precomputed mask.
//
// Example (explicit XOR form):
// assign x2_1600 = x2[1] ^ x2[2] ^ x2[3] ^ x2[8] ^ x2[12]
//                ^ x2[16] ^ x2[19] ^ x2[20] ^ x2[23];
//
// Equivalent mask-based form:
// assign x2_1600 = ^(x2[30:0] & 32'd10031374);
// for x1 because we know value x1[30:0] we can precaculate x1[1630:1600]=1581799488

module x1_x2_init(
	input clk,
	input rst,
	input in_valid,
	input [5:0] ID,
	output out_valid,
	output [30:0] x1_16,
	output [30:0] x2_1600_1631
    );
	wire [31:0] temp_in;
	assign temp_in = {26'd0, ID};
	//assign bit from 1600-1631
	assign x2_1600_1631[0]= ^(temp_in[31:0]  & 32'd10031374);
	assign x2_1600_1631[1]= ^(temp_in[31:0]  & 32'd20062748);
	assign x2_1600_1631[2]= ^(temp_in[31:0]  & 32'd40125496);
	assign x2_1600_1631[3]= ^(temp_in[31:0]  & 32'd80250992);
	assign x2_1600_1631[4]= ^(temp_in[31:0]  & 32'd160501984);
	assign x2_1600_1631[5]= ^(temp_in[31:0]  & 32'd321003968);
	assign x2_1600_1631[6]= ^(temp_in[31:0]  & 32'd642007936);
	assign x2_1600_1631[7]= ^(temp_in[31:0]  & 32'd1284015872);
	assign x2_1600_1631[8]= ^(temp_in[31:0]  & 32'd420548111);
	assign x2_1600_1631[9]= ^(temp_in[31:0]  & 32'd841096222);
	assign x2_1600_1631[10]= ^(temp_in[31:0] & 32'd1682192444);
	assign x2_1600_1631[11]= ^(temp_in[31:0] & 32'd1216901239);
	assign x2_1600_1631[12]= ^(temp_in[31:0] & 32'd286318817);
	assign x2_1600_1631[13]= ^(temp_in[31:0] & 32'd572637634);
	assign x2_1600_1631[14]= ^(temp_in[31:0] & 32'd1145275268);
	assign x2_1600_1631[15]= ^(temp_in[31:0] & 32'd143066887);
	assign x2_1600_1631[16]= ^(temp_in[31:0] & 32'd286133774);
	assign x2_1600_1631[17]= ^(temp_in[31:0] & 32'd572267548);
	assign x2_1600_1631[18]= ^(temp_in[31:0] & 32'd1144535096);
	assign x2_1600_1631[19]= ^(temp_in[31:0] & 32'd141586559);
	assign x2_1600_1631[20]= ^(temp_in[31:0] & 32'd283173118);
	assign x2_1600_1631[21]= ^(temp_in[31:0] & 32'd566346236);
	assign x2_1600_1631[22]= ^(temp_in[31:0] & 32'd1132692472);
	assign x2_1600_1631[23]= ^(temp_in[31:0] & 32'd117901311);
	assign x2_1600_1631[24]= ^(temp_in[31:0] & 32'd235802622);
	assign x2_1600_1631[25]= ^(temp_in[31:0] & 32'd471605244);
	assign x2_1600_1631[26]= ^(temp_in[31:0] & 32'd943210488);
	assign x2_1600_1631[27]= ^(temp_in[31:0] & 32'd1886420976);
	assign x2_1600_1631[28]= ^(temp_in[31:0] & 32'd1625358319);
	assign x2_1600_1631[29]= ^(temp_in[31:0] & 32'd1103232977);
	assign x2_1600_1631[30]= ^(temp_in[31:0] & 32'd58982317);
	//x1
	assign x1_16 = 31'd1581799488;
	assign out_valid = in_valid;
endmodule


















