`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2025 04:38:25 PM
// Design Name: 
// Module Name: dis_alpha_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dis_alpha_gen (
	input clk,	
	input rst,	
	input in_valid,	
	input [3:0] alpha,	
	output dis_alpha_valid,	
	output  [7:0] dis_alpha	
	);
	reg [3:0] reg_alpha;
	reg [6:0] cnt_96;
	reg [3:0] cnt_12;
	reg  cnt_valid;
	reg  d_cnt_valid;
	always @(posedge clk) begin
		if (rst) begin
			cnt_valid <= 0;
			cnt_96 <= 0;
			cnt_12 <= 0;
			reg_alpha <= 0;
			d_cnt_valid <= 0;
		end
		else begin
			if (in_valid)
				reg_alpha <= alpha;
			//valid
			if (in_valid) 
				cnt_valid <= 1;
			else if (cnt_96 >= 95)
				cnt_valid <= 0;
			//cnt 96	
			if (cnt_valid)	
				cnt_96 <= cnt_96 +1;
			else
				cnt_96 <= 0;
			//cnt 12
			if (cnt_valid)	
				cnt_12 <= (cnt_12==11) ? 0: cnt_12 +1;
			d_cnt_valid <= cnt_valid;
		end
	end
	// mux from 0*alpha to 11*alpha
	mult_gen_dis_alpha mult_gen_dis_alpha_0 (
      .CLK(clk),  // input wire CLK
      .A(reg_alpha),      // input wire [3 : 0] A
      .B(cnt_12),      // input wire [3 : 0] B
      .P(dis_alpha)      // output wire [7 : 0] P
    );
	assign dis_alpha_valid = d_cnt_valid ;
endmodule