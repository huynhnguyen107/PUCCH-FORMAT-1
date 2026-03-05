`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/03/2026 07:15:03 PM
// Design Name: com_mul_cyclic
// Module Name: com_mul_cyclic
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description: multiply basequence and phase gen
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module com_mul_cyclic(
	input clk,
	input rst,
	input basequence_valid,
	input [31:0] basequence,
	input phase_valid,
	input [31:0] phase,
	output cyclic_valid,
	output [31:0] cyclic
    );
	wire [79 : 0] m_axis_dout_tdata;
	
	
	cyclic_cmpy_0 cyclic_cmpy_0 (
	  .aclk(clk),                              // input wire aclk
	  .aclken(rst),                          // input wire aclken
	  .s_axis_a_tvalid(basequence_valid),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(basequence),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(phase_valid),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(phase),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(cyclic_valid),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(m_axis_dout_tdata)    // output wire [79 : 0] m_axis_dout_tdata
	);
	assign cyclic= {m_axis_dout_tdata[69:54], m_axis_dout_tdata[29:14]};
endmodule
