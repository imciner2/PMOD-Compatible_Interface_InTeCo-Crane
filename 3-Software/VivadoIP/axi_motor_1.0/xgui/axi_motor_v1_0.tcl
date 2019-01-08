# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  #Adding Group
  set Motor_Driver [ipgui::add_group $IPINST -name "Motor Driver" -parent ${Page_0}]
  set_property tooltip {Motor Driver Parameters} ${Motor_Driver}
  set NUM_MOTOR_LIMIT_FLAGS [ipgui::add_param $IPINST -name "NUM_MOTOR_LIMIT_FLAGS" -parent ${Motor_Driver}]
  set_property tooltip {Number of limit flags} ${NUM_MOTOR_LIMIT_FLAGS}
  set PWM_CNT_BIT_WIDTH [ipgui::add_param $IPINST -name "PWM_CNT_BIT_WIDTH" -parent ${Motor_Driver}]
  set_property tooltip {PWM Counter Bit Width} ${PWM_CNT_BIT_WIDTH}

  #Adding Group
  set AXI [ipgui::add_group $IPINST -name "AXI" -parent ${Page_0}]
  set_property tooltip {AXI Parameters} ${AXI}
  set C_AXI_DATA_WIDTH [ipgui::add_param $IPINST -name "C_AXI_DATA_WIDTH" -parent ${AXI} -widget comboBox]
  set_property tooltip {Width of S_AXI data bus} ${C_AXI_DATA_WIDTH}
  set C_AXI_ADDR_WIDTH [ipgui::add_param $IPINST -name "C_AXI_ADDR_WIDTH" -parent ${AXI}]
  set_property tooltip {Width of S_AXI address bus} ${C_AXI_ADDR_WIDTH}
  ipgui::add_param $IPINST -name "C_AXI_BASEADDR" -parent ${AXI}
  ipgui::add_param $IPINST -name "C_AXI_HIGHADDR" -parent ${AXI}



}

proc update_PARAM_VALUE.NUM_MOTOR_LIMIT_FLAGS { PARAM_VALUE.NUM_MOTOR_LIMIT_FLAGS } {
	# Procedure called to update NUM_MOTOR_LIMIT_FLAGS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_MOTOR_LIMIT_FLAGS { PARAM_VALUE.NUM_MOTOR_LIMIT_FLAGS } {
	# Procedure called to validate NUM_MOTOR_LIMIT_FLAGS
	return true
}

proc update_PARAM_VALUE.PWM_CNT_BIT_WIDTH { PARAM_VALUE.PWM_CNT_BIT_WIDTH } {
	# Procedure called to update PWM_CNT_BIT_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PWM_CNT_BIT_WIDTH { PARAM_VALUE.PWM_CNT_BIT_WIDTH } {
	# Procedure called to validate PWM_CNT_BIT_WIDTH
	return true
}

proc update_PARAM_VALUE.C_AXI_DATA_WIDTH { PARAM_VALUE.C_AXI_DATA_WIDTH } {
	# Procedure called to update C_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXI_DATA_WIDTH { PARAM_VALUE.C_AXI_DATA_WIDTH } {
	# Procedure called to validate C_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_AXI_ADDR_WIDTH { PARAM_VALUE.C_AXI_ADDR_WIDTH } {
	# Procedure called to update C_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXI_ADDR_WIDTH { PARAM_VALUE.C_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_AXI_BASEADDR { PARAM_VALUE.C_AXI_BASEADDR } {
	# Procedure called to update C_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXI_BASEADDR { PARAM_VALUE.C_AXI_BASEADDR } {
	# Procedure called to validate C_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_AXI_HIGHADDR { PARAM_VALUE.C_AXI_HIGHADDR } {
	# Procedure called to update C_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXI_HIGHADDR { PARAM_VALUE.C_AXI_HIGHADDR } {
	# Procedure called to validate C_AXI_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_AXI_DATA_WIDTH PARAM_VALUE.C_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_AXI_ADDR_WIDTH PARAM_VALUE.C_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.PWM_CNT_BIT_WIDTH { MODELPARAM_VALUE.PWM_CNT_BIT_WIDTH PARAM_VALUE.PWM_CNT_BIT_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PWM_CNT_BIT_WIDTH}] ${MODELPARAM_VALUE.PWM_CNT_BIT_WIDTH}
}

proc update_MODELPARAM_VALUE.NUM_MOTOR_LIMIT_FLAGS { MODELPARAM_VALUE.NUM_MOTOR_LIMIT_FLAGS PARAM_VALUE.NUM_MOTOR_LIMIT_FLAGS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_MOTOR_LIMIT_FLAGS}] ${MODELPARAM_VALUE.NUM_MOTOR_LIMIT_FLAGS}
}

