`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/29/2025 12:15:19 AM
// Design Name: ulcch_parameter
// Module Name: ulcch_parameter
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  mapping layer2 parameter
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module ulcch_parameter(
	input clk,
	input rst,
	// ulcch request for pucch
	input i_pucch_valid,
	input [511:0] ulcch_para,
	// config request for pucch
	input i_config_valid,
	input [7:0] i_group_hopping,
	input [15:0] i_hopping_ID,
	//ulcch
	output reg pucch_valid,
	output reg [15:0] uci_slot_idx,
	output reg [15:0] uci_rnti,
	output reg [15:0] uci_nid,
	output reg [7:0] uci_srflag,
	output reg [7:0] uci_frist_symbol,
	output reg [15:0] uci_pbr_offset,
	output reg [15:0] uci_second_prb,
	output reg [15:0] uci_prb,
	output reg [7:0] uci_symbol,
	output reg [7:0] uci_intra_fre_hopping,
	output reg [15:0] uci_m0,
	output reg [15:0] uci_ack,
	// congif
	output reg config_valid,
	output reg [7:0] group_hopping,
	output reg [15:0] hopping_ID

	
    );
	always @(posedge clk)
		if (rst) begin
			pucch_valid <= 0;
			uci_slot_idx <= 0;
			uci_rnti <= 0;
			uci_nid <= 0;
			uci_srflag <= 0;
			uci_frist_symbol <= 0;
			uci_pbr_offset <= 0;
			uci_second_prb <= 0;
			uci_prb <= 0;
			uci_symbol <= 0;
			uci_intra_fre_hopping <= 0;
			uci_m0 <= 0;
			uci_ack <= 0;
			pucch_valid <= 0;
			config_valid <= 0;
			group_hopping <= 0;
			hopping_ID <= 0;
		end
		else begin
			if (i_pucch_valid) begin
				uci_slot_idx <= ulcch_para[7:0];
				uci_rnti <= ulcch_para[79:64];
				uci_nid <= ulcch_para[175:160];
				uci_srflag <= ulcch_para[199:192];
				uci_frist_symbol <= ulcch_para[207:200];
				uci_pbr_offset <= ulcch_para[223:208];
				uci_second_prb <= ulcch_para[239:224];
				uci_prb <= ulcch_para[255:240];
				uci_symbol <= ulcch_para[263:256];
				uci_intra_fre_hopping <= ulcch_para[271:264];
				uci_m0 <= ulcch_para[287:272];
				uci_ack <= ulcch_para[367:352];	
	
			end
			if (i_config_valid) begin
				group_hopping <= i_group_hopping;
				hopping_ID <= i_hopping_ID;
			end
			pucch_valid <= i_pucch_valid;
			config_valid <= i_config_valid;
		end
			
endmodule
