`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: N/A
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 11/10/2025 03:59:34 PM
// Design Name: 
// Module Name: CTR_FFT
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
		output o_fwd,
		output [11:0] o_trigger_cp,
		output o_start_symbol,
		output [DATA_WIDTH-1:0] o_imag_pucch_ofdm,
		output [DATA_WIDTH-1:0] o_real_pucch_ofdm,
		output o_data_valid,
		output o_data_last,
		output o_tready,
		output o_aclken
    );
	
//extend valid to 4096 cycles
	extend_valid_4096 extend_valid_4096_0(clk, rst, i_start_symbol, o_data_valid);
//output
	assign o_fwd = 1'b1;
	assign o_trigger_cp = i_trigger_cp;
	assign o_start_symbol = i_start_symbol;
	assign o_imag_pucch_ofdm = i_img_pucch_ofdm;
	assign o_real_pucch_ofdm = i_real_pucch_ofdm;
	assign o_data_last = 1'b0;
	assign o_tready = 1'b1;
	assign o_aclken = 1'b1;

endmodule

module extend_valid_4096 (
		input clk,
		input rst,
		input i_pulse,
		output o_valid
	);
	parameter N=4096;
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