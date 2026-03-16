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


// IP VLNV: xilinx.com:user:ulcch_parameter:1.0
// IP Revision: 3

(* X_CORE_INFO = "ulcch_parameter,Vivado 2019.2" *)
(* CHECK_LICENSE_TYPE = "pucch1_ulcch_parameter_0_0,ulcch_parameter,{}" *)
(* CORE_GENERATION_INFO = "pucch1_ulcch_parameter_0_0,ulcch_parameter,{x_ipProduct=Vivado 2019.2,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=ulcch_parameter,x_ipVersion=1.0,x_ipCoreRevision=3,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module pucch1_ulcch_parameter_0_0 (
  clk,
  rst,
  i_pucch_valid,
  ulcch_para,
  i_config_valid,
  i_group_hopping,
  i_hopping_ID,
  pucch_valid,
  uci_slot_idx,
  uci_rnti,
  uci_nid,
  uci_srflag,
  uci_frist_symbol,
  uci_pbr_offset,
  uci_second_prb,
  uci_prb,
  uci_symbol,
  uci_intra_fre_hopping,
  uci_m0,
  uci_ack,
  config_valid,
  group_hopping,
  hopping_ID
);

input wire clk;
input wire rst;
input wire i_pucch_valid;
input wire [511 : 0] ulcch_para;
input wire i_config_valid;
input wire [7 : 0] i_group_hopping;
input wire [15 : 0] i_hopping_ID;
output wire pucch_valid;
output wire [15 : 0] uci_slot_idx;
output wire [15 : 0] uci_rnti;
output wire [15 : 0] uci_nid;
output wire [7 : 0] uci_srflag;
output wire [7 : 0] uci_frist_symbol;
output wire [15 : 0] uci_pbr_offset;
output wire [15 : 0] uci_second_prb;
output wire [15 : 0] uci_prb;
output wire [7 : 0] uci_symbol;
output wire [7 : 0] uci_intra_fre_hopping;
output wire [15 : 0] uci_m0;
output wire [15 : 0] uci_ack;
output wire config_valid;
output wire [7 : 0] group_hopping;
output wire [15 : 0] hopping_ID;

  ulcch_parameter inst (
    .clk(clk),
    .rst(rst),
    .i_pucch_valid(i_pucch_valid),
    .ulcch_para(ulcch_para),
    .i_config_valid(i_config_valid),
    .i_group_hopping(i_group_hopping),
    .i_hopping_ID(i_hopping_ID),
    .pucch_valid(pucch_valid),
    .uci_slot_idx(uci_slot_idx),
    .uci_rnti(uci_rnti),
    .uci_nid(uci_nid),
    .uci_srflag(uci_srflag),
    .uci_frist_symbol(uci_frist_symbol),
    .uci_pbr_offset(uci_pbr_offset),
    .uci_second_prb(uci_second_prb),
    .uci_prb(uci_prb),
    .uci_symbol(uci_symbol),
    .uci_intra_fre_hopping(uci_intra_fre_hopping),
    .uci_m0(uci_m0),
    .uci_ack(uci_ack),
    .config_valid(config_valid),
    .group_hopping(group_hopping),
    .hopping_ID(hopping_ID)
  );
endmodule
