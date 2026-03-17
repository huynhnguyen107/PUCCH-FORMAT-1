
################################################################
# This is a generated script based on design: pucch1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source pucch1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcvu9p-flga2104-2L-e
   set_property BOARD_PART xilinx.com:vcu118:part0:2.3 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name pucch1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: cyclic_uci
proc create_hier_cell_cyclic_uci { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_cyclic_uci() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I clk
  create_bd_pin -dir I in_valid
  create_bd_pin -dir O -from 2 -to 0 nfs_0
  create_bd_pin -dir O -from 2 -to 0 nfs_1
  create_bd_pin -dir O nfs_valid
  create_bd_pin -dir I rst
  create_bd_pin -dir I -from 15 -to 0 uci_NID
  create_bd_pin -dir O -from 31 -to 0 uci_cyclic
  create_bd_pin -dir O uci_cyclic_valid
  create_bd_pin -dir I -from 7 -to 0 uci_first_symbol
  create_bd_pin -dir I -from 7 -to 0 uci_grouphopping
  create_bd_pin -dir I -from 7 -to 0 uci_intra_fr_hop
  create_bd_pin -dir I -from 15 -to 0 uci_m0
  create_bd_pin -dir I -from 7 -to 0 uci_nSymbs
  create_bd_pin -dir I -from 15 -to 0 uci_slot
  create_bd_pin -dir O wise_enable

  # Create instance: ba_seq_control_0, and set properties
  set ba_seq_control_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:ba_seq_control:1.0 ba_seq_control_0 ]

  # Create instance: base_sequence_0, and set properties
  set base_sequence_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:base_sequence:1.0 base_sequence_0 ]

  # Create instance: base_sequence_1, and set properties
  set base_sequence_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:base_sequence:1.0 base_sequence_1 ]

  # Create instance: com_mul_cyclic_0, and set properties
  set com_mul_cyclic_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:com_mul_cyclic:1.0 com_mul_cyclic_0 ]

  # Create instance: mcs, and set properties
  set mcs [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 mcs ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {4} \
 ] $mcs

  # Create instance: n_cs_gen_0, and set properties
  set n_cs_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:n_cs_gen:1.0 n_cs_gen_0 ]

  # Create instance: nfs_gen_0, and set properties
  set nfs_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:nfs_gen:1.0 nfs_gen_0 ]

  # Create instance: phase_gen_0, and set properties
  set phase_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:phase_gen:1.0 phase_gen_0 ]

  # Create instance: phase_gen_control_0, and set properties
  set phase_gen_control_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:phase_gen_control:1.0 phase_gen_control_0 ]

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {1} \
   CONFIG.CONST_WIDTH {1} \
 ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {1} \
 ] $xlconstant_2

  # Create port connections
  connect_bd_net -net ba_seq_control_0_basequence_out [get_bd_pins ba_seq_control_0/basequence_out] [get_bd_pins com_mul_cyclic_0/basequence]
  connect_bd_net -net ba_seq_control_0_basequence_out_valid [get_bd_pins ba_seq_control_0/basequence_out_valid] [get_bd_pins com_mul_cyclic_0/basequence_valid]
  connect_bd_net -net base_sequence_0_base_sequence [get_bd_pins ba_seq_control_0/basequence_0] [get_bd_pins base_sequence_0/base_sequence]
  connect_bd_net -net base_sequence_0_base_sequence_valid [get_bd_pins ba_seq_control_0/basequence_valid_0] [get_bd_pins base_sequence_0/base_sequence_valid]
  connect_bd_net -net base_sequence_1_base_sequence [get_bd_pins ba_seq_control_0/basequence_1] [get_bd_pins base_sequence_1/base_sequence]
  connect_bd_net -net base_sequence_1_base_sequence_valid [get_bd_pins ba_seq_control_0/basequence_valid_1] [get_bd_pins base_sequence_1/base_sequence_valid]
  connect_bd_net -net clk_1 [get_bd_pins clk] [get_bd_pins ba_seq_control_0/clk] [get_bd_pins base_sequence_0/clk] [get_bd_pins base_sequence_1/clk] [get_bd_pins com_mul_cyclic_0/clk] [get_bd_pins n_cs_gen_0/clk] [get_bd_pins nfs_gen_0/clk] [get_bd_pins phase_gen_0/clk] [get_bd_pins phase_gen_control_0/clk]
  connect_bd_net -net com_mul_cyclic_0_cyclic [get_bd_pins uci_cyclic] [get_bd_pins com_mul_cyclic_0/cyclic]
  connect_bd_net -net com_mul_cyclic_0_cyclic_valid [get_bd_pins uci_cyclic_valid] [get_bd_pins com_mul_cyclic_0/cyclic_valid]
  connect_bd_net -net com_mul_cyclic_0_o_wise_enable [get_bd_pins wise_enable] [get_bd_pins com_mul_cyclic_0/o_wise_enable]
  connect_bd_net -net in_valid_1 [get_bd_pins in_valid] [get_bd_pins base_sequence_0/in_valid] [get_bd_pins base_sequence_1/in_valid] [get_bd_pins n_cs_gen_0/in_valid] [get_bd_pins nfs_gen_0/in_valid] [get_bd_pins phase_gen_0/in_valid] [get_bd_pins phase_gen_control_0/in_valid]
  connect_bd_net -net n_cs_gen_0_ncs [get_bd_pins n_cs_gen_0/ncs] [get_bd_pins phase_gen_0/ncs]
  connect_bd_net -net n_cs_gen_0_ncs_valid [get_bd_pins n_cs_gen_0/ncs_valid] [get_bd_pins phase_gen_0/n_cs_valid]
  connect_bd_net -net nfs_gen_0_nfs_0 [get_bd_pins nfs_0] [get_bd_pins ba_seq_control_0/nfs_0] [get_bd_pins nfs_gen_0/nfs_0]
  connect_bd_net -net nfs_gen_0_nfs_1 [get_bd_pins nfs_1] [get_bd_pins ba_seq_control_0/nfs_1] [get_bd_pins nfs_gen_0/nfs_1]
  connect_bd_net -net nfs_gen_0_nfs_valid [get_bd_pins nfs_valid] [get_bd_pins ba_seq_control_0/nfs_valid] [get_bd_pins nfs_gen_0/nfs_valid]
  connect_bd_net -net phase_gen_0_phase [get_bd_pins phase_gen_0/phase] [get_bd_pins phase_gen_control_0/i_phase]
  connect_bd_net -net phase_gen_0_phase_valid [get_bd_pins phase_gen_0/phase_valid] [get_bd_pins phase_gen_control_0/i_phase_valid]
  connect_bd_net -net phase_gen_control_0_o_phase_valid [get_bd_pins com_mul_cyclic_0/phase] [get_bd_pins com_mul_cyclic_0/phase_valid] [get_bd_pins phase_gen_control_0/o_phase_valid]
  connect_bd_net -net phase_gen_control_0_start_en [get_bd_pins ba_seq_control_0/start_en] [get_bd_pins phase_gen_control_0/start_en]
  connect_bd_net -net rst_1 [get_bd_pins rst] [get_bd_pins ba_seq_control_0/rst] [get_bd_pins base_sequence_0/rst] [get_bd_pins base_sequence_1/rst] [get_bd_pins com_mul_cyclic_0/rst] [get_bd_pins n_cs_gen_0/rst] [get_bd_pins nfs_gen_0/rst] [get_bd_pins phase_gen_0/rst] [get_bd_pins phase_gen_control_0/rst]
  connect_bd_net -net uci_NID_1 [get_bd_pins uci_NID] [get_bd_pins base_sequence_0/uci_nID] [get_bd_pins base_sequence_1/uci_nID] [get_bd_pins n_cs_gen_0/uci_NID]
  connect_bd_net -net uci_first_symbol_1 [get_bd_pins uci_first_symbol] [get_bd_pins n_cs_gen_0/uci_first_symbol]
  connect_bd_net -net uci_grouphopping_1 [get_bd_pins uci_grouphopping] [get_bd_pins base_sequence_0/uci_grouphopping] [get_bd_pins base_sequence_1/uci_grouphopping]
  connect_bd_net -net uci_intra_fr_hop_1 [get_bd_pins uci_intra_fr_hop] [get_bd_pins base_sequence_1/uci_nhop] [get_bd_pins nfs_gen_0/uci_intra_fr_hop]
  connect_bd_net -net uci_m0_1 [get_bd_pins uci_m0] [get_bd_pins phase_gen_0/uci_m0]
  connect_bd_net -net uci_nSymbs_1 [get_bd_pins uci_nSymbs] [get_bd_pins n_cs_gen_0/uci_nSymbs] [get_bd_pins nfs_gen_0/uci_nSymbs] [get_bd_pins phase_gen_control_0/uci_nSymbs]
  connect_bd_net -net uci_slot_1 [get_bd_pins uci_slot] [get_bd_pins base_sequence_0/uci_slot] [get_bd_pins base_sequence_1/uci_slot] [get_bd_pins n_cs_gen_0/uci_slot]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins mcs/dout] [get_bd_pins phase_gen_0/uci_mcs]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins n_cs_gen_0/in_uci_flag] [get_bd_pins phase_gen_control_0/in_uci_flag] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins base_sequence_0/uci_nhop] [get_bd_pins xlconstant_2/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: cyclic_dmrs
proc create_hier_cell_cyclic_dmrs { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_cyclic_dmrs() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I clk
  create_bd_pin -dir O -from 31 -to 0 dmrs_cyclic
  create_bd_pin -dir O dmrs_cylcic_valid
  create_bd_pin -dir I in_valid
  create_bd_pin -dir O -from 2 -to 0 nfs_0
  create_bd_pin -dir O -from 2 -to 0 nfs_1
  create_bd_pin -dir O nfs_valid
  create_bd_pin -dir I rst
  create_bd_pin -dir I -from 15 -to 0 uci_NID
  create_bd_pin -dir I -from 7 -to 0 uci_first_symbol
  create_bd_pin -dir I -from 7 -to 0 uci_grouphopping
  create_bd_pin -dir I -from 7 -to 0 uci_intra_fr_hop
  create_bd_pin -dir I -from 15 -to 0 uci_m0
  create_bd_pin -dir I -from 7 -to 0 uci_nSymbs
  create_bd_pin -dir I -from 15 -to 0 uci_slot
  create_bd_pin -dir O wise_enable

  # Create instance: ba_seq_control_0, and set properties
  set ba_seq_control_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:ba_seq_control:1.0 ba_seq_control_0 ]

  # Create instance: base_sequence_0, and set properties
  set base_sequence_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:base_sequence:1.0 base_sequence_0 ]

  # Create instance: base_sequence_1, and set properties
  set base_sequence_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:base_sequence:1.0 base_sequence_1 ]

  # Create instance: com_mul_cyclic_0, and set properties
  set com_mul_cyclic_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:com_mul_cyclic:1.0 com_mul_cyclic_0 ]

  # Create instance: mcs, and set properties
  set mcs [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 mcs ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {4} \
 ] $mcs

  # Create instance: n_cs_gen_0, and set properties
  set n_cs_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:n_cs_gen:1.0 n_cs_gen_0 ]

  # Create instance: nfs_gen_0, and set properties
  set nfs_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:nfs_gen:1.0 nfs_gen_0 ]

  # Create instance: phase_gen_0, and set properties
  set phase_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:phase_gen:1.0 phase_gen_0 ]

  # Create instance: phase_gen_control_0, and set properties
  set phase_gen_control_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:phase_gen_control:1.0 phase_gen_control_0 ]

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {1} \
 ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {1} \
 ] $xlconstant_2

  # Create port connections
  connect_bd_net -net ba_seq_control_0_basequence_out [get_bd_pins ba_seq_control_0/basequence_out] [get_bd_pins com_mul_cyclic_0/basequence]
  connect_bd_net -net ba_seq_control_0_basequence_out_valid [get_bd_pins ba_seq_control_0/basequence_out_valid] [get_bd_pins com_mul_cyclic_0/basequence_valid]
  connect_bd_net -net base_sequence_0_base_sequence [get_bd_pins ba_seq_control_0/basequence_0] [get_bd_pins base_sequence_0/base_sequence]
  connect_bd_net -net base_sequence_0_base_sequence_valid [get_bd_pins ba_seq_control_0/basequence_valid_0] [get_bd_pins base_sequence_0/base_sequence_valid]
  connect_bd_net -net base_sequence_1_base_sequence [get_bd_pins ba_seq_control_0/basequence_1] [get_bd_pins base_sequence_1/base_sequence]
  connect_bd_net -net base_sequence_1_base_sequence_valid [get_bd_pins ba_seq_control_0/basequence_valid_1] [get_bd_pins base_sequence_1/base_sequence_valid]
  connect_bd_net -net clk_1 [get_bd_pins clk] [get_bd_pins ba_seq_control_0/clk] [get_bd_pins base_sequence_0/clk] [get_bd_pins base_sequence_1/clk] [get_bd_pins com_mul_cyclic_0/clk] [get_bd_pins n_cs_gen_0/clk] [get_bd_pins nfs_gen_0/clk] [get_bd_pins phase_gen_0/clk] [get_bd_pins phase_gen_control_0/clk]
  connect_bd_net -net com_mul_cyclic_0_cyclic [get_bd_pins dmrs_cyclic] [get_bd_pins com_mul_cyclic_0/cyclic]
  connect_bd_net -net com_mul_cyclic_0_cyclic_valid [get_bd_pins dmrs_cylcic_valid] [get_bd_pins com_mul_cyclic_0/cyclic_valid]
  connect_bd_net -net com_mul_cyclic_0_o_wise_enable [get_bd_pins wise_enable] [get_bd_pins com_mul_cyclic_0/o_wise_enable]
  connect_bd_net -net in_valid_1 [get_bd_pins in_valid] [get_bd_pins base_sequence_0/in_valid] [get_bd_pins base_sequence_1/in_valid] [get_bd_pins n_cs_gen_0/in_valid] [get_bd_pins nfs_gen_0/in_valid] [get_bd_pins phase_gen_0/in_valid] [get_bd_pins phase_gen_control_0/in_valid]
  connect_bd_net -net n_cs_gen_0_ncs [get_bd_pins n_cs_gen_0/ncs] [get_bd_pins phase_gen_0/ncs]
  connect_bd_net -net n_cs_gen_0_ncs_valid [get_bd_pins n_cs_gen_0/ncs_valid] [get_bd_pins phase_gen_0/n_cs_valid]
  connect_bd_net -net nfs_gen_0_nfs_0 [get_bd_pins nfs_0] [get_bd_pins ba_seq_control_0/nfs_0] [get_bd_pins nfs_gen_0/nfs_0]
  connect_bd_net -net nfs_gen_0_nfs_1 [get_bd_pins nfs_1] [get_bd_pins ba_seq_control_0/nfs_1] [get_bd_pins nfs_gen_0/nfs_1]
  connect_bd_net -net nfs_gen_0_nfs_valid [get_bd_pins nfs_valid] [get_bd_pins ba_seq_control_0/nfs_valid] [get_bd_pins nfs_gen_0/nfs_valid]
  connect_bd_net -net phase_gen_0_phase [get_bd_pins phase_gen_0/phase] [get_bd_pins phase_gen_control_0/i_phase]
  connect_bd_net -net phase_gen_0_phase_valid [get_bd_pins phase_gen_0/phase_valid] [get_bd_pins phase_gen_control_0/i_phase_valid]
  connect_bd_net -net phase_gen_control_0_o_phase_valid [get_bd_pins com_mul_cyclic_0/phase] [get_bd_pins com_mul_cyclic_0/phase_valid] [get_bd_pins phase_gen_control_0/o_phase_valid]
  connect_bd_net -net phase_gen_control_0_start_en [get_bd_pins ba_seq_control_0/start_en] [get_bd_pins phase_gen_control_0/start_en]
  connect_bd_net -net rst_1 [get_bd_pins rst] [get_bd_pins ba_seq_control_0/rst] [get_bd_pins base_sequence_0/rst] [get_bd_pins base_sequence_1/rst] [get_bd_pins com_mul_cyclic_0/rst] [get_bd_pins n_cs_gen_0/rst] [get_bd_pins nfs_gen_0/rst] [get_bd_pins phase_gen_0/rst] [get_bd_pins phase_gen_control_0/rst]
  connect_bd_net -net uci_NID_1 [get_bd_pins uci_NID] [get_bd_pins base_sequence_0/uci_nID] [get_bd_pins base_sequence_1/uci_nID] [get_bd_pins n_cs_gen_0/uci_NID]
  connect_bd_net -net uci_first_symbol_1 [get_bd_pins uci_first_symbol] [get_bd_pins n_cs_gen_0/uci_first_symbol]
  connect_bd_net -net uci_grouphopping_1 [get_bd_pins uci_grouphopping] [get_bd_pins base_sequence_0/uci_grouphopping] [get_bd_pins base_sequence_1/uci_grouphopping]
  connect_bd_net -net uci_intra_fr_hop_1 [get_bd_pins uci_intra_fr_hop] [get_bd_pins base_sequence_1/uci_nhop] [get_bd_pins nfs_gen_0/uci_intra_fr_hop]
  connect_bd_net -net uci_m0_1 [get_bd_pins uci_m0] [get_bd_pins phase_gen_0/uci_m0]
  connect_bd_net -net uci_nSymbs_1 [get_bd_pins uci_nSymbs] [get_bd_pins n_cs_gen_0/uci_nSymbs] [get_bd_pins nfs_gen_0/uci_nSymbs] [get_bd_pins phase_gen_control_0/uci_nSymbs]
  connect_bd_net -net uci_slot_1 [get_bd_pins uci_slot] [get_bd_pins base_sequence_0/uci_slot] [get_bd_pins base_sequence_1/uci_slot] [get_bd_pins n_cs_gen_0/uci_slot]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins mcs/dout] [get_bd_pins phase_gen_0/uci_mcs]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins n_cs_gen_0/in_uci_flag] [get_bd_pins phase_gen_control_0/in_uci_flag] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins base_sequence_0/uci_nhop] [get_bd_pins xlconstant_2/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set ant_input [ create_bd_port -dir I -from 255 -to 0 ant_input ]
  set clk [ create_bd_port -dir I -type clk -freq_hz 122880000 clk ]
  set dtx [ create_bd_port -dir O dtx ]
  set harq [ create_bd_port -dir O -from 1 -to 0 harq ]
  set i_config_valid [ create_bd_port -dir I i_config_valid ]
  set i_group_hopping [ create_bd_port -dir I -from 7 -to 0 i_group_hopping ]
  set i_hopping_ID [ create_bd_port -dir I -from 15 -to 0 i_hopping_ID ]
  set i_pucch1_valid [ create_bd_port -dir I i_pucch1_valid ]
  set o_valid [ create_bd_port -dir O o_valid ]
  set pucch_parameter [ create_bd_port -dir I -from 511 -to 0 pucch_parameter ]
  set rst [ create_bd_port -dir I -type rst rst ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $rst
  set sr [ create_bd_port -dir O sr ]
  set stop_trigger [ create_bd_port -dir I stop_trigger ]
  set trigger_05 [ create_bd_port -dir I trigger_05 ]

  # Create instance: cyclic_dmrs
  create_hier_cell_cyclic_dmrs [current_bd_instance .] cyclic_dmrs

  # Create instance: cyclic_uci
  create_hier_cell_cyclic_uci [current_bd_instance .] cyclic_uci

  # Create instance: data_dmrs_selection_0, and set properties
  set data_dmrs_selection_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:data_dmrs_selection:1.0 data_dmrs_selection_0 ]

  # Create instance: de_spread_0, and set properties
  set de_spread_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:de_spread:1.0 de_spread_0 ]

  # Create instance: de_spread_1, and set properties
  set de_spread_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:de_spread:1.0 de_spread_1 ]

  # Create instance: demapping_0, and set properties
  set demapping_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:demapping:1.0 demapping_0 ]

  # Create instance: dmrs_wise_spreading_0, and set properties
  set dmrs_wise_spreading_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:wise_spreading:1.0 dmrs_wise_spreading_0 ]

  # Create instance: dmrs_wise_spreading_1, and set properties
  set dmrs_wise_spreading_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:wise_spreading:1.0 dmrs_wise_spreading_1 ]

  # Create instance: frame_sync_0, and set properties
  set frame_sync_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:frame_sync:1.0 frame_sync_0 ]

  # Create instance: frame_sync_1, and set properties
  set frame_sync_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:frame_sync:1.0 frame_sync_1 ]

  # Create instance: mean_data_0, and set properties
  set mean_data_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:mean_data:1.0 mean_data_0 ]

  # Create instance: ofdm_demodulation_0, and set properties
  set ofdm_demodulation_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:ofdm_demodulation:1.0 ofdm_demodulation_0 ]

  # Create instance: payload_est_SINR_0, and set properties
  set payload_est_SINR_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:payload_est_SINR:1.0 payload_est_SINR_0 ]
  set_property -dict [ list \
   CONFIG.RX {4} \
 ] $payload_est_SINR_0

  # Create instance: physical_control_0, and set properties
  set physical_control_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:physical_control:1.0 physical_control_0 ]

  # Create instance: sr_ack_detector_0, and set properties
  set sr_ack_detector_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:sr_ack_detector:1.0 sr_ack_detector_0 ]

  # Create instance: uci_dmrs_gen_0, and set properties
  set uci_dmrs_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:uci_dmrs_gen:1.0 uci_dmrs_gen_0 ]

  # Create instance: uci_dmrs_gen_1, and set properties
  set uci_dmrs_gen_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:uci_dmrs_gen:1.0 uci_dmrs_gen_1 ]

  # Create instance: uci_occ, and set properties
  set uci_occ [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 uci_occ ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {4} \
 ] $uci_occ

  # Create instance: uci_wise_spreading_0, and set properties
  set uci_wise_spreading_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:wise_spreading:1.0 uci_wise_spreading_0 ]

  # Create instance: uci_wise_spreading_1, and set properties
  set uci_wise_spreading_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:wise_spreading:1.0 uci_wise_spreading_1 ]

  # Create instance: ulcch_parameter_0, and set properties
  set ulcch_parameter_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:ulcch_parameter:1.0 ulcch_parameter_0 ]

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
   CONFIG.IN0_WIDTH {64} \
   CONFIG.IN1_WIDTH {64} \
   CONFIG.IN2_WIDTH {64} \
   CONFIG.IN3_WIDTH {64} \
   CONFIG.NUM_PORTS {4} \
 ] $xlconcat_0

  # Create instance: xlconcat_1, and set properties
  set xlconcat_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1 ]
  set_property -dict [ list \
   CONFIG.IN0_WIDTH {34} \
   CONFIG.IN1_WIDTH {34} \
   CONFIG.IN2_WIDTH {34} \
   CONFIG.IN3_WIDTH {34} \
   CONFIG.NUM_PORTS {4} \
 ] $xlconcat_1

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {4} \
   CONFIG.CONST_WIDTH {3} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {4} \
   CONFIG.CONST_WIDTH {64} \
 ] $xlconstant_1

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {31} \
   CONFIG.DIN_WIDTH {256} \
   CONFIG.DOUT_WIDTH {32} \
 ] $xlslice_0

  # Create port connections
  connect_bd_net -net ant_input_1 [get_bd_ports ant_input] [get_bd_pins xlslice_0/Din]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins cyclic_dmrs/clk] [get_bd_pins cyclic_uci/clk] [get_bd_pins data_dmrs_selection_0/clk] [get_bd_pins de_spread_0/clk] [get_bd_pins de_spread_1/clk] [get_bd_pins demapping_0/clk] [get_bd_pins dmrs_wise_spreading_0/clk] [get_bd_pins dmrs_wise_spreading_1/clk] [get_bd_pins frame_sync_0/clk] [get_bd_pins frame_sync_1/clk] [get_bd_pins mean_data_0/clk] [get_bd_pins ofdm_demodulation_0/clk] [get_bd_pins payload_est_SINR_0/clk] [get_bd_pins physical_control_0/clk] [get_bd_pins sr_ack_detector_0/clk] [get_bd_pins uci_dmrs_gen_0/clk] [get_bd_pins uci_dmrs_gen_1/clk] [get_bd_pins uci_wise_spreading_0/clk] [get_bd_pins uci_wise_spreading_1/clk] [get_bd_pins ulcch_parameter_0/clk]
  connect_bd_net -net cyclic_dmrs_dmrs_cyclic [get_bd_pins cyclic_dmrs/dmrs_cyclic] [get_bd_pins uci_dmrs_gen_1/cyclic]
  connect_bd_net -net cyclic_dmrs_dmrs_cylcic_valid [get_bd_pins cyclic_dmrs/dmrs_cylcic_valid] [get_bd_pins uci_dmrs_gen_1/cyclic_valid]
  connect_bd_net -net cyclic_dmrs_nfs_0 [get_bd_pins cyclic_dmrs/nfs_0] [get_bd_pins dmrs_wise_spreading_0/nfs]
  connect_bd_net -net cyclic_dmrs_nfs_1 [get_bd_pins cyclic_dmrs/nfs_1] [get_bd_pins dmrs_wise_spreading_1/nfs]
  connect_bd_net -net cyclic_dmrs_nfs_valid [get_bd_pins cyclic_dmrs/nfs_valid] [get_bd_pins dmrs_wise_spreading_0/nfs_valid] [get_bd_pins dmrs_wise_spreading_1/nfs_valid]
  connect_bd_net -net cyclic_dmrs_wise_enable [get_bd_pins cyclic_dmrs/wise_enable] [get_bd_pins dmrs_wise_spreading_0/enable]
  connect_bd_net -net cyclic_uci_nfs_0 [get_bd_pins cyclic_uci/nfs_0] [get_bd_pins uci_wise_spreading_0/nfs]
  connect_bd_net -net cyclic_uci_nfs_1 [get_bd_pins cyclic_uci/nfs_1] [get_bd_pins uci_wise_spreading_1/nfs]
  connect_bd_net -net cyclic_uci_nfs_valid [get_bd_pins cyclic_uci/nfs_valid] [get_bd_pins uci_wise_spreading_0/nfs_valid] [get_bd_pins uci_wise_spreading_1/nfs_valid]
  connect_bd_net -net cyclic_uci_uci_cyclic [get_bd_pins cyclic_uci/uci_cyclic] [get_bd_pins uci_dmrs_gen_0/cyclic]
  connect_bd_net -net cyclic_uci_uci_cyclic_valid [get_bd_pins cyclic_uci/uci_cyclic_valid] [get_bd_pins uci_dmrs_gen_0/cyclic_valid]
  connect_bd_net -net cyclic_uci_wise_enable [get_bd_pins cyclic_uci/wise_enable] [get_bd_pins uci_wise_spreading_0/enable]
  connect_bd_net -net data_dmrs_selection_0_data [get_bd_pins data_dmrs_selection_0/data] [get_bd_pins de_spread_1/rx_data]
  connect_bd_net -net data_dmrs_selection_0_data_valid [get_bd_pins data_dmrs_selection_0/data_valid] [get_bd_pins de_spread_1/rx_data_valid]
  connect_bd_net -net data_dmrs_selection_0_dmrs [get_bd_pins data_dmrs_selection_0/dmrs] [get_bd_pins de_spread_0/rx_data]
  connect_bd_net -net data_dmrs_selection_0_dmrs_valid [get_bd_pins data_dmrs_selection_0/dmrs_valid] [get_bd_pins de_spread_0/rx_data_valid]
  connect_bd_net -net de_spread_0_de_spreading_data [get_bd_pins de_spread_0/de_spreading_data] [get_bd_pins mean_data_0/despread_uci]
  connect_bd_net -net de_spread_0_de_spreading_data_valid [get_bd_pins de_spread_0/de_spreading_data_valid] [get_bd_pins mean_data_0/despread_uci_valid]
  connect_bd_net -net de_spread_1_de_spreading_data [get_bd_pins de_spread_1/de_spreading_data] [get_bd_pins mean_data_0/despread_dmrs]
  connect_bd_net -net de_spread_1_de_spreading_data_valid [get_bd_pins de_spread_1/de_spreading_data_valid] [get_bd_pins mean_data_0/despread_dmrs_valid]
  connect_bd_net -net demapping_0_resoureset_valid [get_bd_pins data_dmrs_selection_0/resoureset_valid] [get_bd_pins demapping_0/resoureset_valid]
  connect_bd_net -net dmrs_wise_spreading_0_o_enable [get_bd_pins uci_wise_spreading_0/o_enable] [get_bd_pins uci_wise_spreading_1/enable]
  connect_bd_net -net dmrs_wise_spreading_0_o_enable1 [get_bd_pins dmrs_wise_spreading_0/o_enable] [get_bd_pins dmrs_wise_spreading_1/enable]
  connect_bd_net -net dmrs_wise_spreading_0_wi_seq [get_bd_pins uci_dmrs_gen_0/wise_0] [get_bd_pins uci_wise_spreading_0/wi_seq]
  connect_bd_net -net dmrs_wise_spreading_0_wi_seq1 [get_bd_pins dmrs_wise_spreading_0/wi_seq] [get_bd_pins uci_dmrs_gen_1/wise_0]
  connect_bd_net -net dmrs_wise_spreading_0_wi_seq_valid [get_bd_pins uci_dmrs_gen_0/wise_valid_0] [get_bd_pins uci_wise_spreading_0/wi_seq_valid]
  connect_bd_net -net dmrs_wise_spreading_0_wi_seq_valid1 [get_bd_pins dmrs_wise_spreading_0/wi_seq_valid] [get_bd_pins uci_dmrs_gen_1/wise_valid_0]
  connect_bd_net -net dmrs_wise_spreading_1_wi_seq [get_bd_pins uci_dmrs_gen_0/wise_1] [get_bd_pins uci_wise_spreading_1/wi_seq]
  connect_bd_net -net dmrs_wise_spreading_1_wi_seq1 [get_bd_pins dmrs_wise_spreading_1/wi_seq] [get_bd_pins uci_dmrs_gen_1/wise_1]
  connect_bd_net -net dmrs_wise_spreading_1_wi_seq_valid [get_bd_pins uci_dmrs_gen_0/wise_valid_1] [get_bd_pins uci_wise_spreading_1/wi_seq_valid]
  connect_bd_net -net dmrs_wise_spreading_1_wi_seq_valid1 [get_bd_pins dmrs_wise_spreading_1/wi_seq_valid] [get_bd_pins uci_dmrs_gen_1/wise_valid_1]
  connect_bd_net -net frame_sync_0_cp [get_bd_pins frame_sync_0/cp] [get_bd_pins ofdm_demodulation_0/i_trigger_cp]
  connect_bd_net -net frame_sync_0_start_symbol [get_bd_pins frame_sync_0/start_symbol] [get_bd_pins ofdm_demodulation_0/i_start_symbol]
  connect_bd_net -net frame_sync_1_rb_idx [get_bd_pins demapping_0/fr_rb] [get_bd_pins frame_sync_1/rb_idx]
  connect_bd_net -net frame_sync_1_start_slot [get_bd_pins demapping_0/fr_slot] [get_bd_pins frame_sync_1/start_slot]
  connect_bd_net -net frame_sync_1_sym_idx [get_bd_pins demapping_0/fr_symbol] [get_bd_pins frame_sync_1/sym_idx]
  connect_bd_net -net frame_sync_1_valid_out [get_bd_pins demapping_0/fr_data_valid] [get_bd_pins frame_sync_1/valid_out]
  connect_bd_net -net i_config_valid_1 [get_bd_ports i_config_valid] [get_bd_pins ulcch_parameter_0/i_config_valid]
  connect_bd_net -net i_group_hopping_1 [get_bd_ports i_group_hopping] [get_bd_pins ulcch_parameter_0/i_group_hopping]
  connect_bd_net -net i_hopping_ID_1 [get_bd_ports i_hopping_ID] [get_bd_pins ulcch_parameter_0/i_hopping_ID]
  connect_bd_net -net i_pucch1_valid_1 [get_bd_ports i_pucch1_valid] [get_bd_pins ulcch_parameter_0/i_pucch_valid]
  connect_bd_net -net mean_data_0_o_mean_data [get_bd_pins mean_data_0/o_mean_data] [get_bd_pins xlconcat_1/In0] [get_bd_pins xlconcat_1/In1] [get_bd_pins xlconcat_1/In2] [get_bd_pins xlconcat_1/In3]
  connect_bd_net -net mean_data_0_o_mean_data_valid [get_bd_pins mean_data_0/o_mean_data_valid] [get_bd_pins payload_est_SINR_0/mean_data_valid]
  connect_bd_net -net mean_data_0_sinr [get_bd_pins mean_data_0/sinr] [get_bd_pins xlconcat_0/In0] [get_bd_pins xlconcat_0/In1] [get_bd_pins xlconcat_0/In2] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net mean_data_0_sinr_valid [get_bd_pins mean_data_0/sinr_valid] [get_bd_pins payload_est_SINR_0/sinr_valid]
  connect_bd_net -net ofdm_demodulation_0_o_valid [get_bd_pins data_dmrs_selection_0/ofdm_valid] [get_bd_pins ofdm_demodulation_0/o_valid]
  connect_bd_net -net ofdm_demodulation_0_pucch_ofdm [get_bd_pins data_dmrs_selection_0/ofdm] [get_bd_pins ofdm_demodulation_0/pucch_ofdm]
  connect_bd_net -net ofdm_demodulation_0_start_symbol [get_bd_pins frame_sync_1/in_start_symbol] [get_bd_pins ofdm_demodulation_0/start_symbol]
  connect_bd_net -net payload_est_SINR_0_mean_sinr [get_bd_pins payload_est_SINR_0/mean_sinr] [get_bd_pins sr_ack_detector_0/mean_sinr]
  connect_bd_net -net payload_est_SINR_0_mean_sinr_valid [get_bd_pins payload_est_SINR_0/mean_sinr_valid] [get_bd_pins sr_ack_detector_0/mean_sinr_valid]
  connect_bd_net -net payload_est_SINR_0_payload [get_bd_pins payload_est_SINR_0/payload] [get_bd_pins sr_ack_detector_0/payload]
  connect_bd_net -net payload_est_SINR_0_payload_valid [get_bd_pins payload_est_SINR_0/payload_valid] [get_bd_pins sr_ack_detector_0/payload_valid]
  connect_bd_net -net physical_control_0_start_symbol [get_bd_pins frame_sync_0/in_start_symbol] [get_bd_pins physical_control_0/start_symbol]
  connect_bd_net -net pucch_parameter_1 [get_bd_ports pucch_parameter] [get_bd_pins ulcch_parameter_0/ulcch_para]
  connect_bd_net -net rst_1 [get_bd_ports rst] [get_bd_pins cyclic_dmrs/rst] [get_bd_pins cyclic_uci/rst] [get_bd_pins data_dmrs_selection_0/rst] [get_bd_pins de_spread_0/rst] [get_bd_pins de_spread_1/rst] [get_bd_pins demapping_0/rst] [get_bd_pins dmrs_wise_spreading_0/rst] [get_bd_pins dmrs_wise_spreading_1/rst] [get_bd_pins frame_sync_0/rst] [get_bd_pins frame_sync_1/rst] [get_bd_pins mean_data_0/rst] [get_bd_pins ofdm_demodulation_0/rst] [get_bd_pins payload_est_SINR_0/rst] [get_bd_pins physical_control_0/rst] [get_bd_pins sr_ack_detector_0/rst] [get_bd_pins uci_dmrs_gen_0/rst] [get_bd_pins uci_dmrs_gen_1/rst] [get_bd_pins uci_wise_spreading_0/rst] [get_bd_pins uci_wise_spreading_1/rst] [get_bd_pins ulcch_parameter_0/rst]
  connect_bd_net -net sr_ack_detector_0_dtx [get_bd_ports dtx] [get_bd_pins sr_ack_detector_0/dtx]
  connect_bd_net -net sr_ack_detector_0_harq [get_bd_ports harq] [get_bd_pins sr_ack_detector_0/harq]
  connect_bd_net -net sr_ack_detector_0_o_valid [get_bd_ports o_valid] [get_bd_pins sr_ack_detector_0/o_valid]
  connect_bd_net -net sr_ack_detector_0_sr [get_bd_ports sr] [get_bd_pins sr_ack_detector_0/sr]
  connect_bd_net -net stop_trigger_1 [get_bd_ports stop_trigger] [get_bd_pins physical_control_0/stop_request_trigger]
  connect_bd_net -net trigger_05_1 [get_bd_ports trigger_05] [get_bd_pins physical_control_0/in_0_5ms]
  connect_bd_net -net uci_dmrs_gen_0_uci_dmrs [get_bd_pins de_spread_0/spreading_data] [get_bd_pins uci_dmrs_gen_0/uci_dmrs]
  connect_bd_net -net uci_dmrs_gen_0_uci_dmrs_valid [get_bd_pins de_spread_0/spreading_data_valid] [get_bd_pins uci_dmrs_gen_0/uci_dmrs_valid]
  connect_bd_net -net uci_dmrs_gen_1_uci_dmrs [get_bd_pins de_spread_1/spreading_data] [get_bd_pins uci_dmrs_gen_1/uci_dmrs]
  connect_bd_net -net uci_dmrs_gen_1_uci_dmrs_valid [get_bd_pins de_spread_1/spreading_data_valid] [get_bd_pins uci_dmrs_gen_1/uci_dmrs_valid]
  connect_bd_net -net uci_occ_dout [get_bd_pins dmrs_wise_spreading_0/uci_OCC] [get_bd_pins dmrs_wise_spreading_1/uci_OCC] [get_bd_pins uci_occ/dout] [get_bd_pins uci_wise_spreading_0/uci_OCC] [get_bd_pins uci_wise_spreading_1/uci_OCC]
  connect_bd_net -net ulcch_parameter_0_group_hopping [get_bd_pins cyclic_dmrs/uci_grouphopping] [get_bd_pins cyclic_uci/uci_grouphopping] [get_bd_pins ulcch_parameter_0/group_hopping]
  connect_bd_net -net ulcch_parameter_0_hopping_ID [get_bd_pins cyclic_dmrs/uci_NID] [get_bd_pins cyclic_uci/uci_NID] [get_bd_pins ulcch_parameter_0/hopping_ID]
  connect_bd_net -net ulcch_parameter_0_pucch_valid [get_bd_pins cyclic_dmrs/in_valid] [get_bd_pins cyclic_uci/in_valid] [get_bd_pins data_dmrs_selection_0/uci_valid] [get_bd_pins demapping_0/uci_valid] [get_bd_pins dmrs_wise_spreading_0/in_valid] [get_bd_pins dmrs_wise_spreading_1/in_valid] [get_bd_pins mean_data_0/in_valid] [get_bd_pins payload_est_SINR_0/in_valid] [get_bd_pins sr_ack_detector_0/in_valid] [get_bd_pins uci_wise_spreading_0/in_valid] [get_bd_pins uci_wise_spreading_1/in_valid] [get_bd_pins ulcch_parameter_0/pucch_valid]
  connect_bd_net -net ulcch_parameter_0_uci_ack [get_bd_pins sr_ack_detector_0/uci_o_ack] [get_bd_pins ulcch_parameter_0/uci_ack]
  connect_bd_net -net ulcch_parameter_0_uci_frist_symbol [get_bd_pins cyclic_dmrs/uci_first_symbol] [get_bd_pins cyclic_uci/uci_first_symbol] [get_bd_pins demapping_0/uci_first_symbol_idx] [get_bd_pins ulcch_parameter_0/uci_frist_symbol]
  connect_bd_net -net ulcch_parameter_0_uci_intra_fre_hopping [get_bd_pins cyclic_dmrs/uci_intra_fr_hop] [get_bd_pins cyclic_uci/uci_intra_fr_hop] [get_bd_pins demapping_0/uci_instra_fre_hop] [get_bd_pins ulcch_parameter_0/uci_intra_fre_hopping]
  connect_bd_net -net ulcch_parameter_0_uci_m0 [get_bd_pins cyclic_dmrs/uci_m0] [get_bd_pins cyclic_uci/uci_m0] [get_bd_pins ulcch_parameter_0/uci_m0]
  connect_bd_net -net ulcch_parameter_0_uci_pbr_offset [get_bd_pins demapping_0/uci_prbsoffset] [get_bd_pins ulcch_parameter_0/uci_pbr_offset]
  connect_bd_net -net ulcch_parameter_0_uci_second_prb [get_bd_pins demapping_0/uci_secondhop_prb] [get_bd_pins ulcch_parameter_0/uci_second_prb]
  connect_bd_net -net ulcch_parameter_0_uci_slot_idx [get_bd_pins cyclic_dmrs/uci_slot] [get_bd_pins cyclic_uci/uci_slot] [get_bd_pins demapping_0/uci_slot] [get_bd_pins ulcch_parameter_0/uci_slot_idx]
  connect_bd_net -net ulcch_parameter_0_uci_symbol [get_bd_pins cyclic_dmrs/uci_nSymbs] [get_bd_pins cyclic_uci/uci_nSymbs] [get_bd_pins data_dmrs_selection_0/uci_nsymbols] [get_bd_pins demapping_0/uci_nsymbols] [get_bd_pins mean_data_0/uci_nsymbol] [get_bd_pins ulcch_parameter_0/uci_symbol]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins payload_est_SINR_0/sinr] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconcat_1_dout [get_bd_pins payload_est_SINR_0/mean_data] [get_bd_pins xlconcat_1/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins ofdm_demodulation_0/scale_factor] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins sr_ack_detector_0/sinr_threshold] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins ofdm_demodulation_0/ant_input] [get_bd_pins xlslice_0/Dout]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


