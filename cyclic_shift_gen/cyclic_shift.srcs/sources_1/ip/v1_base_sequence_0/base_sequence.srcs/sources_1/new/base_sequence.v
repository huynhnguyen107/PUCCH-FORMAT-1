`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/17/2025 03:16:07 PM
// Design Name: base sequence
// Module Name: base_sequence
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  base sequence generation
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module base_sequence(
	input clk,
	input rst,
	input in_valid,
	input [4:0] uci_slot,
	input [1:0] uci_grouphopping,
	input [10:0] uci_nID,
	input uci_nhop,
	output reg [31:0] base_sequence,
	output  base_sequence_valid
    );
	reg neither_valid;
	reg disable_valid;
	reg enable_valid;
	reg [5:0] mark_p;
	//neither
	wire out_valid_neither;
	wire [4:0] fss;//modulo(nid, 30) same for neither, disable, enable
	wire [5:0] enable_cinit;// floor nid/30
	//enable
	wire enable_scramble_valid;
	wire [7:0] enable_scramble;
	wire  enable_f_gh_valid;
	wire [4:0] enable_f_gh;
	//disable
	wire [12:0] disable_cinit;// c_init = 2^5 * floor(n_id/30) + mod(n_id,30);
	wire  disable_cinit_valid;// c_init = 2^5 * floor(n_id/30) + mod(n_id,30);
	wire disable_c;
	wire valid_disable_c;
	//final 
	wire [4:0] fgh;
	wire v;
	wire grouphopping_valid;
	// calculate u
	wire [5:0] total_f;
	wire [4:0] u;
	wire u_valid;
	// find phi
	wire phi_valid;
	wire [2:0]  phi;
	// uci_grouphopping selection
	always @(posedge clk)
		if (rst) begin
			neither_valid <=0;
			disable_valid <=0;
			enable_valid <=0;
		end 
		else begin
			if (in_valid) begin
				neither_valid <= uci_grouphopping==0;
				disable_valid <= uci_grouphopping==2;
				enable_valid <= uci_grouphopping==1;
			end
			
		end
	//mark p =slot_index +nhop
	always @(posedge clk)
		if (rst) begin
			mark_p <=0;
		end 
		else begin
			if (in_valid)
				mark_p <= (uci_slot<<1) + uci_nhop ;
		end
	// neither 
	// f_gh = 0;
	// f_ss = mod(n_id,30);
	// v = 0;
	modulo_30_0 modulo_30_0 (
	  .clk(clk),              // input wire clk
	  .rst(rst),              // input wire rst
	  .in_valid(in_valid),    // input wire in_valid
	  .in(uci_nID),                // input wire [10 : 0] in
	  .out_valid(out_valid_neither),  // output wire out_valid
	  .quotient(enable_cinit),    // output wire [5 : 0] quotient
	  .remainder(fss)  // output wire [4 : 0] remainder
	);
	//enable 
	// c_init = floor(n_id/30);
	// c = scramble_sequence_generate(c_init, 8*(markP+1));
	// f_gh = mod(bi2de(c(8*markP + 1 + (0:7)),'right-msb'),30);
	// f_ss = mod(n_id,30);
	// v = 0;
	scramble_sequence_8bits_0 scramble_sequence_8bits_0 (
	  .clk(clk),              // input wire clk
	  .rst(rst),              // input wire rst
	  .in_valid(out_valid_neither),    // input wire in_valid
	  .ID({25'd0, enable_cinit}),                // input wire [30 : 0] ID
	  .markP({25'd0, mark_p}),          // input wire [30 : 0] markP
	  .out_valid(enable_scramble_valid),  // output wire out_valid
	  .scramble(enable_scramble)    // output wire [7 : 0] scramble
	);
	//modulo enable_scramble with 30
	modulo_30_1 modulo_30_1 (
	  .clk(clk),              // input wire clk
	  .rst(rst),              // input wire rst
	  .in_valid(enable_scramble_valid),    // input wire in_valid
	  .in({3'd0, enable_scramble}),                // input wire [10 : 0] in
	  .out_valid(enable_f_gh_valid),  // output wire out_valid
	  .quotient(),    // output wire [5 : 0] quotient
	  .remainder(enable_f_gh)  // output wire [4 : 0] remainder
	);
	//disable
	// f_gh = 0;
	// f_ss = mod(n_id,30);
	// c_init = 2^5 * floor(n_id/30) + mod(n_id,30);
	// c = scramble_sequence_generate(c_init, markP + 1);
	// v = c(markP + 1);
	//c_init
	assign disable_cinit = (enable_cinit<<5) + fss;
	assign disable_cinit_valid = out_valid_neither;
	// find disable c
	scramble_sequence_1bit_0 scramble_sequence_1bit_0 (
	  .clk(clk),              // input wire clk
	  .rst(rst),              // input wire rst
	  .in_valid(disable_cinit_valid),    // input wire in_valid
	  .ID({18'd0, disable_cinit}),                // input wire [30 : 0] ID
	  .markP({25'd0, mark_p}),          // input wire [30 : 0] markP
	  .out_valid(valid_disable_c),  // output wire out_valid
	  .scramble(disable_c)    // output wire scramble
	);
	//selection uci_grouphopping
	// fss is the same for all cases line 86
	assign grouphopping_valid = enable_f_gh_valid;
	assign fgh = enable_valid ? enable_f_gh:0;
	assign v = disable_valid ? disable_c:0;
	// calculate u
	assign total_f = fss + fgh;
	modulo_30_2 modulo_30_2 (
	  .clk(clk),              // input wire clk
	  .rst(rst),              // input wire rst
	  .in_valid(grouphopping_valid),    // input wire in_valid
	  .in({5'd0, total_f}),                // input wire [10 : 0] in
	  .out_valid(u_valid),  // output wire out_valid
	  .quotient(),    // output wire [5 : 0] quotient
	  .remainder(u)  // output wire [4 : 0] remainder
	);
	//find phi
	phi_matrix_0 phi_matrix_0 (
	  .clk(clk),              // input wire clk
	  .rst(rst),              // input wire rst
	  .in_valid(u_valid),    // input wire in_valid
	  .u(u),                  // input wire [4 : 0] u
	  .out_valid(phi_valid),  // output wire out_valid
	  .phi(phi)              // output wire [2 : 0] phi
	);
	// QPSK modulation
	always @(*) begin
		case (phi)
			3'b001: begin//1
				base_sequence [15:0] = 16'd23170;//0.7
				base_sequence [31:16] = 16'd23170;//0.7
			end
			3'b111: begin//-1
				base_sequence [15:0] = 16'd23170;//0.7
				base_sequence [31:16] = 16'd65536 -16'd23170;//-0.7
			end
			3'b011: begin//3
				base_sequence [15:0] = 16'd65536 -16'd23170;//-0.7
				base_sequence [31:16] = 16'd23170;//0.7
			end
			3'b101: begin//-3
				base_sequence [15:0] = 16'd65536 -16'd23170;//-0.7
				base_sequence [31:16] = 16'd65536 -16'd23170;//-0.7
			end
			default: begin
				base_sequence [15:0] = 16'd23170;
				base_sequence [31:16] = 16'd23170;
			end
		endcase
	end
	assign base_sequence_valid = phi_valid;
endmodule

