`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/16/2026 04:42:37 PM
// Design Name: tb
// Module Name: data_dmrs_selection
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  data_dmrs_selection from ofdm demodulation
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
	reg uci_valid;
	reg [3:0] uci_nsymbols;
	reg resoureset_valid;
	reg ofdm_valid;
	reg [31:0] ofdm;
	wire dmrs_valid;
	wire [31:0] dmrs;
	wire data_valid;
	wire [31:0] data;
	integer i=0;
	integer k=0;
	//call instance
	data_dmrs_selection data_dmrs_selection(clk, rst, uci_valid, uci_nsymbols, resoureset_valid, ofdm_valid,
											ofdm, dmrs_valid, dmrs, data_valid, data);
	// create reset and initial other signals
	initial begin
		rst=1;
		clk=0;
		uci_valid=0;
		uci_nsymbols=0;
		resoureset_valid=0;
		ofdm_valid=0;
		ofdm=0;
	#50 rst=0;
	end
	//create clock
	always #0.5 clk = !clk;
	// create other signals
	initial begin
		wait(!rst)
		@(posedge clk) begin
			uci_valid <=1;
			uci_nsymbols <=9;
			resoureset_valid <=0;
			ofdm_valid <=0;
			ofdm <=0;
		end
		for (k=0;k<9;k=k+1) begin
			for (i=0;i<12;i=i+1) begin
				@(posedge clk) begin
					uci_valid <=0;
					uci_nsymbols <=0;
					resoureset_valid <=1;
					ofdm_valid <=1;
					ofdm[31:16] <=0;
					ofdm[15:0] <=327*(i*k);
				end
			end
			for (i=0;i<12;i=i+1) begin
				@(posedge clk) begin
					uci_valid <=0;
					uci_nsymbols <=0;
					resoureset_valid <=0;
					ofdm_valid <=0;
					ofdm[31:16] <=0;
					ofdm[15:0] <=0;
				end
			end
		end
		for (i=0;i<1000;i=i+1) begin
				@(posedge clk) begin
					uci_valid <=0;
					uci_nsymbols <=0;
					resoureset_valid <=0;
					ofdm_valid <=0;
					ofdm[31:16] <=0;
					ofdm[15:0] <=0;
				end
			end
		for (k=0;k<9;k=k+1) begin
			for (i=0;i<12;i=i+1) begin
				@(posedge clk) begin
					uci_valid <=0;
					uci_nsymbols <=0;
					resoureset_valid <=1;
					ofdm_valid <=1;
					ofdm[31:16] <=0;
					ofdm[15:0] <=327*(i*k);
				end
			end
			for (i=0;i<12;i=i+1) begin
				@(posedge clk) begin
					uci_valid <=0;
					uci_nsymbols <=0;
					resoureset_valid <=0;
					ofdm_valid <=0;
					ofdm[31:16] <=0;
					ofdm[15:0] <=0;
				end
			end
		end
	end
endmodule
