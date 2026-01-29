`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/28/2025 09:47:07 PM
// Design Name: tb
// Module Name: physical_control
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  receive 0.5ms to synchronize for Layer 1 
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
	reg in_0_5ms;
	reg stop_request_trigger;
	integer i=0;
	// call instance
	physical_control physical_control_0 (clk, rst, in_0_5ms, stop_request_trigger);
	// create rst and inital others
	initial begin
		clk = 0;
		rst = 1;
		in_0_5ms = 0;
		stop_request_trigger = 0;
		#50 rst =0;
	end
	// create clock
	always #0.5 clk = !clk;
	//create others
	initial begin
		wait (!rst)
		//start trigger 0.5
		@(posedge clk) begin
			in_0_5ms <=1;
		end
		@(posedge clk) begin
			in_0_5ms <=0;
		end
		for (i=0; i<500-1;i=i+1)
			@(posedge clk);
		// stop request
		@(posedge clk) begin
			stop_request_trigger <=1;
		end
		@(posedge clk) begin
			stop_request_trigger <=0;
		end
		for (i=0; i<500-1;i=i+1)
			@(posedge clk);
			
			
		@(posedge clk) begin
			in_0_5ms <=1;
		end
		for (i=0; i<61440-1;i=i+1)
			@(posedge clk) begin
				in_0_5ms <=0;
			end
		@(posedge clk) begin
			in_0_5ms <=1;
		end
		for (i=0; i<61440-1;i=i+1)
			@(posedge clk) begin
				in_0_5ms <=0;
			end
	end
endmodule
