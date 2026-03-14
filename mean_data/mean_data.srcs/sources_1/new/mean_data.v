`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/09/2026 07:36:32 PM
// Design Name: mean_data
// Module Name: mean_data
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  mean the power of dmrs and uci
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mean_data(
	input clk,
	input rst,
	input in_valid,
	input [3:0] uci_nsymbol,
	input despread_uci_valid,
	input [31:0] despread_uci,
	input despread_dmrs_valid,
	input [31:0] despread_dmrs,
	output o_mean_data_valid,
	output [33:0] o_mean_data,
	output sig_power_valid,
	output [29:0] sig_power,
	output sinr_valid,
	output [31:0] sinr
    );
	reg [3:0] reg_nsymbol;
	reg [2:0] reg_ndmrs_1st;
	reg [2:0] reg_nuci_1st;
	//total uci and dmrs
	reg [43:0] total_dmrs_1; //fixed point 22.15 becacause max is 48 with one siged
	reg [43:0] total_dmrs_2;
	reg [43:0] total_uci_1;
	reg [43:0] total_uci_2;
	reg [43:0] reg_total_dmrs_1;
	reg [43:0] reg_total_dmrs_2;
	reg [43:0] reg_total_uci_1;
	reg [43:0] reg_total_uci_2;
	reg  total_valid;
	reg [3:0] cnt_11_dmrs;
	reg [2:0] cnt_7_dmrs;
	reg [3:0] cnt_11_uci;
	reg [2:0] cnt_7_uci;
	reg [3:0] valid_1;
	//find dividents
	reg [31:0] div_dmrs_1;
	reg [31:0] div_dmrs_2;
	reg [31:0] div_uci_1;
	wire [31:0] div_uci_2;
	//multiply
	wire m_axis_dout_tdata_valid;
	wire [79:0] m_axis_dout_tdata1;
	wire [79:0] m_axis_dout_tdata2;
	wire [79:0] m_axis_dout_tdata3;
	wire [79:0] m_axis_dout_tdata4;
	//2means
	wire [63:0] mean_dmrs_1;
	wire [63:0] mean_dmrs_2;
	wire [63:0] mean_uci_1;
	wire [63:0] mean_uci_2;
	//c1st and c2nd
	wire [79:0] m_axis_dout_tdata5;
	wire [79:0] m_axis_dout_tdata6;
	wire [33:0] c1;
	wire [33:0] c2;
	wire [35:0] c_total;
	//signal power I^2+Q^2
	wire [79:0] dout_tdata_1;
	wire [79:0] dout_tdata_2;
	wire [79:0] dout_tdata_3;
	wire [79:0] dout_tdata_4;
	wire [27:0] sig_power_dmrs_1;
	wire [27:0] sig_power_dmrs_2;
	wire [27:0] sig_power_uci_1;
	wire [27:0] sig_power_uci_2;
	//noise power
	wire [31:0] dmrs_1st_fifo;
	reg noise_cnt_valid;
	reg [3:0] noise_cnt_11;
	reg [2:0] noise_cnt;
	reg [63:0] d_mean_dmrs_1;
	wire read_en;
	wire [63:0] noise;
	reg noise_valid;
	//noise power 
	wire noise_power_valid;
	wire [31:0] noise_power;
	wire [79:0] noise_power_80;
	//total noise
	reg [37:0] total_noise;
	reg d_noise_valid;
	wire total_noise_valid;
	//mean noise
	wire [69:0] mean_noise_80;
	wire [31:0] mean_noise;
	reg mean_noise_valid;
	//sinr
	wire [47:0] sinr_48;
	// wire [33:0] c;
	//calculate number symbol for dmrs_1st and dmrs_2nd
	always @(posedge clk) begin
		if (rst) begin
			reg_nsymbol <=0;
			reg_ndmrs_1st <=0;
			reg_nuci_1st <=0;
		end
		else begin
			if (in_valid)
				reg_nsymbol <= uci_nsymbol;
			reg_ndmrs_1st <= reg_nsymbol[3:2]+reg_nsymbol[1];
			reg_nuci_1st <= reg_nsymbol[3:1]-reg_nsymbol[3:2]-reg_nsymbol[1];
		end
		
	end
	//total dmrs_1st, dmrs_2nd, uci_1st, uci_2nd,
	always @(posedge clk) begin
		if (rst) begin
			total_dmrs_1 <= 0;
			total_dmrs_2 <= 0;
			total_uci_1 <= 0;
			total_uci_2 <= 0;
			cnt_11_dmrs <= 0;
			cnt_7_dmrs <= 0;
			cnt_11_uci <= 0;
			cnt_7_uci <= 0;
			//save to register
			reg_total_dmrs_1 <= 0;
			reg_total_dmrs_2 <= 0;
			reg_total_uci_1 <= 0;
			reg_total_uci_2 <= 0;
			total_valid <= 0;
		end
		else begin
			//dmrs
			if (despread_dmrs_valid) begin
				cnt_11_dmrs <= cnt_11_dmrs==11 ? 0: cnt_11_dmrs +1;
				if (cnt_11_dmrs==11)
					cnt_7_dmrs <= cnt_7_dmrs +1;
				if (cnt_7_dmrs < reg_ndmrs_1st) begin
					total_dmrs_1[21:0] <= total_dmrs_1[21:0] + despread_dmrs[15:0] ;
					total_dmrs_1[43:22] <= total_dmrs_1[43:22] + despread_dmrs[31:16] ;
				end
				else begin
					total_dmrs_2[21:0]  <= total_dmrs_2[21:0] + despread_dmrs[15:0] ;
					total_dmrs_2[43:22] <= total_dmrs_2[43:22] + despread_dmrs[31:16] ;
				end
					
				//save to register 
			end else begin
				cnt_11_dmrs <= 0;
				cnt_7_dmrs <=0 ;
				total_dmrs_1 <= 0;
				total_dmrs_2 <=0 ;
			end
			if (cnt_7_dmrs==(reg_nsymbol[3:1]+reg_nsymbol[0])) begin
				reg_total_dmrs_1 <= total_dmrs_1;
				reg_total_dmrs_2 <= total_dmrs_2;
			end
			total_valid <= cnt_7_dmrs==(reg_nsymbol[3:1]+reg_nsymbol[0])&(cnt_7_dmrs!=0);
			//uci
			if (despread_uci_valid) begin
				cnt_11_uci <= cnt_11_uci==11 ? 0: cnt_11_uci +1;
				if (cnt_11_uci==11)
					cnt_7_uci <= cnt_7_uci +1;
				if (cnt_7_uci < reg_nuci_1st) begin
					total_uci_1[21:0] <= total_uci_1[21:0] + despread_uci[15:0] ;
					total_uci_1[43:22] <= total_uci_1[43:22] + despread_uci[31:16] ;
				end
				else begin
					total_uci_2[21:0]  <= total_uci_2[21:0] + despread_uci[15:0] ;
					total_uci_2[43:22] <= total_uci_2[43:22] + despread_uci[31:16] ;
				end
					
				//save to register 
			end else begin
				cnt_11_uci <= 0;
				cnt_7_uci <=0 ;
				total_uci_1 <= 0;
				total_uci_2 <=0 ;
			end
			if (cnt_7_uci==(reg_nsymbol[3:1])) begin
				reg_total_uci_1 <= total_uci_1;
				reg_total_uci_2 <= total_uci_2;
			end
				
		end
	
	end
	//find I^2+Q^2
	sig_power_cmpy_1 sig_power_cmpy_1 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(total_valid),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata({2'd0, reg_total_dmrs_1[43:22], 2'd0, reg_total_dmrs_1[21:0]}),          // input wire [47 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(total_valid),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata({2'd0, -reg_total_dmrs_1[43:22], 2'd0, reg_total_dmrs_1[21:0]}),          // input wire [47 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(sig_power_valid),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(dout_tdata_1)    // output wire [79 : 0] m_axis_dout_tdata
	);
	assign sig_power_dmrs_1 = dout_tdata_1[29:3]+dout_tdata_1[69:43];
	sig_power_cmpy_2 sig_power_cmpy_2 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(total_valid),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata({2'd0, reg_total_dmrs_2[43:22], 2'd0, reg_total_dmrs_2[21:0]}),          // input wire [47 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(total_valid),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata({2'd0, -reg_total_dmrs_2[43:22], 2'd0, reg_total_dmrs_2[21:0]}),          // input wire [47 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(dout_tdata_2)    // output wire [79 : 0] m_axis_dout_tdata
	);
	assign sig_power_dmrs_2 = dout_tdata_2[29:3]+dout_tdata_2[69:43];
	sig_power_cmpy_3 sig_power_cmpy_3 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(total_valid),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata({2'd0, reg_total_uci_1[43:22], 2'd0, reg_total_uci_1[21:0]}),          // input wire [47 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(total_valid),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata({2'd0, -reg_total_uci_1[43:22], 2'd0, reg_total_uci_1[21:0]}),          // input wire [47 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(dout_tdata_3)    // output wire [79 : 0] m_axis_dout_tdata
	);
	assign sig_power_uci_1 = dout_tdata_3[29:3]+dout_tdata_3[69:43];
	sig_power_cmpy_4 sig_power_cmpy_4 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(total_valid),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata({2'd0, reg_total_uci_2[43:22], 2'd0, reg_total_uci_2[21:0]}),          // input wire [47 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(total_valid),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata({2'd0, -reg_total_uci_2[43:22], 2'd0, reg_total_uci_2[21:0]}),          // input wire [47 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(dout_tdata_4)    // output wire [79 : 0] m_axis_dout_tdata
	);
	assign sig_power_uci_2 = dout_tdata_4[29:3]+dout_tdata_4[69:43];
	//signal power
	assign sig_power = sig_power_dmrs_1 + sig_power_dmrs_2 + sig_power_uci_1 +sig_power_uci_2 ;
	//----------------------------------------------------------------\
	//Noise power
	//Noise = despread_dmrs_1st - MeanDmrs_1st
	//save despread_dmrs_1st to fifo
	mean_data_fifo0 mean_data_fifo0 (
	  .clk(clk),                  // input wire clk
	  .srst(rst),                // input wire srst
	  .din(despread_dmrs),                  // input wire [31 : 0] din
	  .wr_en(despread_dmrs_valid&(cnt_7_dmrs < reg_ndmrs_1st)),              // input wire wr_en
	  .rd_en(read_en),              // input wire rd_en
	  .dout(dmrs_1st_fifo),                // output wire [31 : 0] dout
	  .full(),                // output wire full
	  .empty(),              // output wire empty
	  .wr_rst_busy(),  // output wire wr_rst_busy
	  .rd_rst_busy()  // output wire rd_rst_busy
	);

	//synchronosize fifo and mean_dmrs_1st
	always @(posedge clk) begin
		if (rst) begin
			noise_cnt_11 <= 0;
			noise_cnt <= 0;
			noise_cnt_valid <= 0;
			d_mean_dmrs_1 <= 0;
			noise_valid <= 0;
		end
		else begin
			if (m_axis_dout_tdata_valid)
				noise_cnt_valid <= 1;
			else if (noise_cnt >= reg_ndmrs_1st)
				noise_cnt_valid <= 0;
			if (noise_cnt_valid) begin
				noise_cnt_11 <= (noise_cnt_11==11) ? 0 : noise_cnt_11+1;
				if (noise_cnt_11==11)
					noise_cnt <= noise_cnt + 1;
			end else begin
				noise_cnt_11 <= 0;
				noise_cnt <= 0;
			end
			if (m_axis_dout_tdata_valid)
				d_mean_dmrs_1 <= mean_dmrs_1;
			noise_valid <= read_en;
		end
	end
	//rd_en and find noise
	assign read_en = noise_cnt_valid&&noise_cnt < reg_ndmrs_1st;
	assign noise[31:0] = { dmrs_1st_fifo[15:0], 16'd0} - d_mean_dmrs_1[31:0];
	assign noise[63:32] = {dmrs_1st_fifo[31:16], 16'd0} - d_mean_dmrs_1[63:32] + 32'd214748364;
	//power noise
	power_cmpy_0 power_cmpy_0 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(noise_valid),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata({noise[63:32],noise[31:0]}),          // input wire [63 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(noise_valid),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata({-noise[63:32],noise[31:0]}),          // input wire [63 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(noise_power_valid),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(noise_power_80)    // output wire [79 : 0] m_axis_dout_tdata
	);
	assign noise_power = {noise_power_80[77], noise_power_80[77:47]} + {noise_power_80[37], noise_power_80[37:7]};
	//total noise power
	always @(posedge clk) begin
		if (rst) begin
			total_noise <= 0;
			d_noise_valid <= 0;
			mean_noise_valid <= 0;
		end
		else begin
			if (noise_power_valid) begin
				total_noise <= total_noise +  noise_power;
			end
			d_noise_valid <= noise_power_valid;
			mean_noise_valid <= total_noise_valid;
		end
	end
	assign total_noise_valid = d_noise_valid&(!noise_power_valid);

	// mean_noise
	mean_noise_mult_0 mean_noise_mult_0 (
	  .CLK(clk),  // input wire CLK
	  .A(total_noise),      // input wire [37 : 0] A
	  .B(div_dmrs_1),      // input wire [31 : 0] B
	  .P(mean_noise_80)      // output wire [69 : 0] P
	);
	assign mean_noise = mean_noise_80[62:31];
	// find sinr
	// mean_data_div_gen_0 mean_data_div_gen_0 (
	  // .aclk(clk),                                      // input wire aclk
	  // .s_axis_divisor_tvalid(mean_noise_valid),    // input wire s_axis_divisor_tvalid
	  // .s_axis_divisor_tdata({2'd0, sig_power}),      // input wire [31 : 0] s_axis_divisor_tdata
	  // .s_axis_dividend_tvalid(mean_noise_valid),  // input wire s_axis_dividend_tvalid
	  // .s_axis_dividend_tdata(mean_noise),    // input wire [31 : 0] s_axis_dividend_tdata
	  // .m_axis_dout_tvalid(sinr_valid),          // output wire m_axis_dout_tvalid
	  // .m_axis_dout_tdata(sinr_48)            // output wire [63 : 0] m_axis_dout_tdata
	// );
	
	mean_data_div_gen_0 mean_data_div_gen_0 (
	  .aclk(clk),                                      // input wire aclk
	  .s_axis_divisor_tvalid(mean_noise_valid),    // input wire s_axis_divisor_tvalid
	  .s_axis_divisor_tready(),    // output wire s_axis_divisor_tready
	  .s_axis_divisor_tdata({2'd0, sig_power}),      // input wire [31 : 0] s_axis_divisor_tdata
	  .s_axis_dividend_tvalid(mean_noise_valid),  // input wire s_axis_dividend_tvalid
	  .s_axis_dividend_tready(),  // output wire s_axis_dividend_tready
	  .s_axis_dividend_tdata(mean_noise),    // input wire [31 : 0] s_axis_dividend_tdata
	  .m_axis_dout_tvalid(sinr_valid),          // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(sinr_48)            // output wire [47 : 0] m_axis_dout_tdata
	);
	assign sinr = sinr_48[61:30] ; 
	
	 //select dividents
	assign div_uci_2 = div_dmrs_1;
	 always @(*) begin
		case (reg_nuci_1st)
			1: begin//1:1
				div_uci_1= 178956970;
				if (reg_nsymbol[1])
					div_dmrs_1 = 89478485;
				else
					div_dmrs_1 = 178956970;
				if (reg_nsymbol[0])
					div_dmrs_2 = 89478485;
				else
					div_dmrs_2 = 178956970;
				
			end
			2: begin//dmrs=1, if symbol/2 =- 1 --dmrs2=1 else dmrs2=2
				div_uci_1= 89478485;
				if (reg_nsymbol[1])
					div_dmrs_1 = 59652323;
				else
					div_dmrs_1 = 89478485;
				if (reg_nsymbol[0])
					div_dmrs_2 = 59652323;
				else
					div_dmrs_2 = 89478485;
			end
			3: begin//dmrs=3, if symbol/2 == 1 --dmrs2=2 else dmrs2=3
				div_uci_1= 59652323;
				if (reg_nsymbol[1])
					div_dmrs_1 = 44739242;
				else
					div_dmrs_1 = 59652323;
				if (reg_nsymbol[0])
					div_dmrs_2 = 44739242;
				else
					div_dmrs_2 = 59652323;
			end
			default: begin
				div_uci_1 = 178956970;
				div_dmrs_1 = 178956970;
				div_dmrs_2 = 178956970;
			end
		endcase
	 end
	//muptiply with dividents to find means
	mean_data_cmpy_1 mean_data_cmpy_1 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(total_valid),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata({2'd0, reg_total_dmrs_1[43:22], 2'd0, reg_total_dmrs_1[21:0]}),          // input wire [47 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(total_valid),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata({32'd0, div_dmrs_1}),          // input wire [63 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(m_axis_dout_tdata_valid),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(m_axis_dout_tdata1)    // output wire [79 : 0] m_axis_dout_tdata
	);
	assign mean_dmrs_1 = {m_axis_dout_tdata1[71:40], m_axis_dout_tdata1[31:0]};
	mean_data_cmpy_2 mean_data_cmpy_2 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(total_valid),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata({2'd0, reg_total_dmrs_2[43:22], 2'd0, reg_total_dmrs_2[21:0]}),          // input wire [47 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(total_valid),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata({32'd0, div_dmrs_2}),          // input wire [63 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(m_axis_dout_tdata2)    // output wire [79 : 0] m_axis_dout_tdata
	);
	assign mean_dmrs_2 = {m_axis_dout_tdata2[71:40], m_axis_dout_tdata2[31:0]};
	mean_data_cmpy_3 mean_data_cmpy_3 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(total_valid),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata({2'd0, reg_total_uci_1[43:22], 2'd0, reg_total_uci_1[21:0]}),          // input wire [47 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(total_valid),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata({32'd0, div_uci_1}),          // input wire [63 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(m_axis_dout_tdata3)    // output wire [79 : 0] m_axis_dout_tdata
	);
	assign mean_uci_1 = {m_axis_dout_tdata3[71:40], m_axis_dout_tdata3[31:0]};
	mean_data_cmpy_4 mean_data_cmpy_4 (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(total_valid),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata({2'd0, reg_total_uci_2[43:22], 2'd0, reg_total_uci_2[21:0]}),          // input wire [47 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(total_valid),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata({32'd0, div_uci_2}),          // input wire [63 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(m_axis_dout_tdata4)    // output wire [79 : 0] m_axis_dout_tdata
	);
	assign mean_uci_2 = {m_axis_dout_tdata4[71:40], m_axis_dout_tdata4[31:0]};
	//find c1 and c2
	c1_cmpy c1_cmpy (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(m_axis_dout_tdata_valid),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(mean_uci_1),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(m_axis_dout_tdata_valid),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata({-mean_dmrs_1[31:16], mean_dmrs_1[15:0]}),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(o_mean_data_valid),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(m_axis_dout_tdata5)    // output wire [79 : 0] m_axis_dout_tdata
	);
	assign c1 = {m_axis_dout_tdata5[71:55], m_axis_dout_tdata5[31:15]};
	c1_cmpy c2_cmpy (
	  .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(m_axis_dout_tdata_valid),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(mean_uci_2),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(m_axis_dout_tdata_valid),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata({-mean_dmrs_2[31:16], mean_dmrs_2[15:0]}),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(m_axis_dout_tdata6)    // output wire [79 : 0] m_axis_dout_tdata
	);
	assign c2 = {m_axis_dout_tdata6[71:55], m_axis_dout_tdata6[31:15]};
	//find c
	assign c_total[17:0] = {c1[16], c1[16:0]} + {c2[16], c2[16:0]};
	assign c_total[35:18] = {c1[33], c1[33:17]} + {c2[33], c2[33:17]};
	assign o_mean_data = {c_total[35:19],c_total[17:1]};
endmodule
