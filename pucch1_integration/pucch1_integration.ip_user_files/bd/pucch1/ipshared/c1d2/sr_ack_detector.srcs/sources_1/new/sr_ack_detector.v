`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/14/2026 06:19:40 PM
// Design Name: sr_ack_detector
// Module Name: sr_ack_detector
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  find ack and sir based on estimated payload, SINR and threshold 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sr_ack_detector(
	input clk, 
	input rst, 
	input in_valid, 
	input [1:0] uci_o_ack, 
	input mean_sinr_valid, 
	input [63:0] mean_sinr, 
	input payload_valid, 
	input [1:0] payload, 
	input [63:0] sinr_threshold, 
	output reg o_valid, 
	output reg dtx, 
	output reg sr, 
	output reg [1:0] harq
    );
	reg [1:0] reg_o_ack;
	reg [63:0] reg_mean_sinr;
	reg [1:0] reg_payload;
	reg valid;
	//save to register
	always @(posedge clk) begin
		if (rst) begin
			reg_o_ack <= 0;
			reg_mean_sinr <= 0;
			reg_payload <= 0;
			o_valid <= 0;
		end
		else begin
			if (in_valid)
				reg_o_ack <= uci_o_ack;
			if (payload_valid) 	
				reg_payload <= payload;
			if (mean_sinr_valid) 
				reg_mean_sinr <= mean_sinr;
			o_valid <= mean_sinr_valid;
		end
	end
	//select dtx, sr, harq
	always @(*) begin
		case (reg_o_ack) 
			0: begin
				harq = 0;
				if ((reg_mean_sinr>sinr_threshold)&(reg_payload==0)) begin
					dtx = 0;
					sr = 1;
				end
				else begin
					dtx = 1;
					sr = 0;
				end
			end
			1: begin
				sr = 0;
				if (reg_mean_sinr<=sinr_threshold) begin
					dtx = 1;
					harq = reg_payload;
				end
				else begin
					dtx = 0;
					harq = reg_payload;
				end
			end
			2: begin
				sr = 0;
				if (reg_mean_sinr<=sinr_threshold) begin
					dtx = 1;
					harq = reg_payload;
				end
				else begin
					dtx = 0;
					harq = reg_payload;
				end
			end
			default: begin //1
				sr = 0;
				if (reg_mean_sinr<=sinr_threshold) begin
					dtx = 1;
					harq = reg_payload;
				end
				else begin
					dtx = 0;
					harq = reg_payload;
				end
			end
		endcase	
	end
endmodule
