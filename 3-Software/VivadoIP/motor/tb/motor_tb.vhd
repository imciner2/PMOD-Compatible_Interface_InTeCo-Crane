library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library xil_defaultlib;
use xil_defaultlib.all;


entity motor_tb is
    generic (
        PWM_CNT_BIT_WIDTH     : integer := 32;
        NUM_MOTOR_LIMIT_FLAGS : integer := 4
    );
end motor_tb;

architecture tb of motor_tb is
    constant T : time := 10 ps;

    signal clock  : std_logic;
    signal reset  : std_logic;
    signal enable : std_logic;

    signal com_period : std_logic_vector( PWM_CNT_BIT_WIDTH-1 downto 0); 
    signal com_duty   : std_logic_vector( PWM_CNT_BIT_WIDTH-1 downto 0); 

    signal com_brake  : std_logic;
    signal com_direc  : std_logic;

    signal flag_therm : std_logic;
    signal flag_limit : std_logic_vector(NUM_MOTOR_LIMIT_FLAGS downto 0);

    signal motor_pwm   : std_logic;
    signal motor_brake : std_logic;
    signal motor_direc : std_logic;

    signal motor_therm    : std_logic;
    signal motor_hard_lim : std_logic;
    signal motor_soft_lim : std_logic_vector(NUM_MOTOR_LIMIT_FLAGS-1 downto 0);
begin
    UUT : entity xil_defaultlib.motor
    generic map(
        PWM_CNT_BIT_WIDTH     => PWM_CNT_BIT_WIDTH,
        NUM_MOTOR_LIMIT_FLAGS => NUM_MOTOR_LIMIT_FLAGS,

        -- Masks for the limit switch directions
        -- A 1 means that the limit switch will stop movement in that direction
        LIMIT_MASK_DIR_0 => b"0000000000000000000000000001101",
        LIMIT_MASK_DIR_1 => b"0000000000000000000000000001010"
    )
    port map(
        -- PWM clock
        PWM_CLK          => clock,
        RESET            => reset,

        -------------------------------------------------------
        -- These are ports to the motor
        -------------------------------------------------------
        -- PWM output to the motor
        MOTOR_PWM        => motor_pwm,

        -- Direction output to the motor
        MOTOR_DIREC      => motor_direc,

        -- Brake output to the motor
        MOTOR_BRAKE      => motor_brake,

        -- Limit switch input to the driver
        MOTOR_LIMIT_HARD => motor_hard_lim,
        MOTOR_LIMIT_SOFT => motor_soft_lim,

        -- Thermal flag from the motor
        MOTOR_THERM      => motor_therm,

        -------------------------------------------------------
        -- These are ports to other logic
        -------------------------------------------------------
        ENABLE           => enable,

        -- Brake the motor
        BRAKE            => com_brake,
        
        -- The direction to drive the motor
        DIRECTION        => com_direc,

        -- The period and duty cycle for the PWM
        PERIOD           => com_period,
        DUTY             => com_duty,

        -- Flags to show motor status
        LIMIT_FLAGS      => flag_limit,
        THERM_FLAG       => flag_therm
      );

    -- Create the clock
    clk : process
    begin
        clock <= '1';
        wait for T/2;
        clock <= '0';
        wait for T/2;
    end process;

    -- Create the main test process
    test : process
    begin
        -- Configure the core
        com_duty   <= std_logic_vector(to_unsigned(5, com_duty'length));
        com_period <= std_logic_vector(to_unsigned(10, com_period'length));
        com_brake  <= '0';
        com_direc  <= '0';

        motor_therm    <= '0';
        motor_hard_lim <= '0';
        motor_soft_lim <= "0000";

        reset  <= '1';
        enable <= '0';

        
        wait for T;

        -- Enable the core and run it
        reset  <= '0';
        enable <= '1';
        wait for 20*T;

        -- Test the direction change
        com_direc <= '1';
        wait for 20*T;

        -- Change the duty cycle partway through the period
        com_duty <= std_logic_vector(to_unsigned(2, com_duty'length));
        wait for 40*T;

        -- Test disable
        enable <= '0';
        wait for 10*T;

        -- Re-enable
        enable <= '1';
        wait for 20*T;

        -- Test the brake command
        com_brake <= '1';
        wait for 20*T;
        com_brake <= '0';
        wait for 20*T;

        -- Test the thermal flag
        motor_therm <= '1';
        wait for 20*T;
        motor_therm <= '0';
        wait for 20*T;

        -- Test the hard limit (masked to stop the motor in direction 0)
        motor_hard_lim <= '1';
        com_direc <= '1';
        wait for 20*T;
        com_direc <= '0';
        wait for 20*T;
        motor_hard_lim <= '0';
        wait for 20*T;

        -- Test the soft limit 1 (masked to stop the motor in direction 1)
        motor_soft_lim <= "0001";
        com_direc <= '1';
        wait for 20*T;
        com_direc <= '0';
        wait for 20*T;
        motor_soft_lim <= "0000";
        wait for 20*T;

        -- Test the soft limit 2 (masked to stop the motor in direction 0)
        motor_soft_lim <= "0010";
        com_direc <= '1';
        wait for 20*T;
        com_direc <= '0';
        wait for 20*T;
        motor_soft_lim <= "0000";
        wait for 20*T;

        -- Test the soft limit 3 (masked to stop the motor in both directions)
        motor_soft_lim <= "0100";
        com_direc <= '1';
        wait for 20*T;
        com_direc <= '0';
        wait for 20*T;
        motor_soft_lim <= "0000";
        wait for 20*T;

        -- Test the soft limit 4 (no mask, so should not stop the motor)
        motor_soft_lim <= "1000";
        com_direc <= '1';
        wait for 20*T;
        com_direc <= '0';
        wait for 20*T;
        motor_soft_lim <= "0000";
        wait for 20*T;

        reset <= '1';
        wait;
    end process;


end tb ;
