// (c) Copyright 1995-2026 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:ba_seq_control:1.0
// IP Revision: 2

(* X_CORE_INFO = "ba_seq_control,Vivado 2019.2" *)
(* CHECK_LICENSE_TYPE = "pucch1_ba_seq_control_0_0,ba_seq_control,{}" *)
(* CORE_GENERATION_INFO = "pucch1_ba_seq_control_0_0,ba_seq_control,{x_ipProduct=Vivado 2019.2,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=ba_seq_control,x_ipVersion=1.0,x_ipCoreRevision=2,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module pucch1_ba_seq_control_0_0 (
  clk,
  rst,
  basequence_valid_0,
  basequence_0,
  basequence_valid_1,
  basequence_1,
  nfs_0,
  nfs_1,
  nfs_valid,
  start_en,
  basequence_out_valid,
  basequence_out
);

input wire clk;
input wire rst;
input wire basequence_valid_0;
input wire [31 : 0] basequence_0;
input wire basequence_valid_1;
input wire [31 : 0] basequence_1;
input wire [2 : 0] nfs_0;
input wire [2 : 0] nfs_1;
input wire nfs_valid;
input wire start_en;
output wire basequence_out_valid;
output wire [31 : 0] basequence_out;

  ba_seq_control inst (
    .clk(clk),
    .rst(rst),
    .basequence_valid_0(basequence_valid_0),
    .basequence_0(basequence_0),
    .basequence_valid_1(basequence_valid_1),
    .basequence_1(basequence_1),
    .nfs_0(nfs_0),
    .nfs_1(nfs_1),
    .nfs_valid(nfs_valid),
    .start_en(start_en),
    .basequence_out_valid(basequence_out_valid),
    .basequence_out(basequence_out)
  );
endmodule
