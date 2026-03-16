
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
  set i_config_valid [ create_bd_port -dir I i_config_valid ]
  set i_group_hopping [ create_bd_port -dir I -from 7 -to 0 i_group_hopping ]
  set i_hopping_ID [ create_bd_port -dir I -from 15 -to 0 i_hopping_ID ]
  set i_pucch1_valid [ create_bd_port -dir I i_pucch1_valid ]
  set pucch_parameter [ create_bd_port -dir I -from 511 -to 0 pucch_parameter ]
  set rst [ create_bd_port -dir I -type rst rst ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $rst
  set stop_trigger [ create_bd_port -dir I stop_trigger ]
  set trigger_05 [ create_bd_port -dir I trigger_05 ]

  # Create instance: demapping_0, and set properties
  set demapping_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:demapping:1.0 demapping_0 ]

  # Create instance: frame_sync_0, and set properties
  set frame_sync_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:frame_sync:1.0 frame_sync_0 ]

  # Create instance: frame_sync_1, and set properties
  set frame_sync_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:frame_sync:1.0 frame_sync_1 ]

  # Create instance: ofdm_demodulation_0, and set properties
  set ofdm_demodulation_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:ofdm_demodulation:1.0 ofdm_demodulation_0 ]

  # Create instance: physical_control_0, and set properties
  set physical_control_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:physical_control:1.0 physical_control_0 ]

  # Create instance: ulcch_parameter_0, and set properties
  set ulcch_parameter_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:ulcch_parameter:1.0 ulcch_parameter_0 ]

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {4} \
   CONFIG.CONST_WIDTH {3} \
 ] $xlconstant_0

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {31} \
   CONFIG.DIN_WIDTH {256} \
   CONFIG.DOUT_WIDTH {32} \
 ] $xlslice_0

  # Create port connections
  connect_bd_net -net ant_input_1 [get_bd_ports ant_input] [get_bd_pins xlslice_0/Din]
  connect_bd_net -net clk_1 [get_bd_ports clk] [get_bd_pins frame_sync_0/clk] [get_bd_pins frame_sync_1/clk] [get_bd_pins ofdm_demodulation_0/clk] [get_bd_pins physical_control_0/clk] [get_bd_pins ulcch_parameter_0/clk]
  connect_bd_net -net frame_sync_0_cp [get_bd_pins frame_sync_0/cp] [get_bd_pins ofdm_demodulation_0/i_trigger_cp]
  connect_bd_net -net frame_sync_0_start_symbol [get_bd_pins frame_sync_0/start_symbol] [get_bd_pins ofdm_demodulation_0/i_start_symbol]
  connect_bd_net -net i_config_valid_1 [get_bd_ports i_config_valid] [get_bd_pins ulcch_parameter_0/i_config_valid]
  connect_bd_net -net i_group_hopping_1 [get_bd_ports i_group_hopping] [get_bd_pins ulcch_parameter_0/i_group_hopping]
  connect_bd_net -net i_hopping_ID_1 [get_bd_ports i_hopping_ID] [get_bd_pins ulcch_parameter_0/i_hopping_ID]
  connect_bd_net -net i_pucch1_valid_1 [get_bd_ports i_pucch1_valid] [get_bd_pins ulcch_parameter_0/i_pucch_valid]
  connect_bd_net -net ofdm_demodulation_0_start_symbol [get_bd_pins frame_sync_1/in_start_symbol] [get_bd_pins ofdm_demodulation_0/start_symbol]
  connect_bd_net -net physical_control_0_start_symbol [get_bd_pins frame_sync_0/in_start_symbol] [get_bd_pins physical_control_0/start_symbol]
  connect_bd_net -net pucch_parameter_1 [get_bd_ports pucch_parameter] [get_bd_pins ulcch_parameter_0/ulcch_para]
  connect_bd_net -net rst_1 [get_bd_ports rst] [get_bd_pins frame_sync_0/rst] [get_bd_pins frame_sync_1/rst] [get_bd_pins ofdm_demodulation_0/rst] [get_bd_pins physical_control_0/rst] [get_bd_pins ulcch_parameter_0/rst]
  connect_bd_net -net stop_trigger_1 [get_bd_ports stop_trigger] [get_bd_pins physical_control_0/stop_request_trigger]
  connect_bd_net -net trigger_05_1 [get_bd_ports trigger_05] [get_bd_pins physical_control_0/in_0_5ms]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins ofdm_demodulation_0/scale_factor] [get_bd_pins xlconstant_0/dout]
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


