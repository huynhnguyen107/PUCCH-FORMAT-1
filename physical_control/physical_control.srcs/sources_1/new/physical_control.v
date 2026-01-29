`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/28/2025 09:11:07 PM
// Design Name: physical_control
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


module physical_control(
	input clk, 
	input rst, 
	input in_0_5ms, 
	input stop_request_trigger, 
	output start_symbol
    );
	wire valid;
	wire enable_4448;
	wire enable_4384;
	reg [15:0] cnt_61440;
	reg [12:0] cnt_4448;
	reg [12:0] cnt_4384;
	reg valid_61440;
	reg valid_4448;

	always @(posedge clk)
		if (rst ) begin
			cnt_61440 <= 0;
			valid_61440 <= 0;
			cnt_4448 <= 0;
			valid_4448 <= 0;
			cnt_4384 <= 0;
		end
		else begin
			//counter 61440
			if (in_0_5ms)
				valid_61440 <= 1;
			else if (stop_request_trigger)
				valid_61440 <= 0;
			else if (cnt_61440>=61440-2)
				valid_61440 <= 0;
			if (valid_61440)
				cnt_61440 <= cnt_61440==61440-2 ? 0 : cnt_61440 +1;
			else
				cnt_61440 <=0;
			//counter 4448
			if (in_0_5ms)
				valid_4448 <= 1;
			else if (stop_request_trigger)
				valid_4448 <= 0;
			else if (cnt_4448>=4448-1)
				valid_4448 <= 0;
			if (valid_4448)
				cnt_4448 <= cnt_4448==4448-1 ? 0 : cnt_4448 +1;
			else
				cnt_4448 <=0;
			//counter 4384
			if (!valid_4448)
				cnt_4384 <= cnt_4384==4384-1 ? 0 : cnt_4384 +1;
			else if (stop_request_trigger)
				valid_4448 <= 0;
			else
				cnt_4384 <=0;
		end
	assign valid = in_0_5ms | valid_61440;
	assign enable_4448 = cnt_4448==4448-1;
	assign enable_4384 = cnt_4384==4384-1;
	assign start_symbol = valid & (in_0_5ms|enable_4448|enable_4384);

endmodule
