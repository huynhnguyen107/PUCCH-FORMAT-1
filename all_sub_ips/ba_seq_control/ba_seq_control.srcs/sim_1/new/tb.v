`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/01/2026 07:47:48 AM
// Design Name: tb
// Module Name: ba_seq_control
// Module Name: ba_seq_control
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description: receive basequence, save to bram  and then control data out
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb();
	reg clk;
	reg rst;
	reg start_en;
	reg basequence_valid_0;
	reg [31:0] basequence_0;
	reg basequence_valid_1;
	reg [31:0] basequence_1;
	reg in_valid;
	reg uci_intra_fr_hop;
	reg [2:0] nfs_0;
	reg [2:0] nfs_1;
	reg nfs_valid;
	wire basequence_out_valid;
	wire [31:0] basequence_out;
	integer i=0;
	// call instance
	ba_seq_control ba_seq_control0 (clk, rst, basequence_valid_0, basequence_0, basequence_valid_1, 
									basequence_1, in_valid, uci_intra_fr_hop, nfs_0, nfs_1, nfs_valid, start_en, basequence_out_valid, basequence_out);
	//create rst and initial all signals
	initial begin
		clk = 0;
		rst = 1;
		basequence_valid_0 = 0;
		basequence_0 = 0;
		basequence_valid_1 = 0;
		basequence_1 = 0;
		in_valid = 0;
		uci_intra_fr_hop = 0;
		nfs_0 = 0;
		nfs_1 = 0;
		nfs_valid = 0;
		start_en = 0;
	#50	rst =0;
	end
	//create clock
	always #0.5 clk=!clk;
	
	// create other signals
	initial begin
		wait(!rst)
		@(posedge clk) begin
			basequence_valid_0 <= 0;
			basequence_0 <= 0;
			basequence_valid_1 <= 0;
			basequence_1 <= 0;
			in_valid <= 1;
			uci_intra_fr_hop <= 0;
			nfs_0 <= 7;
			nfs_1 <= 7;
			nfs_valid <= 1;
			start_en <= 0;
		end
		for (i=0;i<12;i=i+1) begin
			@(posedge clk) begin
				basequence_valid_0 <= 1;
				basequence_0 <= i;
				basequence_valid_1 <= 1;
				basequence_1 <= i;
				in_valid <= 0;
				uci_intra_fr_hop <= 0;
				nfs_0 <= 0;
				nfs_1 <= 0;
				nfs_valid <= 0;
				start_en <= 0;
			end
		
		end
		@(posedge clk) begin
			basequence_valid_0 <= 0;
			basequence_0 <= 0;
			basequence_valid_1 <= 0;
			basequence_1 <= 0;
			nfs_0 <= 0;
			nfs_1 <= 0;
			nfs_valid <= 0;
			start_en <= 1;
		end
		@(posedge clk) begin
			basequence_valid_0 <= 0;
			basequence_0 <= 0;
			basequence_valid_1 <= 0;
			basequence_1 <= 0;
			nfs_0 <= 0;
			nfs_1 <= 0;
			nfs_valid <= 0;
			start_en <= 0;
		end
	end

	
endmodule
