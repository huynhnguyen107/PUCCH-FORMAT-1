`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 12/24/2025 08:02:31 PM
// Design Name: cylic shift generator
// Module Name: cylic_shift_generator
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  mutiply phase and base sequence
// 
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module cyclic_gen(
	input clk,
	input rst,
	input in_valid,
	input [10:0] uci_nID,
	input [4:0] uci_slot,
	input [3:0] uci_first_symbol,
	input  uci_sym_alloc,
	input [3:0] uci_m0,
	input [1:0] uci_ack,
	input [1:0] uci_grouphopping,
	input  uci_nhop,
	output cyclic_shift_valid,
	output [31:0] cyclic_shift
    );
	wire [31:0] base_sequence;
	wire base_sequence_valid;
	wire [31:0] phase;
	wire phase_valid;
	//fifo
	wire [31:0] fifo_base;
	reg [31:0] d_phase;
	reg d_phase_valid;
	//pre_cyclic
	wire [63:0] pre_cyclic_temp;
	wire [31:0] pre_cyclic;
	wire pre_cyclic_valid;
	// ack
	reg [1:0] reg_uci_ack;
	reg [6:0] select_cnt;
	reg  select_valid;
	reg  d_pre_cyclic_valid;
	reg [31:0] d_pre_cyclic;
	ba_se_0 ba_se_0 (
	  .clk(clk),                                  // input wire clk
	  .rst(rst),                                  // input wire rst
	  .in_valid(in_valid),                        // input wire in_valid
	  .uci_slot(uci_slot),                        // input wire [4 : 0] uci_slot
	  .uci_grouphopping(uci_grouphopping),        // input wire [1 : 0] uci_grouphopping
	  .uci_nID(uci_nID),                          // input wire [10 : 0] uci_nID
	  .uci_nhop(uci_nhop),                        // input wire uci_nhop
	  .base_sequence(base_sequence),              // output wire [31 : 0] base_sequence
	  .base_sequence_valid(base_sequence_valid)  // output wire base_sequence_valid
	);
	cyc_phase_gen_0 cyc_phase_gen_0 (
	  .clk(clk),                            // input wire clk
	  .rst(rst),                            // input wire rst
	  .in_valid(in_valid),                  // input wire in_valid
	  .uci_NID(uci_nID),                    // input wire [10 : 0] uci_nID
	  .uci_slot(uci_slot),                  // input wire [4 : 0] uci_slot
	  .uci_first_symbol(uci_first_symbol),  // input wire [3 : 0] uci_first_symbol
	  .uci_sym_alloc(uci_sym_alloc),        // input wire uci_sym_alloc
	  .uci_m0(uci_m0),                      // input wire [3 : 0] uci_m0
	  .uci_ack(uci_ack),                    // input wire [1 : 0] uci_ack
	  .phase_valid(phase_valid),            // output wire phase_valid
	  .phase(phase)                        // output wire [32 : 0] phase
	);
	//save base sequence to fifo to synchronize with phase
	cyclic_fifo_generator_0 cyclic_fifo_generator_0 (
	  .clk(clk),      // input wire clk
	  .din(base_sequence),      // input wire [31 : 0] din
	  .wr_en(base_sequence_valid),  // input wire wr_en
	  .rd_en(phase_valid),  // input wire rd_en
	  .dout(fifo_base),    // output wire [31 : 0] dout
	  .full(),    // output wire full
	  .empty()  // output wire empty
	);
	always @(posedge clk)
		if (rst) begin
			d_phase_valid <=0;
			d_phase <=0;
		end
		else begin
			d_phase_valid <= phase_valid;
			d_phase <= phase;
		end
	//complex mutiply base_sequence and phase_generator
	cyclic_cmpy_0 cyclic_cmpy_0 (
	   .aclk(clk),                              // input wire aclk
	  .s_axis_a_tvalid(d_phase_valid),        // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(fifo_base),          // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(d_phase_valid),        // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(d_phase),          // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_dout_tvalid(pre_cyclic_valid),  // output wire m_axis_dout_tvalid
	  .m_axis_dout_tdata(pre_cyclic_temp)    // output wire [63 : 0] m_axis_dout_tdata
	);

	assign pre_cyclic = {pre_cyclic_temp[60:45], pre_cyclic_temp[28:13]};
	// ack selection
	// =2 data in from 0-95
	//=1 data in from 0-47 and fill 0 from 48-95
	always @(posedge clk)
		if (rst) begin
			select_cnt <= 0;
			select_valid <= 0;
			d_pre_cyclic <= 0;
			d_pre_cyclic_valid <= 0;
			reg_uci_ack <=0;
		end
		else begin
			if (in_valid)
				reg_uci_ack <= uci_ack;
			d_pre_cyclic_valid <= pre_cyclic_valid;
			if (pre_cyclic_valid) begin
				d_pre_cyclic <= pre_cyclic;
				select_cnt <= select_cnt +1;
				select_valid <= select_cnt <48;
			end
			else begin
				d_pre_cyclic <= 0;
				select_cnt <= 0;
			end
		end
	assign cyclic_shift_valid = d_pre_cyclic_valid;
	assign cyclic_shift = reg_uci_ack==1 ? (select_valid ? d_pre_cyclic: 32'd0): d_pre_cyclic;
	
endmodule
