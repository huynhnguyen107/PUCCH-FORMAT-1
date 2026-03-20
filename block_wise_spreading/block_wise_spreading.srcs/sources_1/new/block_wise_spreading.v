`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 02/18/2026 07:02:52 PM
// Design Name: uci_dmrs_gen
// Module Name: uci_dmrs_gen
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  synchronize two wise spreading results and then multiply with cyclic  
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module block_wise_spreading(
	input clk,
	input rst,
	input cyclic_valid,
	input [31:0] cyclic,
	input wise_valid_0,
	input [31:0] wise_0,
	input wise_valid_1,
	input [31:0] wise_1,
	output spreading_valid,
	output [31:0] spreading
    );
	wire [79:0] m_axis_dout_tdata;
	wire [31:0] wise;
	wire wise_valid;
	assign wise_valid= wise_valid_0|wise_valid_1;
	assign wise= wise_valid_0 ? wise_0: wise_1;
	//multiply cyc_and wise
	spreading_cmpy_0 spreading_cmpy_0 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(cyclic_valid),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(cyclic),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(wise_valid),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(wise),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(spreading_valid),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(m_axis_dout_tdata)    // output wire [79 : 0] m_axis_dout_tdata
	);
	//ouput
	assign spreading= {m_axis_dout_tdata[70:55], m_axis_dout_tdata[30:15] };
endmodule
