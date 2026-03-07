`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/07/2026 05:33:05 PM
// Design Name: tb
// Module Name: wise_spreading
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  testbech for wise_spreading matrix for cyclic shift
// 
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
	reg [3:0] uci_OCC;
	reg nfs_valid;
	reg [2:0] nfs;
	reg enable;
	wire wi_seq_valid;
	wire [31:0] wi_seq;
	//call instance
	wise_spreading wise_spreading_0(clk, rst, in_valid, uci_OCC, nfs_valid, nfs, enable, wi_seq_valid, wi_seq);
	// create rst and initial other signals
	initial begin
		rst=1;
		clk=0;
		in_valid=0;
		uci_OCC=0;
		nfs_valid=0;
		nfs=0;
		enable=0;
	#50 rst=0;
	end
	// create clock
	always #0.5 clk=!clk;
	//initial other signals
	initial begin
		wait(!rst)
		@(posedge clk) begin
			in_valid <= 1;
			uci_OCC <= 1;
			nfs_valid <= 1;
			nfs <= 7;
			enable <= 0;
		end
		@(posedge clk) begin
			in_valid <= 0;
			uci_OCC <= 0;
			nfs_valid <= 0;
			nfs <= 0;
			enable <= 0;
		end
		@(posedge clk) begin
			in_valid <= 0;
			uci_OCC <= 0;
			nfs_valid <= 0;
			nfs <= 0;
			enable <= 1;
		end
		@(posedge clk) begin
			in_valid <= 0;
			uci_OCC <= 0;
			nfs_valid <= 0;
			nfs <= 0;
			enable <= 0;
		end
	end
endmodule
