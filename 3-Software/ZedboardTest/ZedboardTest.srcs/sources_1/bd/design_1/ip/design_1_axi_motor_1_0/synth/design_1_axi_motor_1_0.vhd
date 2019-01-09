-- (c) Copyright 1995-2019 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: user.edu:Crane:axi_motor:1.0
-- IP Revision: 4

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY xil_defaultlib;
USE xil_defaultlib.axi_motor_v1_0;

ENTITY design_1_axi_motor_1_0 IS
  PORT (
    pwm_clk : IN STD_LOGIC;
    motor_pwm : OUT STD_LOGIC;
    motor_direc : OUT STD_LOGIC;
    motor_brake : OUT STD_LOGIC;
    motor_limit_hard : IN STD_LOGIC;
    motor_limit_soft : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    motor_therm : IN STD_LOGIC;
    axi_awaddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    axi_awvalid : IN STD_LOGIC;
    axi_awready : OUT STD_LOGIC;
    axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    axi_wvalid : IN STD_LOGIC;
    axi_wready : OUT STD_LOGIC;
    axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    axi_bvalid : OUT STD_LOGIC;
    axi_bready : IN STD_LOGIC;
    axi_araddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    axi_arvalid : IN STD_LOGIC;
    axi_arready : OUT STD_LOGIC;
    axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    axi_rvalid : OUT STD_LOGIC;
    axi_rready : IN STD_LOGIC;
    axi_aclk : IN STD_LOGIC;
    axi_aresetn : IN STD_LOGIC
  );
END design_1_axi_motor_1_0;

ARCHITECTURE design_1_axi_motor_1_0_arch OF design_1_axi_motor_1_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_axi_motor_1_0_arch: ARCHITECTURE IS "yes";
  COMPONENT axi_motor_v1_0 IS
    GENERIC (
      C_AXI_DATA_WIDTH : INTEGER; -- Width of S_AXI data bus
      C_AXI_ADDR_WIDTH : INTEGER; -- Width of S_AXI address bus
      PWM_CNT_BIT_WIDTH : INTEGER;
      NUM_MOTOR_LIMIT_FLAGS : INTEGER
    );
    PORT (
      pwm_clk : IN STD_LOGIC;
      motor_pwm : OUT STD_LOGIC;
      motor_direc : OUT STD_LOGIC;
      motor_brake : OUT STD_LOGIC;
      motor_limit_hard : IN STD_LOGIC;
      motor_limit_soft : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      motor_therm : IN STD_LOGIC;
      axi_awaddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      axi_awvalid : IN STD_LOGIC;
      axi_awready : OUT STD_LOGIC;
      axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      axi_wvalid : IN STD_LOGIC;
      axi_wready : OUT STD_LOGIC;
      axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      axi_bvalid : OUT STD_LOGIC;
      axi_bready : IN STD_LOGIC;
      axi_araddr : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      axi_arvalid : IN STD_LOGIC;
      axi_arready : OUT STD_LOGIC;
      axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      axi_rvalid : OUT STD_LOGIC;
      axi_rready : IN STD_LOGIC;
      axi_aclk : IN STD_LOGIC;
      axi_aresetn : IN STD_LOGIC
    );
  END COMPONENT axi_motor_v1_0;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_axi_motor_1_0_arch: ARCHITECTURE IS "axi_motor_v1_0,Vivado 2017.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_axi_motor_1_0_arch : ARCHITECTURE IS "design_1_axi_motor_1_0,axi_motor_v1_0,{}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF pwm_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 pwm_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF axi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF axi_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF axi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF axi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF axi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF axi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF axi_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF axi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF axi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF axi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF axi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 AXI RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF axi_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 AXI_CLK CLK, xilinx.com:signal:clock:1.0 axi_aclk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF axi_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 AXI_RST RST, xilinx.com:signal:reset:1.0 axi_aresetn RST";
BEGIN
  U0 : axi_motor_v1_0
    GENERIC MAP (
      C_AXI_DATA_WIDTH => 32,
      C_AXI_ADDR_WIDTH => 5,
      PWM_CNT_BIT_WIDTH => 32,
      NUM_MOTOR_LIMIT_FLAGS => 1
    )
    PORT MAP (
      pwm_clk => pwm_clk,
      motor_pwm => motor_pwm,
      motor_direc => motor_direc,
      motor_brake => motor_brake,
      motor_limit_hard => motor_limit_hard,
      motor_limit_soft => motor_limit_soft,
      motor_therm => motor_therm,
      axi_awaddr => axi_awaddr,
      axi_awprot => axi_awprot,
      axi_awvalid => axi_awvalid,
      axi_awready => axi_awready,
      axi_wdata => axi_wdata,
      axi_wstrb => axi_wstrb,
      axi_wvalid => axi_wvalid,
      axi_wready => axi_wready,
      axi_bresp => axi_bresp,
      axi_bvalid => axi_bvalid,
      axi_bready => axi_bready,
      axi_araddr => axi_araddr,
      axi_arprot => axi_arprot,
      axi_arvalid => axi_arvalid,
      axi_arready => axi_arready,
      axi_rdata => axi_rdata,
      axi_rresp => axi_rresp,
      axi_rvalid => axi_rvalid,
      axi_rready => axi_rready,
      axi_aclk => axi_aclk,
      axi_aresetn => axi_aresetn
    );
END design_1_axi_motor_1_0_arch;
