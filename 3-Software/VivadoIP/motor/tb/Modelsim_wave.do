onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Testbench
add wave -noupdate /motor_tb/clock
add wave -noupdate /motor_tb/reset
add wave -noupdate /motor_tb/enable
add wave -noupdate -expand -group {TB Commands} -radix unsigned /motor_tb/com_period
add wave -noupdate -expand -group {TB Commands} -radix unsigned /motor_tb/com_duty
add wave -noupdate -expand -group {TB Commands} /motor_tb/com_brake
add wave -noupdate -expand -group {TB Commands} /motor_tb/com_direc
add wave -noupdate -expand -group {TB Flags} /motor_tb/flag_therm
add wave -noupdate -expand -group {TB Flags} /motor_tb/flag_limit
add wave -noupdate -expand -group {TB Motor Outputs} /motor_tb/motor_pwm
add wave -noupdate -expand -group {TB Motor Outputs} /motor_tb/motor_brake
add wave -noupdate -expand -group {TB Motor Outputs} /motor_tb/motor_direc
add wave -noupdate -expand -group {TB Motor Inputs} /motor_tb/motor_therm
add wave -noupdate -expand -group {TB Motor Inputs} /motor_tb/motor_hard_lim
add wave -noupdate -expand -group {TB Motor Inputs} /motor_tb/motor_soft_lim
add wave -noupdate -divider {Motor Unit}
add wave -noupdate /motor_tb/UUT/LIMIT_MASK_DIR_0
add wave -noupdate /motor_tb/UUT/LIMIT_MASK_DIR_1
add wave -noupdate /motor_tb/UUT/PWM_CLK
add wave -noupdate /motor_tb/UUT/RESET
add wave -noupdate -expand -group {Motor Outputs} /motor_tb/UUT/MOTOR_PWM
add wave -noupdate -expand -group {Motor Outputs} /motor_tb/UUT/MOTOR_DIREC
add wave -noupdate -expand -group {Motor Outputs} /motor_tb/UUT/MOTOR_BRAKE
add wave -noupdate -expand -group {Motor Inputs} /motor_tb/UUT/MOTOR_LIMIT_HARD
add wave -noupdate -expand -group {Motor Inputs} /motor_tb/UUT/MOTOR_LIMIT_SOFT
add wave -noupdate -expand -group {Motor Inputs} /motor_tb/UUT/MOTOR_THERM
add wave -noupdate -expand -group {Command Signals} /motor_tb/UUT/ENABLE
add wave -noupdate -expand -group {Command Signals} /motor_tb/UUT/BRAKE
add wave -noupdate -expand -group {Command Signals} /motor_tb/UUT/DIRECTION
add wave -noupdate -expand -group {Command Signals} -radix unsigned /motor_tb/UUT/PERIOD
add wave -noupdate -expand -group {Command Signals} -radix unsigned /motor_tb/UUT/DUTY
add wave -noupdate -expand -group Flags /motor_tb/UUT/LIMIT_FLAGS
add wave -noupdate -expand -group Flags /motor_tb/UUT/THERM_FLAG
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 334
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {5250 ps}
