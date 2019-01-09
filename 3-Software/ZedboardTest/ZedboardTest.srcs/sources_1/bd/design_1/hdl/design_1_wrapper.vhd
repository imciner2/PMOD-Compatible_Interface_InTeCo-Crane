--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.2 (lin64) Build 1909853 Thu Jun 15 18:39:10 MDT 2017
--Date        : Wed Jan  9 20:19:23 2019
--Host        : ee-im176 running 64-bit Ubuntu 16.04.5 LTS
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    MOT_X_BRK : out STD_LOGIC;
    MOT_X_DIR : out STD_LOGIC;
    MOT_X_LIM : in STD_LOGIC;
    MOT_X_OTF : in STD_LOGIC;
    MOT_X_PWM : out STD_LOGIC;
    MOT_Y_BRK : out STD_LOGIC;
    MOT_Y_DIR : out STD_LOGIC;
    MOT_Y_LIM : in STD_LOGIC;
    MOT_Y_OTF : in STD_LOGIC;
    MOT_Y_PWM : out STD_LOGIC;
    MOT_Z_BRK : out STD_LOGIC;
    MOT_Z_DIR : out STD_LOGIC;
    MOT_Z_LIM : in STD_LOGIC;
    MOT_Z_OTF : in STD_LOGIC;
    MOT_Z_PWM : out STD_LOGIC;
    btns_5bits_tri_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    leds_8bits_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    sws_8bits_tri_i : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    btns_5bits_tri_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    leds_8bits_tri_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    sws_8bits_tri_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    MOT_Y_PWM : out STD_LOGIC;
    MOT_Y_BRK : out STD_LOGIC;
    MOT_X_PWM : out STD_LOGIC;
    MOT_X_BRK : out STD_LOGIC;
    MOT_Z_PWM : out STD_LOGIC;
    MOT_Z_BRK : out STD_LOGIC;
    MOT_X_OTF : in STD_LOGIC;
    MOT_Y_OTF : in STD_LOGIC;
    MOT_Z_OTF : in STD_LOGIC;
    MOT_X_DIR : out STD_LOGIC;
    MOT_Y_DIR : out STD_LOGIC;
    MOT_Z_DIR : out STD_LOGIC;
    MOT_X_LIM : in STD_LOGIC;
    MOT_Y_LIM : in STD_LOGIC;
    MOT_Z_LIM : in STD_LOGIC
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      MOT_X_BRK => MOT_X_BRK,
      MOT_X_DIR => MOT_X_DIR,
      MOT_X_LIM => MOT_X_LIM,
      MOT_X_OTF => MOT_X_OTF,
      MOT_X_PWM => MOT_X_PWM,
      MOT_Y_BRK => MOT_Y_BRK,
      MOT_Y_DIR => MOT_Y_DIR,
      MOT_Y_LIM => MOT_Y_LIM,
      MOT_Y_OTF => MOT_Y_OTF,
      MOT_Y_PWM => MOT_Y_PWM,
      MOT_Z_BRK => MOT_Z_BRK,
      MOT_Z_DIR => MOT_Z_DIR,
      MOT_Z_LIM => MOT_Z_LIM,
      MOT_Z_OTF => MOT_Z_OTF,
      MOT_Z_PWM => MOT_Z_PWM,
      btns_5bits_tri_i(4 downto 0) => btns_5bits_tri_i(4 downto 0),
      leds_8bits_tri_o(7 downto 0) => leds_8bits_tri_o(7 downto 0),
      sws_8bits_tri_i(7 downto 0) => sws_8bits_tri_i(7 downto 0)
    );
end STRUCTURE;
