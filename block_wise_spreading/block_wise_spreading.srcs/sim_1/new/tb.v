`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 02/18/2026 07:02:52 PM
// Design Name: tb
// Module Name: uci_dmrs_gen
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  synchronize two wise spreading results and then multiply with cyclic  
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb();
	reg clk;
	reg rst;
	reg cyclic_valid;
	reg [31:0] cyclic;
	reg wise_valid_0;
	reg [31:0] wise_0;
	reg wise_valid_1;
	reg [31:0] wise_1;
	wire spreading_valid;
	wire [31:0] spreading;
	integer i=0;
	//call instance
	block_wise_spreading block_wise_spreading(clk, rst, cyclic_valid, cyclic, wise_valid_0, wise_0, wise_valid_1, wise_1, spreading_valid, spreading);
	// create rst and initial other signals
	initial begin
		rst=1;
		clk=0;
		cyclic_valid=0;
		cyclic=0;
		wise_valid_0=0;
		wise_0=0;
		wise_valid_1=0;
		wise_1=0;
	#50 rst=0;
	end
	// create clock
	always #0.5 clk=!clk;
	//initial other signals
	initial begin
		wait(!rst)
		@(posedge clk) begin
			cyclic_valid <= 0;
			cyclic <= 0;
			wise_valid_0 <= 0;
			wise_0 <= 0;
			wise_valid_1 <= 0;
			wise_1 <= 0;
		end
		for (i=0;i<43;i=i+1)
			@(posedge clk) begin
				cyclic_valid <= 1;
				cyclic[31:16] <= 0;
				cyclic[15:0] <= i*327;
				wise_valid_0 <= 1;
				wise_0 [31:16] <= 0;
				wise_0 [15:0] <= 32767;
				wise_valid_1 <= 0;
				wise_1 <= 0;
			end
		for (i=0;i<43;i=i+1)
			@(posedge clk) begin
				cyclic_valid <= 1;
				cyclic[31:16] <= 0;
				cyclic[15:0] <= i*327;
				wise_valid_0 <= 0;
				wise_0 <= 0;
				wise_valid_1 <= 1;
				wise_1 [31:16] <= 0;
				wise_1 [15:0] <= 32767;
			end
		@(posedge clk) begin
			cyclic_valid <= 0;
			cyclic <= 0;
			wise_valid_0 <= 0;
			wise_0 <= 0;
			wise_valid_1 <= 0;
			wise_1 <= 0;
		end
	end
endmodule
