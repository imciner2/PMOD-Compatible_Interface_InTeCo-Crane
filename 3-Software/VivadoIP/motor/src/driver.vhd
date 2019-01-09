library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.all;

entity driver is
  generic (
    -- The PWM counter bit width
    PWM_CNT_BIT_WIDTH     : integer := 32;

    -- The number of limit switch inputs
    NUM_MOTOR_LIMIT_FLAGS : integer := 30
  );
  port (
    -- PWM clock
    PWM_CLK          : in  std_logic;
    RESET            : in  std_logic;

    -------------------------------------------------------
    -- These are ports to the motor
    -------------------------------------------------------
    -- PWM output to the motor
    MOTOR_PWM        : out std_logic;

    -- Direction output to the motor
    MOTOR_DIREC      : out std_logic;

    -- Brake output to the motor
    MOTOR_BRAKE      : out std_logic;

    -- Limit switch input to the driver
    MOTOR_LIMIT_HARD : in  std_logic;
    MOTOR_LIMIT_SOFT : in  std_logic_vector(NUM_MOTOR_LIMIT_FLAGS-1 downto 0);

    -- Thermal flag from the motor
    MOTOR_THERM      : in  std_logic;

    -------------------------------------------------------
    -- These are ports to other logic
    -------------------------------------------------------
    ENABLE           : in  std_logic;

    -- Brake the motor
    BRAKE            : in  std_logic;
    
    -- The direction to drive the motor
    DIRECTION        : in  std_logic;

    -- The period and duty cycle for the PWM
    PERIOD           : in  unsigned(PWM_CNT_BIT_WIDTH-1 downto 0);
    DUTY             : in  unsigned(PWM_CNT_BIT_WIDTH-1 downto 0);

    -- Flags to show motor status
    LIMIT_FLAGS      : out std_logic_vector(NUM_MOTOR_LIMIT_FLAGS downto 0);
    THERM_FLAG       : out std_logic;

    -- Masks for the limit switch directions
    -- A 1 means that the limit switch will stop movement in that direction
    LIMIT_MASK_DIR_0 : in  std_logic_vector(NUM_MOTOR_LIMIT_FLAGS downto 0);
    LIMIT_MASK_DIR_1 : in  std_logic_vector(NUM_MOTOR_LIMIT_FLAGS downto 0)
  );
end driver;

architecture arch_imp of driver is

  signal pwm_enable : std_logic;
  signal limit_met  : std_logic;

begin
  -- Send the brake signal
  MOTOR_BRAKE <= BRAKE;

  -- Get the direction signal
  MOTOR_DIREC <= DIRECTION;

  -- See if a limit switch is active
  limit_test : process (MOTOR_LIMIT_SOFT) is
  begin
    limit_met <= '1';

    if ( MOTOR_LIMIT_SOFT = (MOTOR_LIMIT_SOFT'range => '0') ) then
      limit_met <= '0';
    end if;
  end process;

  -- The PWM is not enabled when the brake is applied, when the thermal flag is active, or when a limit switch is active
  pwm_enable <= (NOT BRAKE) AND (NOT MOTOR_THERM) AND (NOT limit_met) AND (NOT MOTOR_LIMIT_HARD) AND ENABLE;

  -- Populate the flag status outputs
  THERM_FLAG <= MOTOR_THERM;
  LIMIT_FLAGS(NUM_MOTOR_LIMIT_FLAGS downto 0) <= MOTOR_LIMIT_SOFT & MOTOR_LIMIT_HARD;

  -- Create the PWM generator
  PWM_GEN : entity xil_defaultlib.pwm 
  generic map (
    PWM_CNT_BIT_WIDTH => PWM_CNT_BIT_WIDTH
  )
  port map(
    clk        => PWM_CLK,
    en         => pwm_enable,
    rst        => RESET,
    pwm_duty   => DUTY,
    pwm_period => PERIOD,
    pwm_o      => MOTOR_PWM
  );

end arch_imp;
