`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/01/2026 07:47:48 AM
// Design Name: ba_seq_control
// Module Name: ba_seq_control
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description: receive basequence, save to bram  and then control data out
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ba_seq_control(
	input clk,
	input rst,
	input basequence_valid_0,
	input [31:0] basequence_0,
	input basequence_valid_1,
	input [31:0] basequence_1,
	input in_valid,
	input uci_intra_fr_hop,
	input [2:0] nfs_0,
	input [2:0] nfs_1,
	input nfs_valid,
	input start_en,
	output reg basequence_out_valid,
	output reg [31:0] basequence_out
    );
	//save uci_intra_fr_hop
	reg reg_intra_fr_hop;
	//save basequence to bram0 and bram1
	wire [31:0] dout_a;
	wire [31:0] dout_b;
	reg  [3:0] addr_a;
	reg  [3:0] addr_b;
	//save nfs
	reg [2:0] reg_nfs_0;
	reg [2:0] reg_nfs_1;
	reg [2:0] reg_total_nfs;
	//start read basequence
	reg [3:0] cnt;
	reg [2:0] cnt_7;
	reg start;
	wire start_0;
	wire start_1;
	//output
	reg valid_out_0;
	reg valid_out_1;
	always @(posedge clk) begin
		if (rst) begin
			addr_a <=0;
			addr_b <=0;
		end
		else begin
			if (basequence_valid_0) begin //write
				addr_a <= addr_a==11 ? 0: addr_a +1;
			end else 
			if (start_0)begin					 //read
				addr_a <= addr_a==11 ? 0: addr_a +1;
			end else begin
				addr_a <= 0;
			end
			if (basequence_valid_1) begin //write
				addr_b <= addr_b==11 ? 0: addr_b +1;
			end 
			else if (start_1)begin					 //read
				addr_b <= addr_b==11 ? 0: addr_b +1;
			end else begin
				addr_b <= 0;
			end
		end
	
	end
	ba_seq_control_blk_0 ba_seq_control_blk_0 (
	  .clka(clk),            // input wire clka
	  .rsta(rst),            // input wire rsta
	  .wea(basequence_valid_0),              // input wire [0 : 0] wea
	  .addra(addr_a),          // input wire [3 : 0] addra
	  .dina(basequence_0),            // input wire [31 : 0] dina
	  .douta(dout_a),          // output wire [31 : 0] douta
	  .rsta_busy()  // output wire rsta_busy
	);
	base_se_control_blk_1 base_se_control_blk_1 (
	  .clka(clk),            // input wire clka
	  .rsta(rst),            // input wire rsta
	  .wea(basequence_valid_1),              // input wire [0 : 0] wea
	  .addra(addr_b),          // input wire [3 : 0] addra
	  .dina(basequence_1),            // input wire [31 : 0] dina
	  .douta(dout_b),          // output wire [31 : 0] douta
	  .rsta_busy()  // output wire rsta_busy
	);
	//save nfs
	always @(posedge clk) begin
		if (rst) begin
			reg_intra_fr_hop <= 0;
			reg_nfs_0 <= 0;
			reg_nfs_1 <= 0;
			reg_total_nfs <= 0;
		end
		else begin
			//save to reg
			if (in_valid)
				reg_intra_fr_hop <= uci_intra_fr_hop;
			if (nfs_valid) begin
				reg_nfs_0 <= reg_intra_fr_hop ? nfs_0 : nfs_0 -1;
				reg_nfs_1 <= reg_intra_fr_hop ? nfs_1 : 1;
			end
			reg_total_nfs <= reg_nfs_0 +reg_nfs_1;
		end
	end
	//start read basequence
	always @(posedge clk) begin
		if (rst) begin
			start <= 0;
			cnt <= 0;
			cnt_7 <= 0;
		end 
		else begin
			if (start_en) 
				start <=1;
			else if (cnt_7>=reg_total_nfs)
				start <=0;
			
			if (start)
				cnt <= cnt==11 ? 0: cnt +1;
			else
				cnt <= 0;
			if (cnt==11)
				cnt_7 <= cnt_7 +1;
			else if (!start)
				cnt_7 <= 0;
		end
	end
	assign start_0 = start & (cnt_7<reg_nfs_0);
	assign start_1 = start & !start_0&(cnt_7<reg_total_nfs);
	//output
	always @(posedge clk) begin
		if (rst) begin
			valid_out_0 <=0;
			valid_out_1 <=0;
			basequence_out_valid <=0;
			basequence_out <=0;
		end else begin
			if (start_0)
				valid_out_0 <= 1;
			else
				valid_out_0 <= 0;
			if (start_1)
				valid_out_1 <= 1;
			else
				valid_out_1 <= 0;
			basequence_out_valid <= valid_out_0|valid_out_1;
			basequence_out <= valid_out_0 ? dout_a : (valid_out_1 ? dout_b : 0 );
		end
	end
endmodule
