

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "axi_motor" "NUM_INSTANCES" "DEVICE_ID"  "C_AXI_BASEADDR" "C_AXI_HIGHADDR"
}
