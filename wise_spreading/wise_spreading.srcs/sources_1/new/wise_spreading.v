`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/06/2026 11:01:03 AM
// Design Name: wise_spreading
// Module Name: wise_spreading
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  wise_spreading matrix for cyclic shift
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module wise_spreading(
	input clk,
	input rst,
	input in_valid,
	input [3:0] uci_OCC,
	input  nfs_valid,
	input [2:0] nfs,
	input enable,
	output wi_seq_valid,
	output[31:0] wi_seq,
	output o_enable
    );
	reg [3:0] reg_uci_OCC;
	reg [2:0] reg_nfs;
	////find clock cycles= nfs*12
	reg [6:0] cnt_11;
	reg valid_11;
	reg [2:0] cnt_fs;
	//find start cnt for ROM
	reg [5:0] start;
	//counter ROM
	wire [5:0] cnt;
	wire [31:0] dout_3;
	wire [31:0] dout_4;
	wire [31:0] dout_5;
	wire [31:0] dout_6;
	wire [31:0] dout_7;
	reg [31:0] dout;
	//save data in
	always @(posedge clk) begin
		if (rst) begin
			reg_uci_OCC <= 0;
			reg_nfs <= 0;
		end
		else begin
			if (in_valid) begin
				reg_uci_OCC <= uci_OCC;
			end
			if (nfs_valid) begin
				reg_nfs <= nfs;
			end
				
		end
	
	end
	//select nfs1 and occ
	always @(posedge clk) begin
		if (rst) begin
			cnt_11 <= 0;
			valid_11 <= 0;
			cnt_fs <= 0;
		end
		else begin
			if (enable) 
				valid_11 <= 1; 
			else if (cnt_fs>=reg_nfs)
				valid_11 <= 0; 
				
			if (valid_11)
				cnt_11 <= (cnt_11==11) ? 0: cnt_11 +1;
			else
				cnt_11 <= 0;
				
			if (cnt_11==11)
				cnt_fs <= cnt_fs +1;
			else if (cnt_fs>=reg_nfs)
				cnt_fs <= 0; 
		end
	end
	//find start
	always @(*) begin
		case (reg_uci_OCC)
			0: start =0;
			1: start =7;
			2: start =14;
			3: start =21;
			4: start =28;
			5: start =35;
			6: start =42;
			default: start =0;
		endcase
	end
	assign cnt = start+cnt_fs;
	//ROM
	wise_rom_3 wise_rom_3 (
	  .clka(clk),            // input wire clka
	  .rsta(rst),            // input wire rsta
	  .addra(cnt),          // input wire [5 : 0] addra
	  .douta(dout_3),          // output wire [31 : 0] douta
	  .rsta_busy()  // output wire rsta_busy
	);
	wise_rom_4 wise_rom_4 (
	  .clka(clk),            // input wire clka
	  .rsta(rst),            // input wire rsta
	  .addra(cnt),          // input wire [5 : 0] addra
	  .douta(dout_4),          // output wire [31 : 0] douta
	  .rsta_busy()  // output wire rsta_busy
	);
	wise_rom_5 wise_rom_5 (
	  .clka(clk),            // input wire clka
	  .rsta(rst),            // input wire rsta
	  .addra(cnt),          // input wire [5 : 0] addra
	  .douta(dout_5),          // output wire [31 : 0] douta
	  .rsta_busy()  // output wire rsta_busy
	);
	wise_rom_6 wise_rom_6 (
	  .clka(clk),            // input wire clka
	  .rsta(rst),            // input wire rsta
	  .addra(cnt),          // input wire [5 : 0] addra
	  .douta(dout_6),          // output wire [31 : 0] douta
	  .rsta_busy()  // output wire rsta_busy
	);
	wise_rom_7 wise_rom_7 (
	  .clka(clk),            // input wire clka
	  .rsta(rst),            // input wire rsta
	  .addra(cnt),          // input wire [5 : 0] addra
	  .douta(dout_7),          // output wire [31 : 0] douta
	  .rsta_busy()  // output wire rsta_busy
	);
	//select dout_x based on reg_nfs
	always @(*) begin
		case (reg_nfs)
			0: dout = {16'd0, 16'd32767};//=1
			1: if (reg_uci_OCC)
				  dout = {16'd0, 16'd32767};//=1,1
			   else if (start==7)
				  dout = {16'd0, 16'd32767};//=1
			   else
			      dout = {16'd0, 16'd32768};//=-1
			3: dout = dout_3;//=dout_3
			4: dout = dout_4;//=dout_4
			5: dout = dout_5;//=dout_5
			6: dout = dout_6;//=dout_6
			7: dout = dout_7;//=dout_7
			default:  dout = {16'd0, 16'd32767};//=1
		endcase
	end
	//assign output
	assign wi_seq = dout;
	assign wi_seq_valid = valid_11 & (cnt_fs <reg_nfs);
	assign o_enable= (cnt_fs == reg_nfs-1)& (cnt_11==11);
endmodule
