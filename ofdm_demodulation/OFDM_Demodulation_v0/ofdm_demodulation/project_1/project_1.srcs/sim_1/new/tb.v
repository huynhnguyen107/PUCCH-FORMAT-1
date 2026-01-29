`timescale 1ns/1ps
module tb;

  // ===== Clock & reset =====
  reg i_start_symbol;
  reg clk, rst;                 // rst is ACTIVE-HIGH (assert=1, deassert=0)
  initial clk = 0;
  always #0.5 clk = ~clk;         // 100 MHz

  // ===== DUT I/O =====
  reg  		  [11:0] i_trigger_cp;
  reg signed [15:0] i_imag_pucch_ofdm, i_real_pucch_ofdm;  // signed 16.15 in two’s-complement

  wire signed [15:0] o_imag_pucch_ofdm, o_real_pucch_ofdm; // signed 16.15 in two’s-complement
  wire               o_valid;

  // ===== Sample memory (loaded from files) =====
  // Set this to the number of samples in your .mem files
  localparam integer NUM_SAMPLES = 2457600;   //  length

  reg [15:0] I_mem [0:NUM_SAMPLES-1];  // raw 16-bit words from I.mem
  reg [15:0] Q_mem [0:NUM_SAMPLES-1];  // raw 16-bit words from Q.mem
  integer idx;
  integer n, cycle, slot;

  // ===== Read stimulus files =====
  initial begin
    // Each line in I.mem / Q.mem is a 4-hex-digit word, e.g. 0003, FFFF, 7FFF...
    $readmemh("D:/5G/send_bang/genarate_data_PUCCH_100MHz/genarate_data_PUCCH_100MHz/16_15convert/I.mem", I_mem);
    $readmemh("D:/5G/send_bang/genarate_data_PUCCH_100MHz/genarate_data_PUCCH_100MHz/16_15convert/Q.mem", Q_mem);
  end

  // ===== Instantiate DUT =====
  fft fft_v0 (
    .clk               (clk),
    .rst               (rst),               // active-high
    .i_trigger_cp      (i_trigger_cp),
    .i_start_symbol    (i_start_symbol),
    .i_imag_pucch_ofdm (i_imag_pucch_ofdm),
    .i_real_pucch_ofdm (i_real_pucch_ofdm),
    .o_imag_pucch_ofdm (o_imag_pucch_ofdm),
    .o_real_pucch_ofdm (o_real_pucch_ofdm),
    .o_valid           (o_valid)
  );

    // Reset sequence
  initial begin
    rst = 1;
	i_trigger_cp = 0; i_start_symbol = 0;
    i_real_pucch_ofdm = 0; i_imag_pucch_ofdm = 0;
    #50;         // hold reset for 50 ns
    rst = 0;   // release reset
  end
  
  initial begin

	wait(!rst);      
	for (slot = 0; slot < 19; slot= slot +1) begin
		// 1-cycle pulse
		 @(posedge clk) begin
		  i_trigger_cp   <= 352;
		  i_start_symbol <= (slot==4|slot==9|slot==14|slot==19) ? 1:0;
		end
		@(posedge clk) begin
			i_start_symbol <= 0;
		end
		//symbol 0 cp 352
		for (cycle = 0; cycle < 4384+352-288-2; cycle = cycle + 1) @(posedge clk);
		//symbol from 1-13 -cp 288
		for (n = 0; n < 13; n = n + 1) begin
			// 1-cycle pulse
			@(posedge clk) begin
				i_start_symbol <= (slot==4|slot==9|slot==14|slot==19) ? 1:0;
				i_trigger_cp   <= 288;
			end 
			@(posedge clk) i_start_symbol <= 0;
			for (cycle = 0; cycle < 4384-2; cycle = cycle + 1) @(posedge clk);
		  end
	end  
	
  end
  
  initial begin
	wait(!rst); //wait release reset
	// stream I/Q samples: one per cycle 
    for (idx = 0; idx < NUM_SAMPLES; idx = idx + 1) begin
      @(posedge clk);
      // Treat the loaded words as two’s-complement signed by assigning to signed regs
      i_real_pucch_ofdm <= I_mem[idx];
      i_imag_pucch_ofdm <= Q_mem[idx];
    end
  
  
  end

  // ===== Optional waveform dump =====
  // initial begin
    // $dumpfile("tb_fft.vcd");
    // $dumpvars(0, tb);
  // end

endmodule
