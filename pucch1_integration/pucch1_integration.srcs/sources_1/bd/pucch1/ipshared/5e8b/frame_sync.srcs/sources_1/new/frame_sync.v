`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 11/24/2025 05:24:50 PM
// Design Name: 
// Module Name: Frame Synchronization
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  Frame Synchronization
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module frame_sync(
	input clk,
	input rst,
	input in_start_symbol,
	output [4:0] slot_idx,
	output      start_slot,
	output [3:0] sub_idx,
	output [8:0] rb_idx,
	output [3:0] sym_idx,
	output start_symbol,
	output [7:0] frame_idx,
	output     start_frame,
	output [11:0] cp,
	output  valid_out
    );
	//extend definitions
	wire ext_valid_2376;
	//subcarier definitions
	wire [3:0] sub_index;
	wire [3:0] sub_index_d;
	wire  sub_index_en;
	//resource blocks definitions
	wire [8:0] rb_index;
	wire [8:0] rb_index_d;
	wire  rb_index_en;
	//Symbol definitions
	wire start_symbol_d;
	wire [3:0] symbol_index;
	wire [3:0] symbol_index_d;
	wire  symbol_index_en;
	// slot definitions
	wire start_slot_d;
	wire [4:0] slot_index;
	wire [4:0] slot_index_d;
	wire  slot_index_en;
	// frame definitions
	wire start_frame_d;
	wire [7:0] frame_index;
	wire [7:0] frame_index_d;
	wire  frame_index_en;
	// extend 273*12 cycles-1 slot withou cp
	extend_valid extend_valid_v0(clk, rst, in_start_symbol, 13'd3276, ext_valid_2376);
	//valid-->delay 6 cycle
	delay_N #(6, 1) delay_N_0(clk, rst, ext_valid_2376, valid_out);
	//Subcarrier_Index 0-11
	des_cnt #(4) des_cnt_sub (clk, rst, ext_valid_2376, 4'd11, sub_index_en, sub_index);
	delay_N #(5, 4) delay_N_sub(clk, rst, sub_index, sub_index_d);
	//Resouce blocks 0-272
	des_cnt #(9) des_cnt_rb (clk, rst, sub_index_en, 9'd272, rb_index_en, rb_index);
	delay_N #(5, 9) delay_N_rb(clk, rst, rb_index, rb_index_d);
	//Symbol 0-13
	delay_N #(6, 1) delay_N_sym1(clk, rst, rb_index_en, start_symbol_d);
	des_cnt #(4) des_cnt_sym (clk, rst, rb_index_en, 4'd13, symbol_index_en, symbol_index);
	delay_N #(5, 4) delay_N_sym(clk, rst, symbol_index, symbol_index_d);
	// slot 0-19
	delay_N #(6, 1) delay_N_slot(clk, rst, symbol_index_en, start_slot_d);
	des_cnt #(5) des_cnt_slot (clk, rst, symbol_index_en, 5'd19, slot_index_en, slot_index);
	delay_N #(5, 5) delay_N_slot1(clk, rst, slot_index, slot_index_d);
	// frame 0-255
	des_cnt #(8) des_cnt_frame (clk, rst, slot_index_en, 8'd255, frame_index_en, frame_index);
	delay_N #(5, 8) delay_N_frame(clk, rst, frame_index, frame_index_d);
	delay_N #(6, 1) delay_N_frame1(clk, rst, frame_index_en, start_frame_d);
	// create cp
	assign cp = sym_idx==0 ? 9'd352 : 9'd288;
	//assign outputs
	//slot
	assign slot_idx =  slot_index_d;
	assign start_slot = start_slot_d;
	//subcarier
	assign sub_idx =  sub_index_d;
	//assign start_slot = start_slot_d;
	//resouce blocks
	assign rb_idx =  rb_index_d;
	// assign start_rb = rb_index_en;
	//symbol
	assign sym_idx =  symbol_index_d;
	assign start_symbol = start_symbol_d;
	//frame
	assign frame_idx =  frame_index_d;
	assign start_frame = start_frame_d;

	
endmodule

//descreased module
module des_cnt #(parameter WIDTH=8) (
			input clk,
			input rst,
			input valid_in,
			input [WIDTH-1:0] in,
			output en_out,
			output [WIDTH-1:0] index_out
			);
	reg [WIDTH-1:0] cnt;
	//counter control
	always @(posedge clk)
		if (rst) begin
			cnt <= 0;
		end else begin
			if (valid_in)
				cnt <= cnt==in ? 0: cnt+1;
		end
	assign index_out = (cnt==0)? in : cnt-1;
	assign en_out = (cnt ==0) & valid_in;
endmodule

//delay module
module delay_N #(parameter N=10, WIDTH=16)(
			input clk,
			input rst,
			input [WIDTH-1:0] in,
			output [WIDTH-1:0] out
				);
	reg [WIDTH-1:0] delay_reg [0:N-1];
	integer i;
	always @(posedge clk)
		if (rst) 
			for (i=0; i<N; i=i+1)
				delay_reg [i] <= 0;
		else begin	
			delay_reg[0] <= in;
			for (i=1; i<N; i=i+1)
				delay_reg [i] <= delay_reg [i-1];
		end
	assign out = delay_reg [N-1];
			
endmodule

module extend_valid (
		input clk,
		input rst,
		input i_pulse,
		input [12:0] N,
		output o_valid
	);
	reg [12:0] cnt;
	reg  valid;
	always @(posedge clk)
		if (rst) begin
			cnt <= 0;
			valid <= 0;
		end
		else begin
			if (i_pulse & cnt < N-2)
				valid <= 1;
			else if (cnt >= N-2)
				valid <= 0;
			if (valid)
				cnt <= cnt +1 ;
			else if (cnt >= N-2)
				cnt <= 0;
		end
			
	assign o_valid = valid|i_pulse;
endmodule