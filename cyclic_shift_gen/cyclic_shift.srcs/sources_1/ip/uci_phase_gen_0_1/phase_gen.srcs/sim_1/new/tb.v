`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 02/25/2026 08:02:31 PM
// Design Name: tb
// Module Name: phase_generator
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  with Mzc=12, input u find phi
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
	reg [3:0] uci_m0;
	reg [3:0] uci_mcs;
	reg  n_cs_valid;
	reg  [7:0] ncs;
	wire phase_valid;
	wire [31:0] phase;
	integer i=0, k=0;
	//call instance
	phase_gen phase_gen0(clk, rst, in_valid, uci_m0, uci_mcs, n_cs_valid, ncs, phase_valid, phase  );
	// create rst and init all signals
	initial begin
		clk = 0;
		rst = 1;
		in_valid = 0;
		uci_m0 = 0;
		uci_mcs = 0;
		n_cs_valid = 0;
		ncs = 0;
		#50 rst =0;
	end
	//create clock
	always #0.5 clk=!clk;
	//create others
	initial begin
		wait(!rst)
		@(posedge clk) begin
			in_valid <= 1;
			uci_m0 <= 0;
			uci_mcs <= 0;
			n_cs_valid <= 0;
			ncs <= 0;
		end
		@(posedge clk) begin
			in_valid <= 0;
			uci_m0 <= 0;
			uci_mcs <= 0;
			n_cs_valid <= 0;
			ncs <= 0;
		end
		@(posedge clk) begin
			in_valid <= 0;
			uci_m0 <= 0;
			uci_mcs <= 0;
			n_cs_valid <= 0;
			ncs <= 0;
		end
		for (k=0;k<7;k=k+1) begin
			@(posedge clk) begin
				in_valid <= 0;
				uci_m0 <= 0;
				uci_mcs <= 0;
				n_cs_valid <= 1;
				ncs <= 88 + k*6;
			end
			for (i=0;i<12;i=i+1)
				@(posedge clk) begin
					in_valid <= 0;
					uci_m0 <= 0;
					uci_mcs <= 0;
					n_cs_valid <= 0;
					ncs <= 0;
				end
		end
	end
endmodule
