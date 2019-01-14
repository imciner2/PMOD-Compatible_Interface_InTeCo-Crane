/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "axi_motor.h"

//Bit 0: BTNC
//Bit 1: BTND
//Bit 2: BTNL
//Bit 3: BTNR
//Bit 4: BTNU
typedef struct BUTTONS {
	uint8_t BTNC:1;
	uint8_t BTND:1;
	uint8_t BTNL:1;
	uint8_t BTNR:1;
	uint8_t BTNU:1;
} BUTTONS;

typedef struct SWITCHES {
	uint8_t SW0:1;
	uint8_t SW1:1;
	uint8_t SW2:1;
	uint8_t SW3:1;
	uint8_t SW4:1;
	uint8_t SW5:1;
	uint8_t SW6:1;
	uint8_t SW7:1;

}SWITCHES;

typedef struct LEDS {
	uint8_t LED0:1;
	uint8_t LED1:1;
	uint8_t LED2:1;
	uint8_t LED3:1;
	uint8_t LED4:1;
	uint8_t LED5:1;
	uint8_t LED6:1;
	uint8_t LED7:1;
}LEDS;


int main()
{
    init_platform();

    print("Hello World\n\r");

    BUTTONS* btn = (BUTTONS*) XPAR_AXI_GPIO_0_BASEADDR;
    LEDS*    led = (LEDS*) XPAR_AXI_GPIO_1_BASEADDR;
    SWITCHES* sw = (SWITCHES*) XPAR_AXI_GPIO_2_BASEADDR;

    AXI_MOTOR_REG_MAP* mot_x = (AXI_MOTOR_REG_MAP*) XPAR_AXI_MOTOR_0_AXI_BASEADDR;
    AXI_MOTOR_REG_MAP* mot_y = (AXI_MOTOR_REG_MAP*) XPAR_AXI_MOTOR_1_AXI_BASEADDR;
    AXI_MOTOR_REG_MAP* mot_z = (AXI_MOTOR_REG_MAP*) XPAR_AXI_MOTOR_2_AXI_BASEADDR;

    mot_x->period = 10000;
    mot_x->invert_Brake = 0;
    mot_x->invert_HardLimit = 0;
    mot_x->invert_therm = 1;
    mot_x->limitMask_dir0 = 0;
    mot_x->limitMask_dir1 = 1;

    mot_y->period = 10000;
    mot_y->invert_Brake = 0;
    mot_y->invert_HardLimit = 1;
    mot_y->invert_therm = 1;
    mot_y->limitMask_dir0 = 0;
    mot_y->limitMask_dir1 = 1;

    mot_z->period = 10000;
    mot_z->invert_Brake = 0;
    mot_z->invert_HardLimit = 0;
    mot_z->invert_therm = 1;
    mot_z->limitMask_dir0 = 0;
    mot_z->limitMask_dir1 = 1;


    mot_x->enable = 1;
    mot_y->enable = 1;
    mot_z->enable = 1;

    while ( !sw->SW7 ) {
      led->LED0 = mot_x->flag_therm;
      led->LED1 = mot_x->flag_hardLimit;
      led->LED2 = mot_y->flag_therm;
      led->LED3 = mot_y->flag_hardLimit;
      led->LED4 = mot_z->flag_therm;
      led->LED5 = mot_z->flag_hardLimit;

      mot_x->brake = sw->SW0;
      mot_y->brake = sw->SW1;
      mot_z->direction = sw->SW2;
      mot_z->brake = sw->SW3;

      if (btn->BTNC) {
        mot_z->duty = 2500;
      } else {
        mot_z->duty = 0;
      }

      if (btn->BTND) {
        mot_y->duty = 5000;
        mot_y->direction = 1;
      } else if (btn->BTNU) {
        mot_y->duty = 5000;
        mot_y->direction = 0;
      } else {
        mot_y->duty = 0;
        mot_y->direction = 1;
      }

      if (btn->BTNL) {
        mot_x->duty = 5000;
        mot_x->direction = 1;
      } else if (btn->BTNR) {
        mot_x->duty = 5000;
        mot_x->direction = 0;
      } else {
        mot_x->duty = 0;
        mot_x->direction = 1;
      }
    }

    mot_x->enable = 0;
    mot_y->enable = 0;
    mot_z->enable = 0;

    print("Goodbye Cruel World\r\n");

    cleanup_platform();
    return 0;
}
