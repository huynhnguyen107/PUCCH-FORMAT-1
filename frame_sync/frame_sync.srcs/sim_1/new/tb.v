`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2025 05:54:52 PM
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb(
    );
	reg clk, rst, in_start_symbol;
	wire [4:0] slot_idx;
	wire      start_slot;
	wire [3:0] sub_idx;
	wire [8:0] rb_idx;
	wire [3:0] sym_idx;
	wire start_symbol;
	wire [7:0] frame_idx;
	wire     start_frame;
	wire [8:0] cp;
	wire  valid;
	integer i, j, slot;
	// instance frame synchronozation
	frame_sync frame_sync_0(clk, rst, in_start_symbol, slot_idx, start_slot, sub_idx, 
							rb_idx, sym_idx, start_symbol, frame_idx, start_frame, cp, valid
								);
	//init rst, clk, in_start_symbol
	initial begin
		clk =0;
		rst =1;
		in_start_symbol =0;
		#50 rst =0;
	end
	// clock
	always #0.5 clk =~clk;
	//in_start_symbol (symbol 0 has 4448 cycles; from 1-13 have 4384 cycles  )
	initial begin
		wait (!rst)
		for (slot=0; slot<21; slot=slot+1) begin
			@(posedge clk) in_start_symbol <=1;
			@(posedge clk) in_start_symbol <=0;
			for (i=0; i< 4448-2; i=i+1)
				@(posedge clk);
			for (j=1; j<14; j=j+1) begin
				@(posedge clk) in_start_symbol <=1;
				@(posedge clk) in_start_symbol <=0;
				for (i=0; i<4384-2; i=i+1)
					@(posedge clk);
			end
		end
	end
endmodule
