`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/14/2026 06:49:40 PM
// Design Name: tb
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
module tb();
	reg clk;
	reg rst;
	reg in_valid;
	reg [1:0] uci_o_ack;
	reg mean_sinr_valid;
	reg [63:0] mean_sinr;
	reg payload_valid;
	reg [1:0] payload;
	reg [63:0] sinr_threshold;
	wire o_valid;
	wire dtx;
	wire sr;
	wire [1:0] harq;
	//call instance
	sr_ack_detector sr_ack_detector (clk, rst, in_valid, uci_o_ack, mean_sinr_valid, mean_sinr, payload_valid,
									payload, sinr_threshold, o_valid, dtx, sr, harq);
	// create reset and initial other signals
	initial begin
		rst =1 ;
		clk =0 ;
		in_valid =0 ;
		uci_o_ack =0 ;
		mean_sinr_valid =0 ;
		mean_sinr =0 ;
		payload_valid =0 ;
		payload =0 ;
		sinr_threshold =0 ;
	#50 rst=0;
	end
	// create clock
	always #0.5 clk =!clk;
	// create other signals
	initial begin
		wait(!rst)
		@(posedge clk) begin
			in_valid <=1 ;
			uci_o_ack <=1 ;
			mean_sinr_valid <=0 ;
			mean_sinr <=0 ;
			payload_valid <=0 ;
			payload <=0 ;
			sinr_threshold <=2 ;
		end
		@(posedge clk) begin
			in_valid <=0 ;
			uci_o_ack <=0 ;
			mean_sinr_valid <=0 ;
			mean_sinr <=0 ;
			payload_valid <=0 ;
			payload <=0 ;
			sinr_threshold <=2 ;
		end
		@(posedge clk) begin
			in_valid <=0 ;
			uci_o_ack <=0 ;
			mean_sinr_valid <=0 ;
			mean_sinr <=0 ;
			payload_valid <=1 ;
			payload <=1 ;
			sinr_threshold <=0 ;
		end
		@(posedge clk) begin
			in_valid <=0 ;
			uci_o_ack <=0 ;
			mean_sinr_valid <=1 ;
			mean_sinr <=54 ;
			payload_valid <=0 ;
			payload <=0 ;
			sinr_threshold <=2 ;
		end
		@(posedge clk) begin
			in_valid <=0 ;
			uci_o_ack <=0 ;
			mean_sinr_valid <=0 ;
			mean_sinr <=0 ;
			payload_valid <=0 ;
			payload <=0 ;
			sinr_threshold <=2 ;
		end
	end
endmodule
