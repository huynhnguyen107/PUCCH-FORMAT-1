`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/22/2025 06:13:39 PM
// Design Name: phi_matrix
// Module Name: tb
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


module tb( );
	reg clk;
	reg rst;
	reg in_valid;
	reg [4:0] u;
	wire out_valid;
	wire signed [2:0] phi;
	//call instance
	phi_matrix phi_matrix_0 (clk, rst, in_valid, u, out_valid, phi);
	// create rst and initial others
	initial begin
		clk =0;
		rst =1;
		in_valid =0;
		u =0;
		#500 rst =0;
	end
	//create clock
	always #0.5 clk =!clk;
	//create others
	initial begin
		wait (!rst)
		@(posedge clk) begin
			in_valid <=1;
			u <=6;
		end
		@(posedge clk) begin
			in_valid <=0;
			u <=0;
		end
	end
	
	
	
endmodule

