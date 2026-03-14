`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/09/2026 02:56:35 PM
// Design Name: tb
// Module Name: tb
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  save dmrs or uci gen first before multuply complex with rx_data or rx_dmrs
// de_spreading_data= d_rx_data * conj(spreading) 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////


module tb();
	reg clk;
	reg rst;
	reg spreading_data_valid;
	reg [31:0] spreading_data;
	reg rx_data_valid;
	reg [31:0] rx_data;
	wire de_spreading_data_valid;
	wire [31:0] de_spreading_data;
	integer i=0;
	//call instance
	de_spread de_spread(clk, rst, spreading_data_valid, spreading_data, rx_data_valid, rx_data, de_spreading_data_valid, de_spreading_data);
	// create rst and initial other signals
	initial begin
		rst=1;
		clk=0;
		spreading_data_valid=0;
		spreading_data=0;
		rx_data_valid=0;
		rx_data=0;
	#50 rst=0;
	end
	// create clock
	always #0.5 clk=!clk;
	//initial other signals
	initial begin
		wait(!rst)
		@(posedge clk) begin
			spreading_data_valid <= 0;
			spreading_data <= 0;
			rx_data_valid <= 0;
			rx_data <= 0;
		end
		for (i=0;i<43;i=i+1)
			@(posedge clk) begin
				spreading_data_valid <= 1;
				spreading_data[31:16] <= i*327;
				spreading_data[15:0] <= 0;
				rx_data_valid <= 0;
				rx_data [31:16] <= 0;
				rx_data [15:0] <= 0;
			end
		for (i=0;i<43;i=i+1)
			@(posedge clk) begin
				spreading_data_valid <= 0;
				spreading_data[31:16] <= 0;
				spreading_data[15:0] <= 0;
				rx_data_valid <= 1;
				rx_data [31:16] <= 0;
				rx_data [15:0] <= 32767;
			end
		@(posedge clk) begin
			spreading_data_valid <= 0;
			spreading_data <= 0;
			rx_data_valid <= 0;
			rx_data <= 0;
		end
	end
endmodule
