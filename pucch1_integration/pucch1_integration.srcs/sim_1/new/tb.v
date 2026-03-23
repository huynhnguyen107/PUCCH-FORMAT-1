`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 03/17/2026 07:04:04 PM
// Design Name: tb
// Module Name: pucch1_integration
// Project Name: PUCCH-FORMAT-1
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description:  PUCCH 1 integration with all IPs
// Dependencies: N/A
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module tb();
	reg clk;
	reg rst; 
	reg trigger_05; 
	reg stop_trigger; 
	reg i_pucch1_valid; 
	reg i_config_valid; 
	reg [7:0]i_group_hopping; 
	reg [15:0]i_hopping_ID; 
	reg [511:0]pucch_parameter; 
	wire [255:0]ant_input; 
	wire o_valid; 
	wire dtx; 
	wire [1:0]harq; 
	wire sr;
	//set pucch_parameter
	wire [511:0] wire_pucch_parameter;
	reg [511:0] uci_param_mem[0:0] ;
	
	// antenna data
	reg signed [15:0] i_imag_pucch_ofdm, i_real_pucch_ofdm;  
	// loaded from files
	localparam integer NUM_SAMPLES = 2457600; 
	reg [15:0] I_mem [0:NUM_SAMPLES-1];  
	reg [15:0] Q_mem [0:NUM_SAMPLES-1];  
	integer idx=0;
	integer n;
	//read uci_param
	initial begin
		$readmemh("D:/FPGA/Vivaldo Project/PUCCH-FORMAT-1/TEST/case3/uci_param.mem", uci_param_mem);
	end
	// assign wire_pucch_parameter = (idx > 1) ? uci_param_mem[0] : 512'd0;
	assign wire_pucch_parameter = uci_param_mem[0];
	//read I, Q
	initial begin
	$readmemh("D:/FPGA/Vivaldo Project/PUCCH-FORMAT-1/TEST/case3/I.mem", I_mem);
	$readmemh("D:/FPGA/Vivaldo Project/PUCCH-FORMAT-1/TEST/case3/Q.mem", Q_mem);
	end
	assign ant_input = {8{i_imag_pucch_ofdm, i_real_pucch_ofdm}};
	//call instance
	pucch1_integration pucch1_integration
		(.ant_input(ant_input),
		.clk(clk),
		.dtx(dtx),
		.harq(harq),
		.i_config_valid(i_config_valid),
		.i_group_hopping(i_group_hopping),
		.i_hopping_ID(i_hopping_ID),
		.i_pucch1_valid(i_pucch1_valid),
		.o_valid(o_valid),
		.pucch_parameter(pucch_parameter),
		.rst(rst),
		.sr(sr),
		.stop_trigger(stop_trigger),
		.trigger_05(trigger_05)
	);
	// create rst and initial other signals
	initial begin
		rst =1;
		clk =0;
		trigger_05 =0;
		stop_trigger =0;
		i_pucch1_valid =0;
		i_config_valid =0;
		i_group_hopping =0;
		i_hopping_ID =0;
		pucch_parameter =0;
		i_imag_pucch_ofdm =0;
		i_real_pucch_ofdm =0;
	#50 rst=0;
	end
	// create clk
	always #0.5 clk=!clk;
	// initial other sìgnals
	initial begin
		wait (!rst)
		//stop trigger
		@(posedge clk) begin
			stop_trigger <=1;
		end
		@(posedge clk) begin
			stop_trigger <=0;
		end
		@(posedge clk) begin
			i_pucch1_valid <=1;
			i_config_valid <=1;
			i_group_hopping <=0;
			i_hopping_ID <=0;
			pucch_parameter <=wire_pucch_parameter;
		end
		@(posedge clk) begin
			i_pucch1_valid <=0;
			i_config_valid <=0;
			i_group_hopping <=0;
			i_hopping_ID <=0;
			pucch_parameter <=0;
		end
		//500 clock cycles do nothing
		for (idx = 0; idx < 500; idx = idx + 1) 
        @(posedge clk);
		//start antenna data
		for (idx = 0; idx < NUM_SAMPLES; idx = idx + 1) begin
			@(posedge clk) begin
				//trigger 0.5ms
				if (idx % 61440==0)
				   trigger_05 <= 1;
				else
				   trigger_05 <= 0;
				 // start antenna data
				if (idx>=6) begin
					i_real_pucch_ofdm <= I_mem[idx-6];
					i_imag_pucch_ofdm <= Q_mem[idx-6];
					end
				//valid at slot 5,10,15,0....
				if (idx % (1228800-61440)==0 & idx>0) begin //next valid is slot 13 for data in slot 0 in next frame
					i_group_hopping <=0;
					i_hopping_ID <=0;
					i_config_valid <=1;
					pucch_parameter <=wire_pucch_parameter;
					i_pucch1_valid <=1;
				end
				else begin
					i_group_hopping <=0;
					i_hopping_ID <=0;
					i_config_valid <=0;
					pucch_parameter <=0;
					i_pucch1_valid <=0;
				end
			end
		end
	end
endmodule
