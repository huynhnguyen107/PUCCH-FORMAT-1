`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/23/2025 08:02:31 PM
// Design Name: phase_generator
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


module phase_generator(
	input clk,
	input rst,
	input in_valid,
	input [10:0] uci_NID,
	input [4:0] uci_slot,
	input [3:0] uci_first_symbol,
	input  uci_sym_alloc,
	input [3:0] uci_m0,
	input [1:0] uci_ack,
	output phase_valid,
	output [31:0] phase
	);

	// calculate n_cs
	reg [10:0] reg_uci_NID;
	reg [4:0] reg_uci_slot;
	reg [3:0] reg_uci_first_symbol;
	reg  reg_uci_sym_alloc;
	reg [3:0] reg_uci_m0;
	reg [1:0] reg_uci_ack;
	reg [9:0] seq_start;
	reg [8:0] slot_value;
	reg [4:0] symbol_value;
	reg d_in_valid;
	reg d2_in_valid;
	reg d3_in_valid;
	wire [7:0] n_cs;
	wire  n_cs_valid;
	//find alpha
	reg [4:0] total_m0_mcs;
	reg total_m0_mcs_valid;
	reg [8:0] pre_alpha;
	reg  pre_alpha_valid;
	wire [3:0] alpha;
	wire alpha_valid;
	reg [7:0] reg_n_cs;
	//m_cs
	wire m_cs_valid;
	wire [3:0] m_cs;

	// discrete ahpha
	wire [7:0] dis_alpha;
	wire  dis_alpha_valid;
	//nomalize discrete alpha
	wire [3:0] nomal_alpha;
	wire  nomal_alpha_valid;
	// mapping I, Q
	reg [15:0] I;
	reg [15:0] Q;
	// save input to register
	always @(posedge clk)
		if (rst) begin
			reg_uci_NID <= 0;
			reg_uci_slot <= 0;
			reg_uci_first_symbol <= 0;
			reg_uci_sym_alloc <= 0;
			reg_uci_m0 <= 0;
			reg_uci_ack <= 0;
			seq_start <= 0;
			slot_value <= 0;
			symbol_value <= 0;
			d_in_valid <= 0;
			d2_in_valid <= 0;
			d3_in_valid <= 0;
		end
		else begin
			if (in_valid) begin
				reg_uci_slot <= uci_slot;
				reg_uci_first_symbol <= uci_first_symbol;
				reg_uci_sym_alloc <= uci_sym_alloc;
				reg_uci_m0 <= uci_m0;
				reg_uci_ack <= uci_ack;
				reg_uci_NID <= uci_NID;
			end
			slot_value <= (reg_uci_slot << 3) + (reg_uci_slot << 2) + (reg_uci_slot << 1);
			symbol_value <= reg_uci_first_symbol + reg_uci_sym_alloc;
			seq_start <= slot_value + symbol_value;
			d_in_valid <= in_valid;
			d2_in_valid <= d_in_valid;
			d3_in_valid <= d2_in_valid;
		end
	//scramble the value of seq_start to find n_cs
	scramble_sequence_8bits_0 scramble_sequence_8bits_0 (
	  .clk(clk),              // input wire clk
	  .rst(rst),              // input wire rst
	  .in_valid(d3_in_valid),    // input wire in_valid
	  .ID({20'd0, reg_uci_NID}),                // input wire [30 : 0] ID
	  .markP({21'd0, seq_start}),          // input wire [30 : 0] markP
	  .out_valid(n_cs_valid),  // output wire out_valid
	  .scramble(n_cs)    // output wire [7 : 0] scramble
	);
	//ack selection with valid out 12 cycles per time (the total valid out is 12)
	ack_selection ack_selection0 (clk, rst, n_cs_valid, reg_uci_ack, m_cs_valid, m_cs);
	//find alpha
	//alpha = 2 * pi / 12 * mod(m0 + m_cs + n_cs, 12);
	always @(posedge clk)
		if (rst) begin
			reg_n_cs <= 0;
			total_m0_mcs <= 0;
			total_m0_mcs_valid <= 0;
			pre_alpha <= 0;
			pre_alpha_valid <= 0;
		end
		else begin
			if (n_cs_valid)
				reg_n_cs <= n_cs;
			if (m_cs_valid) begin
				total_m0_mcs <= reg_uci_m0 + m_cs;
			end
			total_m0_mcs_valid <= m_cs_valid;
			if (total_m0_mcs_valid) begin
				pre_alpha <= total_m0_mcs +  reg_n_cs;
			end
			pre_alpha_valid <= total_m0_mcs_valid;
			
		end
	// modulo 12
	alpha_modulo_12_0 alpha_modulo_12_0 (
	  .clk(clk),              // input wire clk
	  .rst(rst),              // input wire rst
	  .in_valid(pre_alpha_valid),    // input wire in_valid
	  .in(pre_alpha),                // input wire [8 : 0] in
	  .out_valid(alpha_valid),  // output wire out_valid
	  .quotient(),    // output wire [5 : 0] quotient
	  .remainder(alpha)  // output wire [3 : 0] remainder
	);
	// discrete alpha
	dis_alpha_gen_0 dis_alpha_gen_0 (
	  .clk(clk),                          // input wire clk
	  .rst(rst),                          // input wire rst
	  .in_valid(alpha_valid),                // input wire in_valid
	  .alpha(alpha),                      // input wire [3 : 0] alpha
	  .dis_alpha_valid(dis_alpha_valid),  // output wire dis_alpha_valid
	  .dis_alpha(dis_alpha)              // output wire [7 : 0] dis_alpha
	);
	//discrete alpha modulo 12
	modulo_12_1_nomalize modulo_12_1_nomalize (
	  .clk(clk),              // input wire clk
	  .rst(rst),              // input wire rst
	  .in_valid(dis_alpha_valid),    // input wire in_valid
	  .in({1'b0, dis_alpha}),                // input wire [8 : 0] in
	  .out_valid(nomal_alpha_valid),  // output wire out_valid
	  .quotient(),    // output wire [5 : 0] quotient
	  .remainder(nomal_alpha)  // output wire [3 : 0] remainder
	);
	//mapping to I, Q fixed point 16.14 because [-1:1]
	always @(*) begin
		case (nomal_alpha)
			4'd0: begin
				I = 16'd16384;
				Q = 16'd0;
			end
			4'd1: begin
				I = 16'd14188;
				Q = 16'd8192;
			end
			4'd2: begin
				I = 16'd8192;
				Q = 16'd14188;
			end
			4'd3: begin
				I = 16'd0;
				Q = 16'd16384;
			end
			4'd4: begin
				I = 16'd57344;
				Q = 16'd14188;
			end
			4'd5: begin
				I = 16'd51347;
				Q = 16'd8192;
			end
			4'd6: begin
				I = 16'd49152;
				Q = 16'd0;
			end
			4'd7: begin
				I = 16'd51347;
				Q = 16'd57344;
			end
			4'd8: begin
				I = 16'd57344;
				Q = 16'd51347;
			end
			4'd9: begin
				I = 16'd0;
				Q = 16'd49152;
			end
			4'd10: begin
				I = 16'd8192;
				Q = 16'd51347;
			end
			4'd11: begin
				I = 16'd14188;
				Q = 16'd57344;
			end
			default: begin
				I = 16'd0;
				Q = 16'd0;
			end
		endcase
	end
	assign phase = {Q, I};
	assign phase_valid = nomal_alpha_valid;
endmodule


//select ack with input uci_ack
//							msc   ack
//sequence_cs_1_harq_ack = [0 6;  0 1]
//sequence_cs_1_harq_ack_positive_sr = [3 9;  0 1]; %positive SR
//2 harq
//sequence_cs_2_harq_ack = [0 3 9 6; 0 0 1 1; 0 1 0 1]; % SR negative ,4 bits ACK
//sequence_cs_2_harq_ack_positive_sr = [1 4 10 7; 0 0 1 1; 0 1 0 1]; 
//ack=1--->mcs 0 6 3 9 0 0 0  0 //fill 4 0 to fix to the max is 8 mcs
//ack=2--->mcs 0 3 9 6 1 4 10 7
module ack_selection(
	input clk,	
	input rst,	
	input in_valid,	
	input [1:0] uci_ack,	
	output out_valid,	
	output  [3:0] m_cs	
	);
	reg valid;
	reg [1:0] reg_uci_ack;
	reg [6:0] cnt_96;
	reg [3:0] cnt_12;
	reg [2:0] cnt_8;
	reg [3:0] m_cs1;
	reg [3:0] m_cs2;
	always @(posedge clk) begin
		if (rst) begin
			valid <= 0;
			reg_uci_ack <= 0;
			cnt_8 <= 0;
			cnt_12 <= 0;
			cnt_96 <= 0;
		end
		else begin
		// make valid 96b cycles
			if (in_valid) 
				reg_uci_ack <= uci_ack;
			if (in_valid) 
				valid <= 1;
			else if (cnt_96 >= 95)
				valid <= 0;
			if (valid)	
				cnt_96 <= cnt_96 +1;
			else
				cnt_96 <= 0;
		// valid out per 12 cycles
			if (valid)
				cnt_12 <= (cnt_12==11) ? 0: cnt_12+1;
		// for find mcs
			if (cnt_12==0 & valid)
				cnt_8 <= cnt_8 +1;
			else if (cnt_96 >= 95)
				cnt_8 <= 0;
		end
	end
	always @(*) begin
		case (cnt_8)
			4'd0: m_cs1 = 0;
			4'd1: m_cs1 = 6;
			4'd2: m_cs1 = 3;
			4'd3: m_cs1 = 9;
			4'd4: m_cs1 = 0;
			4'd5: m_cs1 = 0;
			4'd6: m_cs1 = 0;
			4'd7: m_cs1 = 0;
			default: m_cs1 = 0;
		endcase
	end
	always @(*) begin
		case (cnt_8)
			4'd0: m_cs2 = 0;
			4'd1: m_cs2 = 3;
			4'd2: m_cs2 = 9;
			4'd3: m_cs2 = 6;
			4'd4: m_cs2 = 1;
			4'd5: m_cs2 = 4;
			4'd6: m_cs2 = 10;
			4'd7: m_cs2 = 7;
			default: m_cs1 = 0;
		endcase
	end
	assign m_cs = reg_uci_ack==1 ? m_cs1: m_cs2;
	assign out_valid = cnt_12==0 & valid;
endmodule