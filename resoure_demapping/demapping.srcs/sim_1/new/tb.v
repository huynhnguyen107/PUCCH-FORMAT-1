`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/23/2025 08:29:40 PM
// Design Name: Resource Demapping
// Module Name: mapping
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  tb
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb(
    );
	reg clk;
	reg rst;
	//uci from layer 2
	reg       uci_instra_fre_hop;
	reg [4:0] uci_slot;
	reg [3:0] uci_nsymbols;
	reg [3:0] uci_first_symbol_idx;
	reg [1:0] uci_prbsoffset;
	reg [9:0] uci_secondhop_prb;
	reg  uci_valid;
	//frame
	reg  in_start_symbol;
	wire [4:0] slot_idx;
	wire      start_slot;
	wire [3:0] sub_idx;
	wire [8:0] rb_idx;
	wire [3:0] sym_idx;
	wire start_symbol;
	wire [7:0] frame_idx;
	wire     start_frame;
	wire  valid_out;
	wire  resoureset_valid;
	integer i, j, slot;
	// instance Module
	// instance frame synchronozation
	frame_sync_0 frame_sync_0_1(clk, rst, in_start_symbol, slot_idx, start_slot, sub_idx, 
							rb_idx, sym_idx, start_symbol, frame_idx, start_frame, valid_out
								);
	demapping demapping_tb(clk, rst, uci_instra_fre_hop, uci_slot, uci_nsymbols, uci_first_symbol_idx,
							uci_prbsoffset, uci_secondhop_prb, uci_valid,
							slot_idx, sym_idx, rb_idx, valid_out,
							resoureset_valid
	);
	//initial all signals and creating rst
	initial begin
	clk =0;
	rst =1;
	in_start_symbol =0;
	uci_instra_fre_hop =0;
	uci_slot =0;
	uci_nsymbols =0;
	uci_first_symbol_idx =0;
	uci_prbsoffset =0;
	uci_secondhop_prb =0;
	uci_valid =0;
	#50 rst =0;
	end
	// clock
	always #0.5 clk = ~clk;
	//data
	initial begin
		wait (!rst);
		@(posedge clk) begin
			uci_instra_fre_hop =1;
			uci_slot =0;
			uci_nsymbols =14;
			uci_first_symbol_idx =0;
			uci_prbsoffset =0;
			uci_secondhop_prb =272;
			uci_valid =1;
		end
		// @(posedge clk) begin
			// uci_instra_fre_hop =0;
			// uci_slot =0;
			// uci_nsymbols =0;
			// uci_first_symbol_idx =0;
			// uci_prbsoffset =0;
			// uci_secondhop_prb =0;
			// uci_valid =0;
		// end
	end


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
