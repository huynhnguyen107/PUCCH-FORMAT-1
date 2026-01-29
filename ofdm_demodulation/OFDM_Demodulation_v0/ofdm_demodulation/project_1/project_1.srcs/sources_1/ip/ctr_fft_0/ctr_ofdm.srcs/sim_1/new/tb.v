`timescale 1ns/1ps

module tb ();
  // Clock & reset
  reg clk;
  reg rst;
  //valid
  reg i_start_symbol;
  reg [11:0] i_trigger_cp;
  reg [15:0] i_img_pucch_ofdm;
  //output
  wire o_data_valid;

  // Generate 100 MHz clock (10 ns period)
  initial clk = 1'b0;
  always #0.5 clk = ~clk;

  // Reset sequence
  initial begin
    rst = 1;
    i_start_symbol = 0;
    i_trigger_cp = 0;
    i_img_pucch_ofdm = 0;
    #50;         // hold reset for 50 ns
    rst = 0;   // release reset
  end

  // Instantiate DUT 
	ctr_fft ctr_fft_0(clk, rst, i_trigger_cp, i_start_symbol, i_img_pucch_ofdm, i_real_pucch_ofdm, 
					o_imag_pucch_ofdm, o_real_pucch_ofdm, o_data_valid);

  // Stimulus
  initial begin
    wait(!rst);          // wait until reset deasserted
    @(posedge clk) begin
		i_start_symbol <= 1;
		i_trigger_cp  <= 352;
		i_img_pucch_ofdm <= 16384;
	end
    @(posedge clk);
    i_start_symbol <= 0;           // stop sending
    #44960;
	@(posedge clk) begin
		i_start_symbol <= 0;
		i_trigger_cp  <= 288;
	end
	@(posedge clk)
	i_start_symbol <= 0;
	#44960;
    //$finish;
  end

endmodule
