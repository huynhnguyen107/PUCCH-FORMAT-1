`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/12/2026 05:25:04 PM
// Design Name: tb
// Module Name: payload_est_SINR
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  find payload and estimate SINR
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
	reg in_valid;
	reg uci_modulation;
	reg mean_data_valid;
	reg [34*8-1:0] mean_data;
	reg [34*8-1:0] sig_power_valid;
	reg [30*8-1:0] sig_power;
	wire payload_valid;
	wire [1:0] payload;
	wire sinr_valid;
	wire [64:0] sinr;
	// call instance
	payload_est_SINR #(8) payload_est_SINR_0 (clk, rst, in_valid, uci_modulation, mean_data_valid, mean_data,
							sig_power_valid, sig_power, payload_valid, payload, sinr_valid, sinr);
	//create rst and initial other signals
	initial begin
		rst=1;
		clk=0;
		in_valid=0;
		uci_modulation=0;
		mean_data_valid=0;
		mean_data=0;
		sig_power_valid=0;
		sig_power=0;
	#50 rst=0;
	end
	//create clock
	always #0.5 clk =!clk;
	//create other signals
	initial begin
		wait(!rst)
		@(posedge clk) begin
			in_valid <=1;
			uci_modulation <=1;
			mean_data_valid <=0;
			mean_data <=0;
			sig_power_valid <=0;
			sig_power <=0;
		end
		@(posedge clk) begin
			in_valid <=0;
			uci_modulation <=0;
			mean_data_valid <=1;
			mean_data <={8{17'd114688, 17'd114688}};
			sig_power_valid <=0;
			sig_power <=0;
		end
		@(posedge clk) begin
			in_valid <=0;
			uci_modulation <=0;
			mean_data_valid <=0;
			mean_data <=0;
			sig_power_valid <=0;
			sig_power <=0;
		end
	end
endmodule
