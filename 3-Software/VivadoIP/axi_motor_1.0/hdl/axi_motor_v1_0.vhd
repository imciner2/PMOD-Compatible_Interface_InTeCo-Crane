library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity axi_motor_v1_0 is
	generic (
		-- Users to add parameters here
		PWM_CNT_BIT_WIDTH     : integer := 32;
		NUM_MOTOR_LIMIT_FLAGS : integer := 30;
		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface AXI
		C_AXI_DATA_WIDTH	: integer	:= 32;
		C_AXI_ADDR_WIDTH	: integer	:= 5
	);
	port (
		-- Users to add ports here

		-- PWM clock
		pwm_clk     : in  std_logic;

		-- PWM output to the motor
		motor_pwm	  : out std_logic;

		-- Direction output to the motor
		motor_direc : out std_logic;

		-- Brake output to the motor
		motor_brake : out std_logic;

		-- Limit switch inputs to the module
		motor_limit_hard : in std_logic;
		motor_limit_soft : in std_logic_vector(NUM_MOTOR_LIMIT_FLAGS-1 downto 0);

		-- Thermal flag from the motor
		motor_therm : in  std_logic;


		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface AXI
		axi_aclk	  : in std_logic;
		axi_aresetn	: in std_logic;
		axi_awaddr	: in std_logic_vector(C_AXI_ADDR_WIDTH-1 downto 0);
		axi_awprot	: in std_logic_vector(2 downto 0);
		axi_awvalid	: in std_logic;
		axi_awready	: out std_logic;
		axi_wdata	  : in std_logic_vector(C_AXI_DATA_WIDTH-1 downto 0);
		axi_wstrb	  : in std_logic_vector((C_AXI_DATA_WIDTH/8)-1 downto 0);
		axi_wvalid	: in std_logic;
		axi_wready	: out std_logic;
		axi_bresp	  : out std_logic_vector(1 downto 0);
		axi_bvalid	: out std_logic;
		axi_bready	: in std_logic;
		axi_araddr	: in std_logic_vector(C_AXI_ADDR_WIDTH-1 downto 0);
		axi_arprot	: in std_logic_vector(2 downto 0);
		axi_arvalid	: in std_logic;
		axi_arready	: out std_logic;
		axi_rdata	  : out std_logic_vector(C_AXI_DATA_WIDTH-1 downto 0);
		axi_rresp  	: out std_logic_vector(1 downto 0);
		axi_rvalid	: out std_logic;
		axi_rready	: in std_logic
	);
end axi_motor_v1_0;

architecture arch_imp of axi_motor_v1_0 is

	-- component declaration
	component axi_motor_v1_0_AXI is
		generic (
		PWM_CNT_BIT_WIDTH     : integer := 32;
		NUM_MOTOR_LIMIT_FLAGS : integer := 32;
		C_S_AXI_DATA_WIDTH  	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	  : integer	:= 5
		);
		port (
		PWM_CLK          : in  std_logic;
		MOTOR_PWM	       : out std_logic;
		MOTOR_DIREC      : out std_logic;
		MOTOR_BRAKE      : out std_logic;
		MOTOR_LIMIT_HARD : in std_logic;
		MOTOR_LIMIT_SOFT : in std_logic_vector(NUM_MOTOR_LIMIT_FLAGS-1 downto 0);
		MOTOR_THERM      : in  std_logic;
		S_AXI_ACLK  	   : in std_logic;
		S_AXI_ARESETN	   : in std_logic;
		S_AXI_AWADDR	   : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	   : in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	   : in std_logic;
		S_AXI_AWREADY	   : out std_logic;
		S_AXI_WDATA	     : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	     : in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	   : in std_logic;
		S_AXI_WREADY	   : out std_logic;
		S_AXI_BRESP 	   : out std_logic_vector(1 downto 0);
		S_AXI_BVALID	   : out std_logic;
		S_AXI_BREADY	   : in std_logic;
		S_AXI_ARADDR	   : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	   : in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	   : in std_logic;
		S_AXI_ARREADY	   : out std_logic;
		S_AXI_RDATA	     : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP  	   : out std_logic_vector(1 downto 0);
		S_AXI_RVALID	   : out std_logic;
		S_AXI_RREADY	   : in std_logic
		);
	end component axi_motor_v1_0_AXI;

begin

-- Instantiation of Axi Bus Interface AXI
axi_motor_v1_0_AXI_inst : axi_motor_v1_0_AXI
	generic map (
		PWM_CNT_BIT_WIDTH			=> PWM_CNT_BIT_WIDTH,
		NUM_MOTOR_LIMIT_FLAGS => NUM_MOTOR_LIMIT_FLAGS,
		C_S_AXI_DATA_WIDTH  	=> C_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	  => C_AXI_ADDR_WIDTH
	)
	port map (
		PWM_CLK          => pwm_clk,
		MOTOR_PWM	       => motor_pwm,
		MOTOR_DIREC      => motor_direc,
		MOTOR_BRAKE      => motor_brake,
		MOTOR_LIMIT_HARD => motor_limit_hard,
		MOTOR_LIMIT_SOFT => motor_limit_soft,
		MOTOR_THERM      => motor_therm,
		S_AXI_ACLK  	   => axi_aclk,
		S_AXI_ARESETN	   => axi_aresetn,
		S_AXI_AWADDR	   => axi_awaddr,
		S_AXI_AWPROT	   => axi_awprot,
		S_AXI_AWVALID	   => axi_awvalid,
		S_AXI_AWREADY	   => axi_awready,
		S_AXI_WDATA 	   => axi_wdata,
		S_AXI_WSTRB 	   => axi_wstrb,
		S_AXI_WVALID	   => axi_wvalid,
		S_AXI_WREADY	   => axi_wready,
		S_AXI_BRESP  	   => axi_bresp,
		S_AXI_BVALID	   => axi_bvalid,
		S_AXI_BREADY	   => axi_bready,
		S_AXI_ARADDR	   => axi_araddr,
		S_AXI_ARPROT	   => axi_arprot,
		S_AXI_ARVALID	   => axi_arvalid,
		S_AXI_ARREADY	   => axi_arready,
		S_AXI_RDATA	     => axi_rdata,
		S_AXI_RRESP	     => axi_rresp,
		S_AXI_RVALID	   => axi_rvalid,
		S_AXI_RREADY	   => axi_rready
	);

	-- Add user logic here

	-- User logic ends

end arch_imp;
