`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 02/23/2026 01:17:05 PM
// Design Name: 
// Module Name: n_cs_gen
// Project Name: cylic_shift_generator
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description: n_cs generator following to the number of symbols
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module n_cs_gen(
	input clk,
	input rst,
	input in_uci_flag,
	input in_valid,
	input [10:0] uci_NID,
	input [4:0] uci_slot,
	input [3:0] uci_first_symbol,
	input [3:0] uci_nSymbs,
	output  reg ncs_valid,
	output  [7:0] ncs
	);

	// calculate n_cs
	reg  reg_in_uci_flag;
	reg [10:0] reg_uci_NID;
	reg [4:0] reg_uci_slot;
	reg [3:0] reg_uci_first_symbol;
	reg [3:0] reg_uci_nSymbs;
	reg [3:0] reg_uci_m0;
	reg [1:0] reg_uci_ack;
	reg [9:0] seq_start;
	reg [8:0] slot_value;
	reg [4:0] symbol_value;
	reg d_in_valid;
	reg d2_in_valid;
	reg d3_in_valid;
	wire [7:0] ncs_tmp;
	wire  ncs_valid_tmp;
	//counter ncs_tmp
	reg [3:0] cnt_ncs_tmp;
	wire ncs_range;
	//save to FIFO
	wire [7:0] ncs_fifo;
	wire  ncs_valid_fifo;
	reg cnt_fifo_valid;
	reg [7:0] cnt_fifo;
	reg [3:0] cnt_read;
	wire [2:0] max_symbol;
	wire  rd_en_1;
	wire  rd_en_2;
	// save input to register
	always @(posedge clk)
		if (rst) begin
			reg_in_uci_flag <= 0;
			reg_uci_NID <= 0;
			reg_uci_slot <= 0;
			reg_uci_first_symbol <= 0;
			reg_uci_nSymbs <= 0;
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
				reg_in_uci_flag <= in_uci_flag;
				reg_uci_slot <= uci_slot;
				reg_uci_first_symbol <= uci_first_symbol;
				reg_uci_nSymbs <= uci_nSymbs;
				reg_uci_NID <= uci_NID;
			end
			slot_value <= (reg_uci_slot << 3) + (reg_uci_slot << 2) + (reg_uci_slot << 1);
			symbol_value <= reg_uci_first_symbol;
			seq_start <= slot_value + symbol_value;
			d_in_valid <= in_valid;
			d2_in_valid <= d_in_valid;
			d3_in_valid <= d2_in_valid;
		end

	//find seq_start basing on reg_uci_nSymbs
	
	//scramble the value of seq_start to find n_cs
	ncs_scra_seq_8 ncs_scra_seq_8 (
	  .clk(clk),              // input wire clk
	  .rst(rst),              // input wire rst
	  .in_valid(d3_in_valid),    // input wire in_valid
	  .ID({20'd0, reg_uci_NID}),                // input wire [30 : 0] ID
	  .markP({21'd0, seq_start}),          // input wire [30 : 0] markP
	  .out_valid(ncs_valid_tmp),  // output wire out_valid
	  .scramble(ncs_tmp)    // output wire [7 : 0] scramble
	);
	//counter ncs_tmp
	always @(posedge clk) begin
		if (rst) begin
			cnt_ncs_tmp <= 0;
		end 
		else begin
			if (ncs_valid_tmp) begin
					cnt_ncs_tmp <=  cnt_ncs_tmp + 1;
			end
			else 
				cnt_ncs_tmp <= 0;

		end
	end
	assign ncs_range = ncs_valid_tmp & cnt_ncs_tmp < reg_uci_nSymbs;
	// dmrs or uci
	assign ncs_valid_fifo = reg_in_uci_flag ? (ncs_range & cnt_ncs_tmp[0]) :(ncs_range & !cnt_ncs_tmp[0]);
	assign ncs_fifo = ncs_valid_fifo ? ncs_tmp : 0;
	// Save to FIFO and read once NCS, every 13 cycles.
	ncs_gen_fifo ncs_gen_fifo (
	  .clk(clk),      // input wire clk
	  .din(ncs_fifo),      // input wire [7 : 0] din
	  .wr_en(ncs_valid_fifo),  // input wire wr_en
	  .rd_en(rd_en_2),  // input wire rd_en
	  .dout(ncs),    // output wire [7 : 0] dout
	  .full(),    // output wire full
	  .empty()  // output wire empty
	);
	//find max symbols
	assign max_symbol = reg_in_uci_flag ? (reg_uci_nSymbs>>1):(reg_uci_nSymbs>>1)+reg_uci_nSymbs[0];
	assign rd_en_1 = (cnt_fifo==1)|(cnt_fifo==14)|(cnt_fifo==27)|(cnt_fifo==40)|(cnt_fifo==53)|(cnt_fifo==66)|(cnt_fifo==79);
	assign rd_en_2 = (cnt_read <max_symbol)&rd_en_1;
	//control rd_en
	always @(posedge clk) begin
		if (rst) begin
			cnt_fifo_valid <= 0;
			cnt_fifo <= 0;
			cnt_read <= 0;
			ncs_valid <= 0;
		end else begin
			if (ncs_valid_fifo) 
				cnt_fifo_valid <= 1;
			else if (cnt_fifo==81)
				cnt_fifo_valid <= 0;
				
			if (cnt_fifo_valid)
			    cnt_fifo <= (cnt_fifo==81) ? 0: cnt_fifo +1;
			if (rd_en_1)
				cnt_read <= cnt_read +1;
			else if (cnt_fifo==81)
				cnt_read <= 0;
			ncs_valid <= rd_en_2;
		end
	end
endmodule