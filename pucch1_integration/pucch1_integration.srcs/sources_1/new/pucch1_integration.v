`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/16/2026 02:20:14 PM
// Design Name: pucch1_integration
// Module Name: pucch1_integration
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  PUCCH 1 integration with all IPs
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pucch1_integration(
	input clk, 
	input rst, 
	input trigger_05, 
	input stop_trigger, 
	input i_pucch1_valid, 
	input i_config_valid, 
	input [7:0]i_group_hopping, 
	input [15:0]i_hopping_ID, 
	input [511:0]pucch_parameter, 
	input [255:0]ant_input, 
	output o_valid, 
	output dtx, 
	output [1:0]harq, 
	output sr
    );
	
	pucch1 pucch1_i
		(.ant_input(ant_input),
		.clk(clk),
		.dtx(dtx),
		.harq(harq),
		.i_config_valid(i_config_valid),
		.i_group_hopping(i_group_hopping),
		.i_hopping_ID(i_hopping_ID),
		.i_pucch1_valid(i_pucch1_valid),
		.o_valid(o_valid),
		.pucch_parameter(pucch_parameter),
		.rst(rst),
		.sr(sr),
		.stop_trigger(stop_trigger),
		.trigger_05(trigger_05)
	);
endmodule
