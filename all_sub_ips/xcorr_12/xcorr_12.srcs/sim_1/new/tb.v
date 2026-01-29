`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/25/2025 03:16:07 PM
// Design Name: tb
// Module Name: xcorr_12
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  correlation 12 samples a and b
// r[k]<=∑a[n]⋅b[n−k], m<=0-11, k<=-11 - +11
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
	reg [31:0] a;
	reg [15:0] ai;
	reg [31:0] b;
	wire out_valid;
	wire [41 :0] out;
	integer i;
	xcorr_12 xcorr_12_0 (clk, rst, in_valid, a, b, out_valid, out);
	//create rst and initial signals
	initial begin
		clk =0;
		rst =1;
		in_valid =0;
		a =0;
		b =0;
		#50 rst=0;
	end
	//create clock
	always #0.5 clk <=!clk;
	// create other signals
	initial begin
		wait(!rst)
		for (i=1;i<=12;i=i+1)
			@(posedge clk) begin
				in_valid <=1;
				ai=1638*i;
				a <= {ai, ai};
				b <={16'd16384, 16'd0};
			end
		@(posedge clk) begin
			in_valid <=0;
			a <=0;
			b <=0;
		end
		for (i=0;i<12;i=i+1)
			@(posedge clk);
		for (i=1;i<=12;i=i+1)
			@(posedge clk) begin
				in_valid <=1;
				a <={16'd16384, 16'd16384};
				b <={16'd16384, 16'd0};
			end
		@(posedge clk) begin
			in_valid <=0;
			a <=0;
			b <=0;
		end
	end
endmodule
