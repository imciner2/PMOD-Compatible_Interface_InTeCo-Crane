library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.all;

entity motor is
  generic (
    -- The PWM counter bit width
    PWM_CNT_BIT_WIDTH     : integer := 32;

    -- The number of soft limit switch inputs
    NUM_MOTOR_LIMIT_FLAGS : integer := 30;

    -- Masks for the limit switch directions
    -- A 1 means that the limit switch will stop movement in that direction
    LIMIT_MASK_DIR_0 : bit_vector(30 downto 0) := b"0000000000000000000000000000000";
    LIMIT_MASK_DIR_1 : bit_vector(30 downto 0) := b"0000000000000000000000000000000"
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
    PERIOD           : in  std_logic_vector(PWM_CNT_BIT_WIDTH-1 downto 0);
    DUTY             : in  std_logic_vector(PWM_CNT_BIT_WIDTH-1 downto 0);

    -- Flags to show motor status
    LIMIT_FLAGS      : out std_logic_vector(NUM_MOTOR_LIMIT_FLAGS downto 0);
    THERM_FLAG       : out std_logic
  );
end motor;

architecture arch_imp of motor is

begin


  motor_drive : entity xil_defaultlib.driver
  generic map(
    PWM_CNT_BIT_WIDTH     => PWM_CNT_BIT_WIDTH,
    NUM_MOTOR_LIMIT_FLAGS => NUM_MOTOR_LIMIT_FLAGS
  )
  port map(
    PWM_CLK          => PWM_CLK,
    RESET            => RESET,

    MOTOR_PWM        => MOTOR_PWM,
    MOTOR_DIREC      => MOTOR_DIREC,
    MOTOR_BRAKE      => MOTOR_BRAKE,
    MOTOR_LIMIT_HARD => MOTOR_LIMIT_HARD,
    MOTOR_LIMIT_SOFT => MOTOR_LIMIT_SOFT,
    MOTOR_THERM      => MOTOR_THERM,

    ENABLE           => ENABLE,
    BRAKE            => BRAKE,
    DIRECTION        => DIRECTION,
    PERIOD           => unsigned( PERIOD ),
    DUTY             => unsigned( DUTY ),
    LIMIT_FLAGS      => LIMIT_FLAGS,
    THERM_FLAG       => THERM_FLAG,

    LIMIT_MASK_DIR_0 => to_stdlogicvector(LIMIT_MASK_DIR_0( NUM_MOTOR_LIMIT_FLAGS downto 0) ),
    LIMIT_MASK_DIR_1 => to_stdlogicvector(LIMIT_MASK_DIR_1( NUM_MOTOR_LIMIT_FLAGS downto 0) )
  );

end arch_imp;
