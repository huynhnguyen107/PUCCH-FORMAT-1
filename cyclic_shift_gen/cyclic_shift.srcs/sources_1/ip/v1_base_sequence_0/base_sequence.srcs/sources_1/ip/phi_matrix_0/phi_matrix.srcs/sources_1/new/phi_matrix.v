`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/22/2025 06:13:39 PM
// Design Name: phi_matrix
// Module Name: phi_matrix
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


module phi_matrix(
	input clk, 
	input rst, 
	input in_valid, 
	input [4:0] u, 
	output reg out_valid, 
	output reg [2:0] phi
    );
	reg [8:0] start_cnt;
	reg d_in_valid;
	wire valid_96;
	reg d_valid_96;
	reg d2_valid_96;
	reg [3:0] cnt;
	reg [8:0] addra;
	wire [2:0] phi_tmp;
	blk_mem_gen_0 blk_mem_gen_0 (
	  .clka(clk),    // input wire clka
	  .ena(d_valid_96),      // input wire ena
	  .addra(addra),  // input wire [8 : 0] addra
	  .douta(phi_tmp)  // output wire [2 : 0] douta
	);
	// find start address of rom
	always @(posedge clk)
		if (rst) begin
			start_cnt <= 0;
			d_in_valid <=0;
		end
		else begin
			if (in_valid)
				start_cnt <= (u<<3) + (u<<2);
			d_in_valid <= in_valid;
		end			
	extend_valid_new #(96) extend_valid_new0(clk, rst, d_in_valid, valid_96);
	always @(posedge clk)
		if (rst) begin
			addra <= 0;
			cnt <= 0;
			d_valid_96 <= 0;
			d2_valid_96 <= 0;
			out_valid <= 0;
			phi <= 0;
		end
		else begin
			d_valid_96 <= valid_96;
			d2_valid_96 <= d_valid_96;
			cnt <= valid_96 ? (cnt==11 ? 0: cnt+1): 0;
			addra <= (valid_96 & cnt==0) ? start_cnt : (valid_96 ? addra+1:0);
			if (d2_valid_96) begin
				phi <= phi_tmp;
				out_valid <= d2_valid_96;
			end 
			else 
			begin
				phi <= 0;
				out_valid <= 0;
			end 
		end
endmodule

//extend module
module extend_valid_new #(parameter number_cycles=100)(
		input clk,
		input rst,
		input i_pulse,
		output o_valid
	);
	reg [$clog2(number_cycles)-1:0] cnt;
	reg  valid;
	always @(posedge clk)
		if (rst) begin
			cnt <= 0;
			valid <= 0;
		end
		else begin
			if (i_pulse & cnt < number_cycles-2)
				valid <= 1;
			else if (cnt >= number_cycles-2)
				valid <= 0;
			if (valid)
				cnt <= cnt +1 ;
			else if (cnt >= number_cycles-2)
				cnt <= 0;
		end
	assign o_valid = valid|i_pulse;
endmodule