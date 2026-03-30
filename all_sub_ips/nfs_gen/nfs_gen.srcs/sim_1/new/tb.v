`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Van-Huynh Nguyen-nvhuynh107@gmail.com
// 
// Create Date: 02/28/2026 02:42:22 PM
// Design Name: n_fs tb
// Module Name: tb
// Project Name: PUCCH-FORMAT-0
// Target Devices: VCU108
// Tool Versions: Vivado2019a
// Description: generate nfs for uci and dmrs
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module tb(      
    );
    reg clk;
    reg rst;
    reg in_valid;
    reg in_uci_flag;
    reg [3:0] uci_nSymbs;
    reg uci_intra_fr_hop;
	wire [2:0] nfs_0;
	wire [2:0] nfs_1;
	wire nfs_valid;
	
	//call instance
    nfs_gen nfs_gen0 (clk, rst, in_valid, in_uci_flag,  uci_nSymbs, uci_intra_fr_hop, nfs_0, nfs_1, nfs_valid);
	
	//intitial all signals and create rst
    initial begin
		clk=0;
		rst=1;
		in_valid=0;
		in_uci_flag=0;
		uci_nSymbs=0;
		uci_intra_fr_hop=0;
		#10 rst=0;
    end
    //create clock
    always #0.5 clk=!clk;
	//create others
    initial begin
		wait(!rst)
        @(posedge clk) begin
            in_valid <= 1;
            in_uci_flag <= 1;
            uci_nSymbs <= 4;
            uci_intra_fr_hop <= 0;
        end
		@(posedge clk) begin
            in_valid <= 0;
            in_uci_flag <= 0;
            uci_nSymbs <= 0;
            uci_intra_fr_hop <= 0;
        end
    end
endmodule
