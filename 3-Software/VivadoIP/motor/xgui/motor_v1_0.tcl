# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  set LIMIT_MASK_DIR_0 [ipgui::add_param $IPINST -name "LIMIT_MASK_DIR_0" -parent ${Page_0}]
  set_property tooltip {Direction 0 limit switch activation mask} ${LIMIT_MASK_DIR_0}
  set LIMIT_MASK_DIR_1 [ipgui::add_param $IPINST -name "LIMIT_MASK_DIR_1" -parent ${Page_0}]
  set_property tooltip {Direction 1 limit switch activation mask} ${LIMIT_MASK_DIR_1}
  set NUM_MOTOR_LIMIT_FLAGS [ipgui::add_param $IPINST -name "NUM_MOTOR_LIMIT_FLAGS" -parent ${Page_0}]
  set_property tooltip {Number of limit switch inputs} ${NUM_MOTOR_LIMIT_FLAGS}
  set PWM_CNT_BIT_WIDTH [ipgui::add_param $IPINST -name "PWM_CNT_BIT_WIDTH" -parent ${Page_0}]
  set_property tooltip {Bit width of PWM counter} ${PWM_CNT_BIT_WIDTH}


}

proc update_PARAM_VALUE.LIMIT_MASK_DIR_0 { PARAM_VALUE.LIMIT_MASK_DIR_0 } {
	# Procedure called to update LIMIT_MASK_DIR_0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LIMIT_MASK_DIR_0 { PARAM_VALUE.LIMIT_MASK_DIR_0 } {
	# Procedure called to validate LIMIT_MASK_DIR_0
	return true
}

proc update_PARAM_VALUE.LIMIT_MASK_DIR_1 { PARAM_VALUE.LIMIT_MASK_DIR_1 } {
	# Procedure called to update LIMIT_MASK_DIR_1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LIMIT_MASK_DIR_1 { PARAM_VALUE.LIMIT_MASK_DIR_1 } {
	# Procedure called to validate LIMIT_MASK_DIR_1
	return true
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


proc update_MODELPARAM_VALUE.PWM_CNT_BIT_WIDTH { MODELPARAM_VALUE.PWM_CNT_BIT_WIDTH PARAM_VALUE.PWM_CNT_BIT_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PWM_CNT_BIT_WIDTH}] ${MODELPARAM_VALUE.PWM_CNT_BIT_WIDTH}
}

proc update_MODELPARAM_VALUE.NUM_MOTOR_LIMIT_FLAGS { MODELPARAM_VALUE.NUM_MOTOR_LIMIT_FLAGS PARAM_VALUE.NUM_MOTOR_LIMIT_FLAGS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_MOTOR_LIMIT_FLAGS}] ${MODELPARAM_VALUE.NUM_MOTOR_LIMIT_FLAGS}
}

proc update_MODELPARAM_VALUE.LIMIT_MASK_DIR_0 { MODELPARAM_VALUE.LIMIT_MASK_DIR_0 PARAM_VALUE.LIMIT_MASK_DIR_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LIMIT_MASK_DIR_0}] ${MODELPARAM_VALUE.LIMIT_MASK_DIR_0}
}

proc update_MODELPARAM_VALUE.LIMIT_MASK_DIR_1 { MODELPARAM_VALUE.LIMIT_MASK_DIR_1 PARAM_VALUE.LIMIT_MASK_DIR_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LIMIT_MASK_DIR_1}] ${MODELPARAM_VALUE.LIMIT_MASK_DIR_1}
}

