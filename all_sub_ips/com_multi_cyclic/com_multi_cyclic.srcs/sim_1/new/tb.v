`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/03/2026 07:42:03 PM
// Design Name: tb
// Module Name: com_mul_cyclic
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description: multiply basequence and phase gen
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
	reg basequence_valid;
	reg [31:0] basequence;
	reg phase_valid;
	reg [31:0] phase;//16.14
	wire cyclic_valid;
	wire [31:0] cyclic;//16.15
	integer i=0;
	//call instance
	com_mul_cyclic com_mul_cyclic_0 (clk, rst, basequence_valid, basequence, phase_valid, phase, cyclic_valid, cyclic);
	// create rst and initial other signals
	initial begin
		clk = 0;
		rst = 1;
		basequence_valid = 0;
		basequence = 0;
		phase_valid = 0;
		phase = 0;
	#50	rst =0;
	end
	//create clk
	always #0.5 clk = !clk;
	// create other signals
	initial begin
		for (i=0;i<12;i=i+1) begin
			@(posedge clk) begin
				basequence_valid <= 1;
				basequence[15:0] <= i*1638;//0.05*i=i*0.05*2^15
				basequence[31:16] <= i*1638;//0.05*i=i*0.05*2^15
				phase_valid <= 1;
				phase[15:0] <= 49152;//(-1=2^16-2^14)
				phase[31:16] <= 0;//(-1=2^16-2^14)
			end
		end
		@(posedge clk) begin
				basequence_valid <= 0;
				basequence <= 0;//0.05*i=i*0.05*2^15
				phase_valid <= 0;
				phase <= 0;//(-1=2^16-2^14)
			end
	end
endmodule
