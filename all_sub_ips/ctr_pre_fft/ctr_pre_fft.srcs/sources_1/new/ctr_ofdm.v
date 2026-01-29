`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: N/A
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 11/14/2025 03:59:34 PM
// Design Name: 
// Module Name: CTR_FFT_Pre_FFT
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description: Control FFT
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ctr_fft #(parameter DATA_WIDTH=16)(
		input clk,
		input rst,
		input [11:0] i_trigger_cp,
		input i_start_symbol,
		input [DATA_WIDTH-1:0] i_img_pucch_ofdm,
		input [DATA_WIDTH-1:0] i_real_pucch_ofdm,
		output [DATA_WIDTH-1:0] o_imag_pucch_ofdm,
		output [DATA_WIDTH-1:0] o_real_pucch_ofdm,
		output o_data_valid
    );
wire extend_1;
wire valid_tmp;
reg d_extend_1;
wire falling_edge;
reg odd_valid, d_valid_tmp, d1_valid_tmp;
reg [DATA_WIDTH-1:0] real_pucch_ofdm_tmp, imag_pucch_ofdm_tmp;
reg [DATA_WIDTH-1:0] real_pucch_ofdm_tmp1, imag_pucch_ofdm_tmp1;
//extend valid to CP cycles
extend_valid_4096 extend_valid_4096_0(clk, rst, i_start_symbol, {1'b0, i_trigger_cp}, extend_1);
//falling edge
always @(posedge clk)
	if (rst) begin
			d_extend_1 <=1'b0;
			odd_valid <=1'b1;
			d_valid_tmp <=1'b0;
			d1_valid_tmp <=1'b0;
			real_pucch_ofdm_tmp <=0;
			real_pucch_ofdm_tmp1 <=0;
			imag_pucch_ofdm_tmp <=0;
			imag_pucch_ofdm_tmp1 <=0;
		end
	else  begin
			d_extend_1 <=extend_1;
			odd_valid <= d_valid_tmp ? !odd_valid: odd_valid;
			d_valid_tmp <= valid_tmp;
			d1_valid_tmp <= d_valid_tmp;
			imag_pucch_ofdm_tmp <=odd_valid ? i_img_pucch_ofdm: -i_img_pucch_ofdm;
			real_pucch_ofdm_tmp <=odd_valid ? i_real_pucch_ofdm: -i_real_pucch_ofdm;
			imag_pucch_ofdm_tmp1 <=imag_pucch_ofdm_tmp;
			real_pucch_ofdm_tmp1 <=real_pucch_ofdm_tmp;
		end
//falling_edge
assign falling_edge = d_extend_1& (!extend_1);
// extend 4096 cylces
extend_valid_4096 extend_valid_4096_1(clk, rst, falling_edge, 13'd4096, valid_tmp);

//multiply data with x_shifted[n] = x[n] * (-1)^n; ======X_shift = [X(N/2+1:end,:); X(1:N/2,:)];
assign o_imag_pucch_ofdm = imag_pucch_ofdm_tmp1;
assign o_real_pucch_ofdm = real_pucch_ofdm_tmp1;
assign o_data_valid = d1_valid_tmp;


endmodule

module extend_valid_4096 (
		input clk,
		input rst,
		input i_pulse,
		input [12:0] N,
		output o_valid
	);
	reg [12:0] cnt;
	reg  valid;
	always @(posedge clk)
		if (rst) begin
			cnt <= 0;
			valid <= 0;
		end
		else begin
			if (i_pulse & cnt < N-2)
				valid <= 1;
			else if (cnt >= N-2)
				valid <= 0;
			if (valid)
				cnt <= cnt +1 ;
			else if (cnt >= N-2)
				cnt <= 0;
		end
			
	assign o_valid = valid|i_pulse;
endmodule