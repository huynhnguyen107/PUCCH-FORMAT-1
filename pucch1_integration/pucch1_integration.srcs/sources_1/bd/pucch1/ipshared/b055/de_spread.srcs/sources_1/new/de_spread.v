`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/09/2026 01:27:50 PM
// Design Name: de_spread
// Module Name: de_spread
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  save dmrs or uci gen first before multuply complex with rx_data or rx_dmrs
// de_spreading_data= d_rx_data * conj(spreading) 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module de_spread(
	input clk,
	input rst,
	input spreading_data_valid,
	input [31:0] spreading_data,
	input rx_data_valid,
	input [31:0] rx_data,
	output [31:0] de_spreading_data,
	output de_spreading_data_valid
    );
	wire [31:0] d_spreading_data;
	wire [79:0] m_axis_dout_tdata;
	wire [31:0] conj_speading;
	reg [31:0] d_rx_data;
	reg d_rx_data_valid;
	//save spreading_data to fifo first
	de_spread_fifo_0 de_spread_fifo_0 (
	  .clk(clk),                  // input wire clk
	  .srst(rst),                // input wire srst
	  .din(spreading_data),                  // input wire [31 : 0] din
	  .wr_en(spreading_data_valid),              // input wire wr_en
	  .rd_en(rx_data_valid),              // input wire rd_en
	  .dout(d_spreading_data),                // output wire [31 : 0] dout
	  .full(),                // output wire full
	  .empty(),              // output wire empty
	  .wr_rst_busy(),  // output wire wr_rst_busy
	  .rd_rst_busy()  // output wire rd_rst_busy
	);
	always @(posedge clk) begin
		if (rst) begin
			d_rx_data <=0;
			d_rx_data_valid <=0;
		end
		else begin
			d_rx_data <= rx_data;
			d_rx_data_valid <= rx_data_valid;
		end
	end
	//multiply d_rx_data * conj(spreading) 
	assign conj_speading= {-d_spreading_data[31:16], d_spreading_data[15:0]};
	de_spread_cmpy_0 de_spread_cmpy_0 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(d_rx_data_valid),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(d_rx_data),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(d_rx_data_valid),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(conj_speading),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(de_spreading_data_valid),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(m_axis_dout_tdata)    // output wire [79 : 0] m_axis_dout_tdata
	);
	//assign output
	assign de_spreading_data= {m_axis_dout_tdata[70:55],m_axis_dout_tdata[30:15]};
endmodule
