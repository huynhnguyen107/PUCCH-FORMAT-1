`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/04/2026 07:42:04 PM
// Design Name: tb
// Module Name: phase_gen_control
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  save phase to fifo and wait until having start_en
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
	reg i_phase_valid;
	reg [31:0]i_phase;
	reg in_valid;
	reg [3:0] uci_nSymbs;
	reg in_uci_flag ;
	wire o_phase_valid;
	wire [31:0]o_phase;
	integer i=0, k=0;
	//call instance
	phase_gen_control phase_gen_control0(clk, rst, i_phase_valid, i_phase, in_valid, uci_nSymbs, in_uci_flag, o_phase_valid, o_phase);
	// create rst and initiak other signals'
	initial begin
		rst=1;
		clk=0;
		i_phase_valid=0;
		i_phase=0;
		in_valid=0;
		uci_nSymbs=0;
		in_uci_flag=0;
	#50 rst=0;
	end
	//create clock
	always #0.5 clk= !clk;
	//create other signals
	initial begin
		wait(!rst)
		@(posedge clk) begin
			i_phase_valid <= 0;
			i_phase <= 0;
			in_valid <= 1;
			uci_nSymbs <= 13;
			in_uci_flag <= 1;
		end
		for (k=0;k<7;k=k+1) begin
			for (i=0;i<12;i=i+1) begin
				@(posedge clk) begin
					i_phase_valid <= 1;
					i_phase[15:0] <= 1638*i;
					i_phase[31:16] <= 0;
					in_valid <= 0;
					uci_nSymbs <= 0;
					in_uci_flag <= 0;
				end
			end
			@(posedge clk) begin
				i_phase_valid <= 0;
				i_phase[15:0] <= 0;
				i_phase[31:16] <= 0;
				in_valid <= 0;
				uci_nSymbs <= 0;
				in_uci_flag <= 0;
			end
		end
	end
endmodule
