`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/10/2026 06:21:12 PM
// Design Name: mean_data
// Module Name: mean_data
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  mean the power of dmrs and uci
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
	reg [3:0] uci_nsymbol;
	reg despread_uci_valid;
	reg [31:0] despread_uci;
	reg despread_dmrs_valid;
	reg [31:0] despread_dmrs;
	wire o_mean_data_valid;
	wire [31:0] o_mean_data;
	wire noise_power_valid;
	wire [31:0] noise_power;
	wire  sinr_valid;
	wire [31:0] sinr;

	
	integer i=0;
	//call instance
	mean_data mean_data(clk, rst, in_valid, uci_nsymbol,  despread_uci_valid, despread_uci, despread_dmrs_valid, 
						despread_dmrs, o_mean_data_valid, o_mean_data, sinr_valid, sinr);
	// create rst and initial other signals
	initial begin
		rst=1;
		clk=0;
		in_valid=0;
		uci_nsymbol=0;
		despread_uci_valid=0;
		despread_uci=0;
		despread_dmrs_valid=0;
		despread_dmrs=0;
	#50 rst=0;
	end
	// create clock
	always #0.5 clk=!clk;
	//initial other signals
	initial begin
		wait(!rst)
		@(posedge clk) begin
			in_valid <=1;
			uci_nsymbol <=14;
			despread_uci_valid <= 0;
			despread_uci <= 0;
			despread_dmrs_valid <= 0;
			despread_dmrs <= 0;
		end
		@(posedge clk) begin
			in_valid <=0;
			uci_nsymbol <=0;
			despread_uci_valid <= 0;
			despread_uci <= 0;
			despread_dmrs_valid <= 0;
			despread_dmrs <= 0;
		end
		for (i=0;i<84;i=i+1)
			@(posedge clk) begin
				despread_uci_valid <= 1;
				despread_uci[31:16] <= 32767;
				despread_uci[15:0] <= 0;
				despread_dmrs_valid <= 1;
				despread_dmrs [31:16] <= 32767;
				despread_dmrs [15:0] <= 0;
			end
		@(posedge clk) begin
			despread_uci_valid <= 0;
			despread_uci <= 0;
			despread_dmrs_valid <= 0;
			despread_dmrs <= 0;
		end
	end
endmodule

