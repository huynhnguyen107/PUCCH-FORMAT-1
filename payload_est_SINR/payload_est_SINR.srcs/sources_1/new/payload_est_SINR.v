`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/12/2026 04:18:14 PM
// Design Name: 
// Design Name: payload_est_SINR
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


module payload_est_SINR #(parameter RX=8)(
	input clk,
	input rst,
	input in_valid,
	input uci_modulation,//0-bpsk, 1-qpsk
	input mean_data_valid,
	input [34*RX-1:0] mean_data,
	input sinr_valid,
	input [64*RX-1:0] sinr,
	output payload_valid,
	output [1:0] payload,
	output mean_sinr_valid,
	output [64-1:0] mean_sinr
    );
	//total mean data
	reg reg_uci_modulation;
	reg [34*RX-1:0] mean_data_shift;
	reg [34+2*$clog2(RX)-1:0] sum_mean_data;
	reg [34+2*$clog2(RX)-1:0] equal_sym;
	reg  equal_sym_valid;
	//Demodulation
	integer i=0;
	integer j=0;
	//total SINR
	reg [64*RX+$clog2(RX)-1:0] total_sinr_shift ;
	reg [64+$clog2(RX)-1:0] total_sinr ;
	
	always @(*) begin
		sum_mean_data = 0;
		for (i=0;i<RX;i=i+1) begin
			mean_data_shift = mean_data>>(34*i);
			sum_mean_data [17+$clog2(RX)-1:0]= sum_mean_data [17+$clog2(RX)-1:0] +{{$clog2(RX){mean_data_shift[16]}}, mean_data_shift[16:0]};
			sum_mean_data [34+2*$clog2(RX)-1:17+$clog2(RX)]= sum_mean_data [34+2*$clog2(RX)-1:17+$clog2(RX)] +{{$clog2(RX){mean_data_shift[16]}}, mean_data_shift[16:0]};
		end
	end
	always @(posedge clk) begin
		if (rst) begin
			equal_sym <= 0;
			equal_sym_valid <= 0;
			reg_uci_modulation <= 0;
		end 
		else begin
			if (in_valid)
				reg_uci_modulation <= uci_modulation;
			if (mean_data_valid)
				equal_sym <= sum_mean_data;
			equal_sym_valid <= mean_data_valid;
		end
	end


	//Demodulation
	assign payload= !reg_uci_modulation ? (equal_sym[34+2*$clog2(RX)-1]&equal_sym[17+$clog2(RX)-1] ? 1: 0) : {equal_sym[34+2*$clog2(RX)-1],equal_sym[17+$clog2(RX)-1]} ;
	assign payload_valid = equal_sym_valid;
	//total SINR
	always @(*) begin
		total_sinr = 0;
		for (j=0 ; j<RX ; j=j+1) begin
			total_sinr_shift = sinr>>(64*j);
			total_sinr = total_sinr + total_sinr_shift[63:0];
		end
			
	end
	assign mean_sinr = total_sinr>>($clog2(RX));
	assign mean_sinr_valid = sinr_valid;



endmodule