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


module phase_gen(
	input clk,
	input rst,
	input in_valid,
	input [3:0] uci_m0,
	input [3:0] uci_mcs,
	input n_cs_valid,
	input [7:0] ncs,
	output phase_valid,
	output [31:0] phase
	);

	// save to registers
	reg [3:0] reg_uci_m0;
	reg [3:0] reg_uci_mcs;
	reg [4:0] total_m;
	reg [8:0] pre_alpha;
	reg pre_alpha_valid;
	//find alpha
	wire [3:0] alpha;
	wire alpha_valid;
	// discrete alpha
	wire [7:0] dis_alpha;
	wire dis_alpha_valid;
	//discrete alpha modulo 12
	wire [3:0] nomal_alpha;
	wire nomal_alpha_valid;
	//mapping to I, Q 
	reg [15:0] I;
	reg [15:0] Q;
	//alpha = 2 * pi / 12 * mod(m0 + m_cs + n_cs, 12);
	always @(posedge clk)
		if (rst) begin
			reg_uci_m0 <= 0;
			reg_uci_mcs <= 0;
			total_m <= 0;
			pre_alpha <= 0;
			pre_alpha_valid <= 0;
		end
		else begin
			if (in_valid) begin
				reg_uci_m0 <= uci_m0;
				reg_uci_mcs <= uci_mcs;
			end
			if (n_cs_valid) begin
				pre_alpha <= ncs + total_m;
			end
			total_m <= 	reg_uci_m0 + reg_uci_mcs;
			pre_alpha_valid <= n_cs_valid;
			
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


