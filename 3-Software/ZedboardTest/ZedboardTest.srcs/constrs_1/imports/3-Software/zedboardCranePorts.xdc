# This file contains the constraints for the IO pins for the crane interface
# to the Zedboard when it is attached using the connections shown at;
# https://github.com/imciner2/PMOD-Compatible_Interface_InTeCo-Crane/wiki/Zedboard-Interface

# ----------------------------------------------------------------------------
# JA Pmod - Angle Encoders
# ----------------------------------------------------------------------------
#set_property -dict {PACKAGE_PIN Y11 IOSTANDARD LVCMOS33}  [get_ports {ENC_AX_A}];  # Angle X Encoder A Wave
#set_property -dict {PACKAGE_PIN AA11 IOSTANDARD LVCMOS33} [get_ports {ENC_AX_B}];  # Angle X Encoder B Wave
#set_property -dict {PACKAGE_PIN Y10 IOSTANDARD LVCMOS33}  [get_ports {ENC_AX_A}];  # Angle Y Encoder A Wave
#set_property -dict {PACKAGE_PIN AA9 IOSTANDARD LVCMOS33}  [get_ports {ENC_AX_B}];  # Angle Y Encoder B Wave


# ----------------------------------------------------------------------------
# JB Pmod - Z Axis Motor + Encoder
# ----------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN W11 IOSTANDARD LVCMOS33} [get_ports MOT_Z_PWM]
set_property -dict {PACKAGE_PIN W12 IOSTANDARD LVCMOS33} [get_ports MOT_Z_OTF]
set_property -dict {PACKAGE_PIN W8 IOSTANDARD LVCMOS33} [get_ports {MOT_Z_DIR}];   # Direction Signal
set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports MOT_Z_BRK]
set_property -dict {PACKAGE_PIN V9 IOSTANDARD LVCMOS33} [get_ports {MOT_Z_LIM}];   # Limit Switch
#set_property -dict {PACKAGE_PIN W10 IOSTANDARD LVCMOS33} [get_ports {ENC_Z_A}];  # Encoder A Wave
#set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {ENC_Z_B}];  # Encoder B Wave

# ----------------------------------------------------------------------------
# JC Pmod - Y Axis Motor + Encoder
# ----------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN AB6 IOSTANDARD LVCMOS33} [get_ports MOT_Y_PWM]
set_property -dict {PACKAGE_PIN AB7 IOSTANDARD LVCMOS33} [get_ports MOT_Y_OTF]
set_property -dict {PACKAGE_PIN AA4 IOSTANDARD LVCMOS33} [get_ports {MOT_Y_DIR}];  # Direction Signal
set_property -dict {PACKAGE_PIN Y4 IOSTANDARD LVCMOS33} [get_ports MOT_Y_BRK]
set_property -dict {PACKAGE_PIN T4 IOSTANDARD LVCMOS33}  [get_ports {MOT_Y_LIM}];  # Limit Switch
#set_property -dict {PACKAGE_PIN T6 IOSTANDARD LVCMOS33}  [get_ports {ENC_Y_A}];  # Encoder A Wave
#set_property -dict {PACKAGE_PIN R6 IOSTANDARD LVCMOS33}  [get_ports {ENC_Y_B}];  # Encoder B Wave

# ----------------------------------------------------------------------------
# JD Pmod - X Axis Motor + Encoder
# ----------------------------------------------------------------------------
set_property -dict {PACKAGE_PIN W7 IOSTANDARD LVCMOS33} [get_ports MOT_X_PWM]
set_property -dict {PACKAGE_PIN V7 IOSTANDARD LVCMOS33} [get_ports MOT_X_OTF]
set_property -dict {PACKAGE_PIN V4 IOSTANDARD LVCMOS33} [get_ports {MOT_X_DIR}];  # Direction Signal
set_property -dict {PACKAGE_PIN V5 IOSTANDARD LVCMOS33} [get_ports MOT_X_BRK]
set_property -dict {PACKAGE_PIN U6 IOSTANDARD LVCMOS33} [get_ports {MOT_X_LIM}];  # Limit Switch
#set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33} [get_ports {ENC_X_A}];  # Encoder A Wave
#set_property -dict {PACKAGE_PIN W6 IOSTANDARD LVCMOS33} [get_ports {ENC_X_B}];  # Encoder B Wave

