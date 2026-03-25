`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/04/2026 06:57:41 PM
// Design Name: phase_gen_control
// Module Name: phase_gen_control
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  save phase to fifo and wait until having start_en
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module phase_gen_control(
	input clk,
	input rst,
	input i_phase_valid,
	input [31:0]i_phase,
	input in_valid,
	input [3:0] uci_nSymbs,
	input  in_uci_flag,
	output o_phase_valid,
	output [31:0]o_phase,
	output start_en
    );
	//control fifo
	reg [3:0] reg_uci_nSymbs;
	reg [3:0] cnt_11_write;
	reg [3:0] cnt_write;
	reg [3:0] cnt_11_read;
	reg [3:0] cnt_read;
	reg start_read;
	reg valid_read;
	// start_read delay
	reg valid_d;
	wire start_read_d;
	reg [2:0] cnt_d;

	//rd_en
	wire rd_en;
	reg reg_rd_en;
	//save data to fifo first
	phase_fifo_0 phase_fifo_0 (
	  .clk(clk),                  // input wire clk
	  .srst(rst),                // input wire srst
	  .din(i_phase),                  // input wire [31 : 0] din
	  .wr_en(i_phase_valid),              // input wire wr_en
	  .rd_en(rd_en),              // input wire rd_en
	  .dout(o_phase),                // output wire [31 : 0] dout
	  .full(),                // output wire full
	  .empty(),              // output wire empty
	  .wr_rst_busy(),  // output wire wr_rst_busy
	  .rd_rst_busy()  // output wire rd_rst_busy
	);
	always @(posedge clk) begin
		if (rst) begin
			reg_uci_nSymbs <= 0;
			valid_read <= 0;
			start_read <= 0;
			cnt_11_write <= 0;
			cnt_write <= 0;
			cnt_11_read <= 0;
			cnt_read <= 0;
			reg_rd_en <= 0;
		end 
		else begin
			//save symbol
			if (in_valid)
				//reg_uci_nSymbs <= uci_nSymbs>>1+ ((!in_uci_flag) & uci_nSymbs[0]);//find hafl symbol ;
				reg_uci_nSymbs <= uci_nSymbs[3:1] + ((!in_uci_flag) & uci_nSymbs[0]);//find hafl symbol ;
			//count to symbol*12	
			if (i_phase_valid) 
				cnt_11_write <= (cnt_11_write==11) ? 0: cnt_11_write +1;
			//count to symbol	
			if (cnt_11_write==11)
				cnt_write <=  cnt_write +1;
			else if (cnt_write== reg_uci_nSymbs)
				cnt_write <=0;
			//start read fifo
			start_read = cnt_write!=0 & cnt_write== reg_uci_nSymbs;
			//using start_read_d instead of start_read
			if (start_read_d)
				valid_read <=1;
			else if (cnt_read==reg_uci_nSymbs)
				valid_read <=0;
			//count to symbol*12	
			if (valid_read)
				cnt_11_read <= (cnt_11_read==11) ? 0: cnt_11_read +1;
			else cnt_11_read <=0; 
			//count to symbol	
			if (cnt_11_read==11)
				cnt_read <= cnt_read +1;
			else if (cnt_read== reg_uci_nSymbs)
				cnt_read <=0;
			reg_rd_en <= rd_en;
		end
	
	end
	//start_read delay
	always @(posedge clk)
		if (rst) begin
			valid_d <= 0;
			cnt_d <= 0;
		end
		else begin
			if (start_read)
				valid_d <=1;
			if (cnt_d==1)
				valid_d <=0;
			if (valid_d)
				cnt_d <= cnt_d +1;
			else
				cnt_d<=0;
		end
	assign start_read_d = cnt_d==1;
	assign rd_en= valid_read & cnt_read <reg_uci_nSymbs;
	assign o_phase_valid= reg_rd_en;
	assign start_en= start_read;
endmodule
