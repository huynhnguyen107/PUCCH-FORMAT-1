
################################################################
# This is a generated script based on design: cyclic_gen
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
# source cyclic_gen_script.tcl

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
set design_name cyclic_gen

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
  set clk [ create_bd_port -dir I -type clk -freq_hz 100000000 clk ]
  set cyclic [ create_bd_port -dir O -from 31 -to 0 cyclic ]
  set cyclic_valid [ create_bd_port -dir O cyclic_valid ]
  set rst [ create_bd_port -dir I -type rst rst ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $rst
  set uci_NID [ create_bd_port -dir I -from 10 -to 0 uci_NID ]
  set uci_first_symbol [ create_bd_port -dir I -from 3 -to 0 uci_first_symbol ]
  set uci_grouphopping [ create_bd_port -dir I -from 1 -to 0 uci_grouphopping ]
  set uci_intra_fr_hop [ create_bd_port -dir I uci_intra_fr_hop ]
  set uci_m0 [ create_bd_port -dir I -from 3 -to 0 uci_m0 ]
  set uci_nsymbols [ create_bd_port -dir I -from 3 -to 0 uci_nsymbols ]
  set uci_slot [ create_bd_port -dir I -from 4 -to 0 uci_slot ]
  set uci_valid [ create_bd_port -dir I uci_valid ]

  # Create instance: ba_seq_control_0, and set properties
  set ba_seq_control_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:ba_seq_control:1.0 ba_seq_control_0 ]

  # Create instance: base_sequence_0, and set properties
  set base_sequence_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:base_sequence:1.0 base_sequence_0 ]

  # Create instance: base_sequence_1, and set properties
  set base_sequence_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:base_sequence:1.0 base_sequence_1 ]

  # Create instance: com_mul_cyclic_0, and set properties
  set com_mul_cyclic_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:com_mul_cyclic:1.0 com_mul_cyclic_0 ]

  # Create instance: n_cs_gen_0, and set properties
  set n_cs_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:n_cs_gen:1.0 n_cs_gen_0 ]

  # Create instance: nfs_gen_0, and set properties
  set nfs_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:nfs_gen:1.0 nfs_gen_0 ]

  # Create instance: phase_gen_0, and set properties
  set phase_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:phase_gen:1.0 phase_gen_0 ]

  # Create instance: phase_gen_control_0, and set properties
  set phase_gen_control_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:phase_gen_control:1.0 phase_gen_control_0 ]

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {4} \
 ] $xlconstant_1

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_2

  # Create port connections
  connect_bd_net -net ba_seq_control_0_basequence_out [get_bd_pins ba_seq_control_0/basequence_out] [get_bd_pins com_mul_cyclic_0/basequence]
  connect_bd_net -net ba_seq_control_0_basequence_out_valid [get_bd_pins ba_seq_control_0/basequence_out_valid] [get_bd_pins com_mul_cyclic_0/basequence_valid]
  connect_bd_net -net base_sequence_0_base_sequence [get_bd_pins ba_seq_control_0/basequence_0] [get_bd_pins base_sequence_0/base_sequence]
  connect_bd_net -net base_sequence_0_base_sequence_valid [get_bd_pins ba_seq_control_0/basequence_valid_0] [get_bd_pins base_sequence_0/base_sequence_valid]
  connect_bd_net -net base_sequence_1_base_sequence [get_bd_pins ba_seq_control_0/basequence_1] [get_bd_pins base_sequence_1/base_sequence]
  connect_bd_net -net base_sequence_1_base_sequence_valid [get_bd_pins ba_seq_control_0/basequence_valid_1] [get_bd_pins base_sequence_1/base_sequence_valid]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins ba_seq_control_0/clk] [get_bd_pins base_sequence_0/clk] [get_bd_pins base_sequence_1/clk] [get_bd_pins com_mul_cyclic_0/clk] [get_bd_pins n_cs_gen_0/clk] [get_bd_pins nfs_gen_0/clk] [get_bd_pins phase_gen_0/clk] [get_bd_pins phase_gen_control_0/clk]
  connect_bd_net -net com_mul_cyclic_0_cyclic [get_bd_ports cyclic] [get_bd_pins com_mul_cyclic_0/cyclic]
  connect_bd_net -net com_mul_cyclic_0_cyclic_valid [get_bd_ports cyclic_valid] [get_bd_pins com_mul_cyclic_0/cyclic_valid]
  connect_bd_net -net in_valid_1 [get_bd_ports uci_valid] [get_bd_pins base_sequence_0/in_valid] [get_bd_pins base_sequence_1/in_valid] [get_bd_pins n_cs_gen_0/in_valid] [get_bd_pins nfs_gen_0/in_valid] [get_bd_pins phase_gen_0/in_valid] [get_bd_pins phase_gen_control_0/in_valid]
  connect_bd_net -net n_cs_gen_0_ncs [get_bd_pins n_cs_gen_0/ncs] [get_bd_pins phase_gen_0/ncs]
  connect_bd_net -net n_cs_gen_0_ncs_valid [get_bd_pins n_cs_gen_0/ncs_valid] [get_bd_pins phase_gen_0/n_cs_valid]
  connect_bd_net -net nfs_gen_0_nfs_0 [get_bd_pins ba_seq_control_0/nfs_0] [get_bd_pins nfs_gen_0/nfs_0]
  connect_bd_net -net nfs_gen_0_nfs_1 [get_bd_pins ba_seq_control_0/nfs_1] [get_bd_pins nfs_gen_0/nfs_1]
  connect_bd_net -net nfs_gen_0_nfs_valid [get_bd_pins ba_seq_control_0/nfs_valid] [get_bd_pins nfs_gen_0/nfs_valid]
  connect_bd_net -net phase_gen_0_phase [get_bd_pins phase_gen_0/phase] [get_bd_pins phase_gen_control_0/i_phase]
  connect_bd_net -net phase_gen_0_phase_valid [get_bd_pins phase_gen_0/phase_valid] [get_bd_pins phase_gen_control_0/i_phase_valid]
  connect_bd_net -net phase_gen_control_0_o_phase [get_bd_pins com_mul_cyclic_0/phase] [get_bd_pins phase_gen_control_0/o_phase]
  connect_bd_net -net phase_gen_control_0_o_phase_valid [get_bd_pins com_mul_cyclic_0/phase_valid] [get_bd_pins phase_gen_control_0/o_phase_valid]
  connect_bd_net -net phase_gen_control_0_start_en [get_bd_pins ba_seq_control_0/start_en] [get_bd_pins phase_gen_control_0/start_en]
  connect_bd_net -net rst_1 [get_bd_ports rst] [get_bd_pins ba_seq_control_0/rst] [get_bd_pins base_sequence_0/rst] [get_bd_pins base_sequence_1/rst] [get_bd_pins com_mul_cyclic_0/rst] [get_bd_pins n_cs_gen_0/rst] [get_bd_pins nfs_gen_0/rst] [get_bd_pins phase_gen_0/rst] [get_bd_pins phase_gen_control_0/rst]
  connect_bd_net -net uci_NID_1 [get_bd_ports uci_NID] [get_bd_pins base_sequence_0/uci_nID] [get_bd_pins base_sequence_1/uci_nID] [get_bd_pins n_cs_gen_0/uci_NID]
  connect_bd_net -net uci_first_symbol_1 [get_bd_ports uci_first_symbol] [get_bd_pins n_cs_gen_0/uci_first_symbol]
  connect_bd_net -net uci_grouphopping_1 [get_bd_ports uci_grouphopping] [get_bd_pins base_sequence_0/uci_grouphopping] [get_bd_pins base_sequence_1/uci_grouphopping]
  connect_bd_net -net uci_intra_fr_hop_1 [get_bd_ports uci_intra_fr_hop] [get_bd_pins base_sequence_0/uci_nhop] [get_bd_pins nfs_gen_0/uci_intra_fr_hop]
  connect_bd_net -net uci_m0_1 [get_bd_ports uci_m0] [get_bd_pins phase_gen_0/uci_m0]
  connect_bd_net -net uci_nsymbols_1 [get_bd_ports uci_nsymbols] [get_bd_pins n_cs_gen_0/uci_nSymbs] [get_bd_pins nfs_gen_0/uci_nSymbs] [get_bd_pins phase_gen_control_0/uci_nSymbs]
  connect_bd_net -net uci_slot_1 [get_bd_ports uci_slot] [get_bd_pins base_sequence_0/uci_slot] [get_bd_pins base_sequence_1/uci_slot] [get_bd_pins n_cs_gen_0/uci_slot]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins n_cs_gen_0/in_uci_flag] [get_bd_pins phase_gen_control_0/in_uci_flag] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins phase_gen_0/uci_mcs] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins base_sequence_1/uci_nhop] [get_bd_pins xlconstant_2/dout]

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


