
#ifndef AXI_MOTOR_H
#define AXI_MOTOR_H


/****************** Include Files ********************/
#include "xil_types.h"
#include "xstatus.h"

#define AXI_MOTOR_AXI_SLV_REG0_OFFSET 0
#define AXI_MOTOR_AXI_SLV_REG1_OFFSET 4
#define AXI_MOTOR_AXI_SLV_REG2_OFFSET 8
#define AXI_MOTOR_AXI_SLV_REG3_OFFSET 12
#define AXI_MOTOR_AXI_SLV_REG4_OFFSET 16
#define AXI_MOTOR_AXI_SLV_REG5_OFFSET 20
#define AXI_MOTOR_AXI_SLV_REG6_OFFSET 24
#define AXI_MOTOR_AXI_SLV_REG7_OFFSET 28


/**************************** Type Definitions *****************************/
/**
 *
 * Write a value to a AXI_MOTOR register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the AXI_MOTORdevice.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void AXI_MOTOR_mWriteReg(u32 BaseAddress, unsigned RegOffset, u32 Data)
 *
 */
#define AXI_MOTOR_mWriteReg(BaseAddress, RegOffset, Data) \
  	Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))

/**
 *
 * Read a value from a AXI_MOTOR register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the AXI_MOTOR device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	u32 AXI_MOTOR_mReadReg(u32 BaseAddress, unsigned RegOffset)
 *
 */
#define AXI_MOTOR_mReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))


/*
 * Register map for the AXI_MOTOR module
 */
typedef struct AXI_MOTOR_REG_MAP {
	// Slave register 0
	uint32_t period;

	// Slave register 1
	uint32_t duty;

	// Slave register 2
	uint32_t enable:1;
	uint32_t brake:1;
	uint32_t direction:1;
	uint32_t invert_Brake:1;
	uint32_t invert_HardLimit:1;
	uint32_t invert_therm:1;
	uint32_t :26;

	// Slave register 3
	uint32_t flag_hardLimit:1;
	uint32_t flag_softLimit:30;
	uint32_t flag_therm:1;

	// Slave register 4
	uint32_t limitMask_dir0;

	//Slave register 5
	uint32_t limitMask_dir1;

}__attribute__((__packed__)) AXI_MOTOR_REG_MAP;

/************************** Function Prototypes ****************************/
/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the AXI_MOTOR instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus AXI_MOTOR_Reg_SelfTest(void * baseaddr_p);

#endif // AXI_MOTOR_H
