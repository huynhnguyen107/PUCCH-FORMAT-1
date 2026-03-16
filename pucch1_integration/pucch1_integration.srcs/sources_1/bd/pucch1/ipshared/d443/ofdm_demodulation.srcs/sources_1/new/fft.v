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


module ofdm_demodulation #(parameter DATA_WIDTH=16)(
		input clk,
		input rst,
		input [3:0] scale_factor,
		input [11:0] i_trigger_cp,
		input i_start_symbol,
		input [2*DATA_WIDTH-1:0] ant_input,
		// output [DATA_WIDTH-1:0] o_imag_pucch_ofdm,
		// output [DATA_WIDTH-1:0] o_real_pucch_ofdm,
		output [2*DATA_WIDTH-1:0] pucch_ofdm,
		output  o_valid,
		output  start_symbol
    );
	wire [DATA_WIDTH-1:0] i_imag_pucch_ofdm;
	wire [DATA_WIDTH-1:0] i_real_pucch_ofdm;
	wire [DATA_WIDTH-1:0] imag_pucch_ofdm;
	wire [DATA_WIDTH-1:0] real_pucch_ofdm;
	wire [2*DATA_WIDTH-1:0] s_axis_data_tdata;
	wire [4*DATA_WIDTH-1:0] m_axis_data_tdata;
	wire o_data_valid;
	reg [2*DATA_WIDTH-1:0] imag_pucch_ofdm_scale;
	reg [2*DATA_WIDTH-1:0] real_pucch_ofdm_scale;
	reg d_o_valid;
	// assign image and real
	assign i_real_pucch_ofdm = ant_input[DATA_WIDTH-1:0];
	assign i_imag_pucch_ofdm = ant_input[2*DATA_WIDTH-1:DATA_WIDTH];
	//instance control FFT
	ctr_pre_fft_0 ctr_pre_fft_0 (
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
	assign s_axis_data_tdata = {imag_pucch_ofdm, real_pucch_ofdm};
	// assign s_axis_data_tdata = {real_pucch_ofdm, imag_pucch_ofdm};
	//instance FFT
	xfft_0 fft_0 (
	  .aclk(clk),                                                // input wire aclk
	  .s_axis_config_tdata(8'd1),                  // input wire [7 : 0] s_axis_config_tdata
	  .s_axis_config_tvalid(1'b1),                // input wire s_axis_config_tvalid
	  .s_axis_config_tready(),                // output wire s_axis_config_tready
	  .s_axis_data_tdata(s_axis_data_tdata),                      // input wire [31 : 0] s_axis_data_tdata
	  .s_axis_data_tvalid(o_data_valid),                    // input wire s_axis_data_tvalid
	  .s_axis_data_tready(),                    // output wire s_axis_data_tready
	  .s_axis_data_tlast(1'b0),                      // input wire s_axis_data_tlast
	  .m_axis_data_tdata(m_axis_data_tdata),                      // output wire [63 : 0] m_axis_data_tdata
	  .m_axis_data_tvalid(m_axis_data_tvalid),                    // output wire m_axis_data_tvalid
	  .m_axis_data_tready(1'b1),                    // input wire m_axis_data_tready
	  .m_axis_data_tlast(),                      // output wire m_axis_data_tlast
	  .event_frame_started(),                  // output wire event_frame_started
	  .event_tlast_unexpected(),            // output wire event_tlast_unexpected
	  .event_tlast_missing(),                  // output wire event_tlast_missing
	  .event_status_channel_halt(),      // output wire event_status_channel_halt
	  .event_data_in_channel_halt(),    // output wire event_data_in_channel_halt
	  .event_data_out_channel_halt()  // output wire event_data_out_channel_halt
	);

	// scale selection
	always @(*) begin
		case (scale_factor)
			0: begin
				imag_pucch_ofdm_scale = m_axis_data_tdata [63:32] >>5;
				real_pucch_ofdm_scale = m_axis_data_tdata [31:0] >>5;
			end
			1: begin
				imag_pucch_ofdm_scale = m_axis_data_tdata [63:32] >>6;
				real_pucch_ofdm_scale = m_axis_data_tdata [31:0] >>6;
			end
			2: begin
				imag_pucch_ofdm_scale = m_axis_data_tdata [63:32] >>7;
				real_pucch_ofdm_scale = m_axis_data_tdata [31:0] >>7;
			end
			3: begin
				imag_pucch_ofdm_scale = m_axis_data_tdata [63:32] >>8;
				real_pucch_ofdm_scale = m_axis_data_tdata [31:0] >>8;
			end
			4: begin
				imag_pucch_ofdm_scale = m_axis_data_tdata [63:32] >>9;
				real_pucch_ofdm_scale = m_axis_data_tdata [31:0] >>9;
			end
			default: begin
				imag_pucch_ofdm_scale = m_axis_data_tdata [63:32] >>5;
				real_pucch_ofdm_scale = m_axis_data_tdata [31:0] >>5;
			end
		endcase
	
	end
	//start symbol
	always @(posedge clk)
		if (rst)
			d_o_valid <=0;
		else
			d_o_valid <=o_valid;
	
	//output
	assign o_valid = m_axis_data_tvalid;
	// assign o_imag_pucch_ofdm = imag_pucch_ofdm_scale [15:0];
	// assign o_real_pucch_ofdm = real_pucch_ofdm_scale [15:0];
	assign pucch_ofdm = {imag_pucch_ofdm_scale [15:0], real_pucch_ofdm_scale [15:0]};
	assign start_symbol = !d_o_valid&o_valid;
endmodule
