`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 01/28/2026 08:29:40 PM
// Design Name: Resource Demapping
// Module Name: mapping
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  FFT
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module demapping(
		input clk,
		input rst,
		//uci from layer 2
		input       uci_instra_fre_hop,
		input [4:0] uci_slot,
		input [3:0] uci_nsymbols,
		input [3:0] uci_first_symbol_idx,
		input [1:0] uci_prbsoffset,
		input [9:0] uci_secondhop_prb,
		input  uci_valid,
		// from synchronous frame
		input [4:0] fr_slot,
		input [3:0] fr_symbol,
		input [8:0] fr_rb,
		input  fr_data_valid,
		output resoureset_valid
    );
	//reg uci_instra_fre_hop
	reg fre_hopping_valid;
	//definition
	wire uci_ex_valid;
	wire valid;
	//reg enable
	reg slot_valid;
	//first_hop
	reg symbol_valid1;
	reg rb_valid1;
	//second_hop
	reg symbol_valid2;
	reg rb_valid2;
	//intra
	wire intra_valid;
	//non_intra
	wire non_intra_valid;
	//final Resource set
	wire final_resource_set;
	wire edge_resource_set;
	//extend valid to 3 slot
	extend_valid_new #(307200) extend_valid_0(clk, rst, uci_valid, uci_ex_valid);
	assign valid = uci_ex_valid & fr_data_valid;
	// logic checks
	always @(posedge clk)
		if (rst) begin
			fre_hopping_valid <= 0;
			slot_valid <= 0;
			symbol_valid1 <= 0;
			rb_valid1 <= 0;
			symbol_valid2 <= 0;
			rb_valid2 <= 0;
		end
		else begin
			if (valid) begin
				fre_hopping_valid <= uci_instra_fre_hop;
				slot_valid <= uci_slot == fr_slot;
				symbol_valid1 <= (fr_symbol >= uci_first_symbol_idx)&(fr_symbol <= (uci_nsymbols[3:1]+uci_first_symbol_idx-1));
				rb_valid1 <= uci_prbsoffset == fr_rb;
				symbol_valid2 <= (fr_symbol >= (uci_nsymbols[3:1]+uci_first_symbol_idx))&(fr_symbol <= uci_nsymbols-1);
				rb_valid2 <= uci_secondhop_prb == fr_rb;
			end
		end
		//assign all conditions
		//case 1 hopping
		assign intra_valid = slot_valid & ((symbol_valid1 & rb_valid1)|(symbol_valid2 & rb_valid2));
		//case 2 non_hopping
		assign non_intra_valid = slot_valid & (symbol_valid1 | symbol_valid2)&(rb_valid1);
		//selection hopping or no-hopping
		assign final_resource_set = fre_hopping_valid ? intra_valid: non_intra_valid;
		//calib delays and 12 cyclyes
		//rasing edge
		rasing_edge rasing_edge_0(clk, rst, final_resource_set, edge_resource_set );
		//calib delays
		delay_N #(403, 1)delay_N_0 (clk, rst, edge_resource_set, d_resource_set );
		//extend 12 cyclyes=1rb
		extend_valid_new #(12) extend_valid_1(clk, rst, d_resource_set,  resoureset_valid);
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


//rasing edge 
module  rasing_edge (
		input clk,
		input rst,
		input in,
		input out
	);
	reg reg_not_in;
	always @(posedge clk)
		if (rst)
			reg_not_in <= 1;
		else
			reg_not_in <= !in;
	assign out = in & reg_not_in ;
endmodule 
//extend module
module extend_valid_new #(parameter number_cycles=100)(
		input clk,
		input rst,
		input i_pulse,
		output o_valid
	);
	reg [$clog2(number_cycles)-1:0] cnt;
	reg  valid;
	always @(posedge clk)
		if (rst) begin
			cnt <= 0;
			valid <= 0;
		end
		else begin
			if (i_pulse & cnt < number_cycles-2)
				valid <= 1;
			else if (cnt >= number_cycles-2)
				valid <= 0;
			if (valid)
				cnt <= cnt +1 ;
			else if (cnt >= number_cycles-2)
				cnt <= 0;
		end
			
	assign o_valid = valid|i_pulse;
endmodule