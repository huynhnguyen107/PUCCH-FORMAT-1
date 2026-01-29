`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/25/2025 03:16:07 PM
// Design Name: xcorr_12
// Module Name: xcorr_12
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  correlation 12 samples a and b
// r[k]=∑a[n]⋅b[n−k], m=0-11, k=-11 - +11
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module xcorr_12(
	input clk,
	input rst,
	input in_valid, // 2 consecutive input is 25 clk
	input [31:0] a,
	input [31:0] b,
	output reg out_valid,
	output reg [41:0] out
    );
	integer k;
	integer i;
	//save to vectors ve_b
	reg [31:0] vb [0:11];
	reg [3:0] cnt_vb;
	
	reg rd_en;
	reg cal_en;
	wire [31:0] va;
	reg [3:0] cnt_va;
	//output
	wire tmp_out_valid;

	//start multiply b[0]..b[1]..b[11]*a per cycle
	reg [41:0] d [0:22];//<fixed point 21.15 because total <12
	reg [41:0] d_reg [0:22];//<fixed point 21.15 because total <12
	wire [47:0] c [0:11];//fixed point 24.21 (cut to 17.15)
	reg [4:0] cnt_cal;
	reg  cnt_cal_valid;
	reg [65:0] out_tmp [0:11];
	always @(posedge clk) begin
		if (rst) begin
			for (k=0;k<=11;k=k+1)
				vb[k] <= 0;
			cnt_vb <= 0;
			rd_en <= 0;
			cnt_va <= 0;
			cal_en <= 0;
			cnt_cal <= 0;
			cnt_cal_valid <= 0;
		end
		else begin
			if (in_valid) begin
				cnt_vb <= cnt_vb +1;
				vb[cnt_vb] <= {16'd0-b[31:16],b[15:0]};//conjugate(b) before correlation two complex values
			end
			else begin
				cnt_vb <= 0;
			end
			if (cnt_vb==11)
				rd_en <=1;
			else if (cnt_va >=11)
				rd_en <=0;
			if (rd_en)
				cnt_va <= cnt_va +1;
			else 
				cnt_va <= 0;
			cal_en <= rd_en;	
			// start calculate a*b
			if (cnt_va==5)
				cnt_cal_valid <= 1;
			else if (cnt_cal>=23)
				cnt_cal_valid <= 0;
			if (cnt_cal_valid)
				cnt_cal <= cnt_cal +1;	
			else
				cnt_cal <= 0;
				
		end
	end
	//save a to fifo
	xcorr_fifo xcorr_fifo (
	  .clk(clk),      // input wire clk
	  .din(a),      // input wire [31 : 0] din
	  .wr_en(in_valid),  // input wire wr_en
	  .rd_en(rd_en),  // input wire rd_en
	  .dout(va),    // output wire [31 : 0] dout
	  .full(),    // output wire full
	  .empty()  // output wire empty
	);
	//find c out from c[0]--c[23]
	always @(posedge clk) begin
		if (rst)
			for (k=0;k<23;k=k+1)
				d_reg[k] <=0;
		else
			for (k=0;k<23;k=k+1)
				d_reg[k] <=d[k];
	end
	always @(*) begin
		case (cnt_cal)
			4'd0: begin
				for (k=0;k<23;k=k+1)
					d[k] = 0;
			end
			4'd1: begin
				for (k=0;k<12;k=k+1) begin
					d[k][20:0]  =   d_reg[k][20:0] +  {{4{c[k][22]}},c[k][22:6]} ; //extend sign of c because c17.15, d21.15
					d[k][41:21] =   d_reg[k][41:21] + {{4{c[k][46]}},c[k][46:30]};
					end
			end
			4'd2: begin
				for (k=1;k<13;k=k+1) begin
					d[k][20:0]  = d_reg[k][20:0]  + {{4{c[k-1][22]}},c[k-1][22:6]} ;
					d[k][41:21] = d_reg[k][41:21] + {{4{c[k-1][46]}},c[k-1][46:30]};
					end
			end
			4'd3: begin
				for (k=2;k<14;k=k+1) begin
					d[k][20:0]  = d_reg[k][20:0]  + {{4{c[k-2][22]}},c[k-2][22:6]} ;
					d[k][41:21] = d_reg[k][41:21] + {{4{c[k-2][46]}},c[k-2][46:30]};
					end
			end
			4'd4: begin
				for (k=3;k<15;k=k+1) begin
					d[k][20:0]  = d_reg[k][20:0]  + {{4{c[k-3][22]}},c[k-3][22:6]} ;
					d[k][41:21] = d_reg[k][41:21] + {{4{c[k-3][46]}},c[k-3][46:30]};
					end
			end
			4'd5: begin
				for (k=4;k<16;k=k+1) begin
					d[k][20:0]  = d_reg[k][20:0]  + {{4{c[k-4][22]}},c[k-4][22:6]} ;
					d[k][41:21] = d_reg[k][41:21] + {{4{c[k-4][46]}},c[k-4][46:30]};
					end
			end
			4'd6: begin
				for (k=5;k<17;k=k+1) begin
					d[k][20:0]  = d_reg[k][20:0]  + {{4{c[k-5][22]}},c[k-5][22:6]} ;
					d[k][41:21] = d_reg[k][41:21] + {{4{c[k-5][46]}},c[k-5][46:30]};
					end
			end
			4'd7: begin
				for (k=6;k<18;k=k+1) begin
					d[k][20:0]  = d_reg[k][20:0]  + {{4{c[k-6][22]}},c[k-6][22:6]} ;
					d[k][41:21] = d_reg[k][41:21] + {{4{c[k-6][46]}},c[k-6][46:30]};
					end
			end
			4'd8: begin
				for (k=7;k<19;k=k+1) begin
					d[k][20:0]  = d_reg[k][20:0]  + {{4{c[k-7][22]}},c[k-7][22:6]} ;
					d[k][41:21] = d_reg[k][41:21] + {{4{c[k-7][46]}},c[k-7][46:30]};
					end
			end
			4'd9: begin
				for (k=8;k<20;k=k+1) begin
					d[k][20:0]  = d_reg[k][20:0]  + {{4{c[k-8][22]}},c[k-8][22:6]} ;
					d[k][41:21] = d_reg[k][41:21] + {{4{c[k-8][46]}},c[k-8][46:30]};
					end
			end
			4'd10: begin
				for (k=9;k<21;k=k+1) begin
					d[k][20:0]  = d_reg[k][20:0]  + {{4{c[k-9][22]}},c[k-9][22:6]} ;
					d[k][41:21] = d_reg[k][41:21] + {{4{c[k-9][46]}},c[k-9][46:30]};
					end
			end
			4'd11: begin
				for (k=10;k<22;k=k+1) begin
					d[k][20:0]  = d_reg[k][20:0]  + {{4{c[k-10][22]}},c[k-10][22:6]} ;
					d[k][41:21] = d_reg[k][41:21] + {{4{c[k-10][46]}},c[k-10][46:30]};
					end
			end
			4'd12: begin
				for (k=11;k<23;k=k+1) begin
					d[k][20:0]  = d_reg[k][20:0]  + {{4{c[k-11][22]}},c[k-11][22:6]} ;
					d[k][41:21] = d_reg[k][41:21] + {{4{c[k-11][46]}},c[k-11][46:30]};
					end
			end
			default: begin
				for (k=0;k<23;k=k+1)
					d[k] = d_reg[k] ;
			end
		endcase
	
	end

	//multiply b[0]..b[1]..b[11]*a per cycle
	xcorr_cmpy_0 xcorr_cmpy_0 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(cal_en),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(va),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(cal_en),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(vb[0]),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(c[11])    // output wire [47: 0] m_axis_dout_tdata
	);
	xcorr_cmpy_1 xcorr_cmpy_1 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(cal_en),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(va),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(cal_en),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(vb[1]),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(c[10])    // output wire [47: 0] m_axis_dout_tdata
	);
	xcorr_cmpy_2 xcorr_cmpy_2 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(cal_en),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(va),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(cal_en),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(vb[2]),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(c[9])    // output wire [47: 0] m_axis_dout_tdata
	);
	xcorr_cmpy_3 xcorr_cmpy_3 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(cal_en),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(va),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(cal_en),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(vb[3]),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(c[8])    // output wire [47: 0] m_axis_dout_tdata
	);
	xcorr_cmpy_4 xcorr_cmpy_4 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(cal_en),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(va),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(cal_en),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(vb[4]),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(c[7])    // output wire [47: 0] m_axis_dout_tdata
	);
	xcorr_cmpy_5 xcorr_cmpy_5 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(cal_en),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(va),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(cal_en),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(vb[5]),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(c[6])    // output wire [47: 0] m_axis_dout_tdata
	);
	xcorr_cmpy_6 xcorr_cmpy_6 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(cal_en),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(va),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(cal_en),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(vb[6]),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(c[5])    // output wire [47: 0] m_axis_dout_tdata
	);
	xcorr_cmpy_7 xcorr_cmpy_7 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(cal_en),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(va),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(cal_en),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(vb[7]),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(c[4])    // output wire [47: 0] m_axis_dout_tdata
	);
	xcorr_cmpy_8 xcorr_cmpy_8 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(cal_en),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(va),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(cal_en),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(vb[8]),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(c[3])    // output wire [47: 0] m_axis_dout_tdata
	);
	xcorr_cmpy_9 xcorr_cmpy_9 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(cal_en),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(va),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(cal_en),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(vb[9]),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(c[2])    // output wire [47: 0] m_axis_dout_tdata
	);
	xcorr_cmpy_10 xcorr_cmpy_10 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(cal_en),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(va),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(cal_en),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(vb[10]),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(c[1])    // output wire [47: 0] m_axis_dout_tdata
	);
	xcorr_cmpy_11 xcorr_cmpy_11 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(cal_en),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(va),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(cal_en),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(vb[11]),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(c[0])    // output wire [47: 0] m_axis_dout_tdata
	);
	//output from cnt_cal = 2 to 24
	always @(posedge clk) begin
		if (rst) begin
			out <= 0;
			out_valid <= 0;
		end
		else begin
			if (tmp_out_valid) 
				// out <= {d[cnt_cal-1][63:48], d[cnt_cal-1][30:15]};
				out <= d_reg[cnt_cal-2];
			else
				out <= 0;
			out_valid <= tmp_out_valid;
		end
	end
	assign tmp_out_valid = (cnt_cal >=2 & cnt_cal<=24);
endmodule
