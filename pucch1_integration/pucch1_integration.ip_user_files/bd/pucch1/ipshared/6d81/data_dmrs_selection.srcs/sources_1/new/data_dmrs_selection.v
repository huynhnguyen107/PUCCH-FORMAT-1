`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/16/2026 04:08:57 PM
// Design Name: data_dmrs_selection
// Module Name: data_dmrs_selection
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  data_dmrs_selection from ofdm demodulation
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module data_dmrs_selection(
	input clk,
	input rst,
	input uci_valid,
	input [3:0] uci_nsymbols,
	input resoureset_valid,
	input ofdm_valid,
	input [31:0] ofdm,
	output dmrs_valid,
	output [31:0] dmrs,
	output data_valid,
	output [31:0] data
    );
	//find number of dmrs and data(uci)
	reg [2:0] n_dmrs;
	reg [2:0] n_data;
	//find symbols of dmrs and symbols of data
	reg [3:0] cnt_11;
	reg [3:0] cnt_nsymbols;
	reg valid_odd_even;
	wire fifo_dmrs_valid;
	wire fifo_data_valid;
	//read fifo
	wire start_read;
	wire dmrs_rd_en;
	wire [31:0] dmrs_dout;
	wire data_rd_en;
	wire [31:0] data_dout;
	//counter read for dmrs and data
	reg  dmrs_cnt_valid;
	reg [3:0] dmrs_cnt_11;
	reg [2:0] dmrs_cnt;
	reg data_cnt_valid;
	reg [3:0] data_cnt_11;
	reg [2:0] data_cnt;
	//valid after read
	reg dmrs_dout_valid;
	reg data_dout_valid;
	always @(posedge clk) begin
		if (rst) begin
			n_dmrs <= 0;
			n_data <= 0;
		end
		else begin
			if (uci_valid) begin
				n_dmrs <= uci_nsymbols[3:1] + uci_nsymbols[0];
				n_data <= uci_nsymbols[3:1];
			end
		end
	end
	//find symbols of dmrs and symbols of data
	always @(posedge clk) begin
		if (rst) begin
			cnt_11 <= 0;
			cnt_nsymbols <= 0;
			valid_odd_even <= 0;
		end
		else begin
			// write fifo
			if (resoureset_valid) begin
				cnt_11 <= (cnt_11==11) ? 0 : cnt_11 +1; 
				if (cnt_11==11)
					valid_odd_even <= !valid_odd_even;
			end
			else if (cnt_nsymbols>= (n_dmrs+n_data)) begin
				valid_odd_even <=0;
			end
			if (cnt_nsymbols< (n_dmrs+n_data))
				cnt_nsymbols <= cnt_nsymbols + (cnt_11==11);
			else
				cnt_nsymbols <=0;
		end
	end
	assign fifo_dmrs_valid = !valid_odd_even&resoureset_valid;
	assign fifo_data_valid = valid_odd_even&resoureset_valid;
	assign start_read = (cnt_nsymbols>0)&(cnt_nsymbols==(n_dmrs+n_data));
	//read enable
	always @(posedge clk) begin
		if (rst) begin
			dmrs_cnt_valid <= 0;
			dmrs_cnt_11 <= 0;
			dmrs_cnt <= 0;
			data_cnt_valid <= 0;
			data_cnt_11 <= 0;
			data_cnt <= 0;
			dmrs_dout_valid <= 0;
			data_dout_valid <= 0;
		end
		else begin
			// for dmrs
			if (start_read)
				dmrs_cnt_valid <= 1;
			else if (dmrs_cnt>=n_dmrs)
				dmrs_cnt_valid <= 0;
				
			if (dmrs_cnt_valid) begin
				dmrs_cnt_11 <= (dmrs_cnt_11==11) ? 0 : dmrs_cnt_11 +1;
				dmrs_cnt <= dmrs_cnt +(dmrs_cnt_11==11) ;
			end 
			else begin
				dmrs_cnt_11 <=0;
				dmrs_cnt <=0;
			end
			// for data
			if (start_read)
				data_cnt_valid <= 1;
			else if (data_cnt>=n_data)
				data_cnt_valid <= 0;
				
			if (data_cnt_valid) begin
				data_cnt_11 <= (data_cnt_11==11) ? 0 : data_cnt_11 +1;
				data_cnt <= data_cnt +(data_cnt_11==11) ;
			end 
			else begin
				data_cnt_11 <=0;
				data_cnt <=0;
			end
			dmrs_dout_valid <= dmrs_rd_en;
			data_dout_valid <= data_rd_en;
		end
	end
	//read enable 
	assign dmrs_rd_en = dmrs_cnt_valid & (dmrs_cnt<n_dmrs);
	assign data_rd_en = data_cnt_valid & (data_cnt<n_data);
	//save to fifo
	data_dmrs_fifo_0 data_dmrs_fifo_0 (
	  .clk(clk),                  // input wire clk
	  .srst(rst),                // input wire srst
	  .din(ofdm),                  // input wire [31 : 0] din
	  .wr_en(fifo_dmrs_valid),              // input wire wr_en
	  .rd_en(dmrs_rd_en),              // input wire rd_en
	  .dout(dmrs_dout),                // output wire [31 : 0] dout
	  .full(),                // output wire full
	  .empty(),              // output wire empty
	  .wr_rst_busy(),  // output wire wr_rst_busy
	  .rd_rst_busy()  // output wire rd_rst_busy
	);
	data_dmrs_fifo_1 data_dmrs_fifo_1 (
	  .clk(clk),                  // input wire clk
	  .srst(rst),                // input wire srst
	  .din(ofdm),                  // input wire [31 : 0] din
	  .wr_en(fifo_data_valid),              // input wire wr_en
	  .rd_en(data_rd_en),              // input wire rd_en
	  .dout(data_dout),                // output wire [31 : 0] dout
	  .full(),                // output wire full
	  .empty(),              // output wire empty
	  .wr_rst_busy(),  // output wire wr_rst_busy
	  .rd_rst_busy()  // output wire rd_rst_busy
	);
	//output 
	assign dmrs_valid = dmrs_dout_valid;
	assign dmrs = dmrs_dout;
	assign data_valid = data_dout_valid;
	assign data = data_dout;
endmodule
