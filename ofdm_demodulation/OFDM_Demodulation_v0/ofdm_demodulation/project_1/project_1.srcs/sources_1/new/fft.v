`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 11/10/2025 05:20:18 PM
// Design Name: 
// Module Name: FFT
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  FFT
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fft #(parameter DATA_WIDTH=16)(
		input clk,
		input rst,
		input [11:0] i_trigger_cp,
		input i_start_symbol,
		input [DATA_WIDTH-1:0] i_imag_pucch_ofdm,
		input [DATA_WIDTH-1:0] i_real_pucch_ofdm,
		output [DATA_WIDTH-1:0] o_imag_pucch_ofdm,
		output [DATA_WIDTH-1:0] o_real_pucch_ofdm,
		output [2*DATA_WIDTH-1:0] pucch_ofdm,
		output  o_valid
    );
	wire o_fwd;
	wire [11:0] o_trigger_cp;
	wire o_start_symbol;
	wire [DATA_WIDTH-1:0] imag_pucch_ofdm;
	wire [DATA_WIDTH-1:0] real_pucch_ofdm;
	wire [32-1:0] imag_pucch_ofdm_1;
	wire [32-1:0] real_pucch_ofdm_1;
	wire [2*DATA_WIDTH-1:0] s_axis_data_tdata;
	wire [63:0] m_axis_data_tdata;
	wire o_data_valid;
	wire o_data_last;
	wire o_tready;
	wire o_aclken;
	//instance control FFT
	ctr_fft_0 ctr_fft_0 (
	  .clk(clk),                              // input wire clk
	  .rst(rst),                              // input wire rst
	  .i_trigger_cp(i_trigger_cp),            // input wire [11 : 0] i_trigger_cp
	  .i_start_symbol(i_start_symbol),        // input wire i_start_symbol
	  .i_img_pucch_ofdm(i_imag_pucch_ofdm),    // input wire [15 : 0] i_img_pucch_ofdm
	  .i_real_pucch_ofdm(i_real_pucch_ofdm),  // input wire [15 : 0] i_real_pucch_ofdm
	  .o_imag_pucch_ofdm(imag_pucch_ofdm),  // output wire [15 : 0] o_imag_pucch_ofdm
	  .o_real_pucch_ofdm(real_pucch_ofdm),  // output wire [15 : 0] o_real_pucch_ofdm
	  .o_data_valid(o_data_valid)            // output wire o_data_valid
	);
	// assign s_axis_data_tdata = {imag_pucch_ofdm, real_pucch_ofdm};
	assign s_axis_data_tdata = {real_pucch_ofdm, imag_pucch_ofdm};
	//instance FFT
	xfft_0 fft (
	  .aclk(clk),                                                // input wire aclk
	  .aclken(o_aclken),                                            // input wire aclken
	  .s_axis_config_tdata({12'd0,o_trigger_cp}),                  // input wire [23 : 0] s_axis_config_tdata
	  .s_axis_config_tvalid(o_start_symbol),                // input wire s_axis_config_tvalid
	  .s_axis_config_tready(),                // output wire s_axis_config_tready
	  .s_axis_data_tdata(s_axis_data_tdata),                      // input wire [31 : 0] s_axis_data_tdata
	  .s_axis_data_tvalid(o_data_valid),                    // input wire s_axis_data_tvalid
	  .s_axis_data_tready(),                    // output wire s_axis_data_tready
	  .s_axis_data_tlast(o_data_last),                      // input wire s_axis_data_tlast
	  .m_axis_data_tdata(m_axis_data_tdata),                      // output wire [63 : 0] m_axis_data_tdata
	  .m_axis_data_tvalid(m_axis_data_tvalid),                    // output wire m_axis_data_tvalid
	  .m_axis_data_tready(o_tready),                    // input wire m_axis_data_tready
	  .m_axis_data_tlast(),                      // output wire m_axis_data_tlast
	  .event_frame_started(),                  // output wire event_frame_started
	  .event_tlast_unexpected(),            // output wire event_tlast_unexpected
	  .event_tlast_missing(),                  // output wire event_tlast_missing
	  .event_status_channel_halt(),      // output wire event_status_channel_halt
	  .event_data_in_channel_halt(),    // output wire event_data_in_channel_halt
	  .event_data_out_channel_halt()  // output wire event_data_out_channel_halt
	);
	assign o_valid = m_axis_data_tvalid;
	assign o_imag_pucch_ofdm = m_axis_data_tdata [63:32];
	assign imag_pucch_ofdm_1 = m_axis_data_tdata [63:32];
	assign o_real_pucch_ofdm = m_axis_data_tdata [31:0];
	assign real_pucch_ofdm_1 = m_axis_data_tdata [31:0];
	assign pucch_ofdm = {m_axis_data_tdata [47:32], m_axis_data_tdata [15:0]};
endmodule
