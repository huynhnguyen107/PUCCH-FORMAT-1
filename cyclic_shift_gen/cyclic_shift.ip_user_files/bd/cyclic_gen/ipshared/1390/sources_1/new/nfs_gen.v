`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 02/27/2026 02:42:22 PM
// Design Name: n_fs generator
// Module Name: nfs_gen
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description: generate nfs for uci and dmrs
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module nfs_gen #(parameter MODE=1)(
	input clk,
	input rst,
	input in_valid,
	input [3:0] uci_nSymbs,
	input uci_intra_fr_hop,
	output [2:0] nfs_0,
	output [2:0] nfs_1,
	output nfs_valid
    );
	reg [2:0] nfs_no_intra_dmrs_0;
	reg [2:0] nfs_no_intra_dmrs_1;
	reg [2:0] nfs_no_intra_uci_0;
	reg [2:0] nfs_no_intra_uci_1;
	reg [2:0] nfs_intra_dmrs_0;
	reg [2:0] nfs_intra_dmrs_1;
	reg [2:0] nfs_intra_uci_0;
	reg [2:0] nfs_intra_uci_1;
	reg [2:0] reg_uci_intra_fr_hop;
	reg [2:0] d_in_valid;
	always @(posedge clk) begin
		if (rst) begin
			nfs_no_intra_dmrs_0 <=0;
			nfs_no_intra_dmrs_1 <=0;
			nfs_no_intra_uci_0 <=0;
			nfs_no_intra_uci_1 <=0;
			nfs_intra_dmrs_0 <=0;
			nfs_intra_dmrs_1 <=0;
			nfs_intra_uci_0 <=0;
			nfs_intra_uci_1 <=0;
			reg_uci_intra_fr_hop <=0;
			d_in_valid <=0;
		end else begin
			if (in_valid) begin
				//save reg_uci_intra_fr_hop
				reg_uci_intra_fr_hop <= uci_intra_fr_hop;
				//no hopping
				//uci
				nfs_no_intra_uci_0 <= uci_nSymbs>>1;
				nfs_no_intra_uci_1 <= uci_nSymbs>>1;
				//dmrs
				nfs_no_intra_dmrs_0 <= uci_nSymbs>>1 + uci_nSymbs[0];
				nfs_no_intra_dmrs_1 <= uci_nSymbs>>1 + uci_nSymbs[0];
				//hopping
				//uci
				nfs_intra_uci_0 <= uci_nSymbs[3:2];
				nfs_intra_uci_1 <= (uci_nSymbs==10|uci_nSymbs==11|uci_nSymbs==14) ? uci_nSymbs[3:2]+1:uci_nSymbs[3:2];
				//dmrs
				nfs_intra_dmrs_0 <= (uci_nSymbs==10|uci_nSymbs==11|uci_nSymbs==14) ? uci_nSymbs[3:2]+1:uci_nSymbs[3:2];
				nfs_intra_dmrs_1 <= (uci_nSymbs[1]) ? uci_nSymbs[3:2] : uci_nSymbs[3:2]+1;
			end
			d_in_valid <= in_valid;
		end
	end
	assign nfs_valid = d_in_valid;
	assign nfs_0 = (MODE==1) ? (reg_uci_intra_fr_hop ? nfs_intra_uci_0: nfs_no_intra_uci_0): (reg_uci_intra_fr_hop ? nfs_intra_dmrs_0: nfs_no_intra_dmrs_0);
	assign nfs_1 = (MODE==1) ? (reg_uci_intra_fr_hop ? nfs_intra_uci_1: nfs_no_intra_uci_1): (reg_uci_intra_fr_hop ? nfs_intra_dmrs_1: nfs_no_intra_dmrs_1);

	
endmodule
