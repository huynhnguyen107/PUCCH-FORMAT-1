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


// IP VLNV: xilinx.com:user:payload_est_SINR:1.0
// IP Revision: 6

(* X_CORE_INFO = "payload_est_SINR,Vivado 2019.2" *)
(* CHECK_LICENSE_TYPE = "pucch1_payload_est_SINR_0_0,payload_est_SINR,{}" *)
(* CORE_GENERATION_INFO = "pucch1_payload_est_SINR_0_0,payload_est_SINR,{x_ipProduct=Vivado 2019.2,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=payload_est_SINR,x_ipVersion=1.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,RX=4}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module pucch1_payload_est_SINR_0_0 (
  clk,
  rst,
  in_valid,
  uci_modulation,
  mean_data_valid,
  mean_data,
  sinr_valid,
  sinr,
  payload_valid,
  payload,
  mean_sinr_valid,
  mean_sinr
);

input wire clk;
input wire rst;
input wire in_valid;
input wire uci_modulation;
input wire mean_data_valid;
input wire [135 : 0] mean_data;
input wire sinr_valid;
input wire [255 : 0] sinr;
output wire payload_valid;
output wire [1 : 0] payload;
output wire mean_sinr_valid;
output wire [63 : 0] mean_sinr;

  payload_est_SINR #(
    .RX(4)
  ) inst (
    .clk(clk),
    .rst(rst),
    .in_valid(in_valid),
    .uci_modulation(uci_modulation),
    .mean_data_valid(mean_data_valid),
    .mean_data(mean_data),
    .sinr_valid(sinr_valid),
    .sinr(sinr),
    .payload_valid(payload_valid),
    .payload(payload),
    .mean_sinr_valid(mean_sinr_valid),
    .mean_sinr(mean_sinr)
  );
endmodule
