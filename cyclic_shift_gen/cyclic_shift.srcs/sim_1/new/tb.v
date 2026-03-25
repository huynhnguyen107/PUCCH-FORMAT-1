`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/24/2025 07:59:40 PM
// Design Name: tb
// Module Name: cylic_shift_generator
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  mutiply phase and base sequence
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module tb( );
	reg clk;
	reg rst;
	reg uci_valid;
	reg [4:0] uci_slot;
	reg [3:0] uci_first_symbol;
	reg [3:0] uci_m0;
	reg [3:0] uci_nSymbs;
	reg [10:0] uci_NID;
	reg [1:0] uci_grouphopping;
	reg  uci_intra_fr_hop;
	wire [31:0] cyclic;
	wire cyclic_valid;
	integer i=0;
	//call instance
	 cyclic_gen cyclic_gen_i
	   (.clk(clk),
		.rst(rst),
        .uci_valid(uci_valid),
		.uci_NID(uci_NID),
		.uci_first_symbol(uci_first_symbol),
		.uci_grouphopping(uci_grouphopping),
		.uci_intra_fr_hop(uci_intra_fr_hop),
		.uci_m0(uci_m0),
		.uci_nsymbols(uci_nSymbs),
		.uci_slot(uci_slot),
		.cyclic(cyclic),
		.cyclic_valid(cyclic_valid)
		);
	//create initial signals and create rst
	initial begin
		clk = 0;
		rst = 1;
		uci_valid = 0;
		uci_slot = 0;
		uci_first_symbol = 0;
		uci_m0 = 0;
		uci_nSymbs = 0;
		uci_grouphopping = 0;
		uci_intra_fr_hop = 0;
		uci_NID = 0;
		#50 rst =0;
	end
	//create clock
	always #0.5 clk = !clk;
	//create others
	initial begin
		wait (!rst)
		@(posedge clk) begin
			uci_valid <= 1;
			uci_slot <= 0;
			uci_first_symbol <= 0;
			uci_m0 <= 1;
			uci_nSymbs <= 12;
			uci_grouphopping <= 0;
			uci_intra_fr_hop <= 1;
			uci_NID <= 0;
		end
		for (i=0;i<1000;i=i+1) begin
				@(posedge clk) begin
				uci_valid <= 0;
				uci_slot <= 0;
				uci_first_symbol <= 0;
				uci_m0 <= 0;
				uci_nSymbs <= 0;
				uci_grouphopping <= 0;
				uci_intra_fr_hop <= 0;
				uci_NID <= 0;
			end
		end
		@(posedge clk) begin
			uci_valid <= 1;
			uci_slot <= 0;
			uci_first_symbol <= 0;
			uci_m0 <= 1;
			uci_nSymbs <= 12;
			uci_grouphopping <= 0;
			uci_intra_fr_hop <= 1;
			uci_NID <= 0;
		end
		for (i=0;i<1000;i=i+1) begin
				@(posedge clk) begin
				uci_valid <= 0;
				uci_slot <= 0;
				uci_first_symbol <= 0;
				uci_m0 <= 0;
				uci_nSymbs <= 0;
				uci_grouphopping <= 0;
				uci_intra_fr_hop <= 0;
				uci_NID <= 0;
			end
		end
			
	end
endmodule
