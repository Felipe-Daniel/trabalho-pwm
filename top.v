module top (clk, SW, HEX0, HEX1, HEX2);

input wire clk;
input wire [17:0] SW;
output wire [6:0] HEX0;
output wire [6:0] HEX1;
output wire [6:0] HEX2;

wire swt_increase, swt_decrease, swt_start_stop;
wire motor_pwm, motor_running;
wire [7:0] PWM_OUT;
wire [3:0] DUTY_CYCLE;
wire [3:0] digit0, digit1, digit2;


controller controller (
  .clk(clk),
  .SW(SW),
  .swt_increase(swt_increase),
  .swt_decrease(swt_decrease),
  .swt_start_stop(swt_start_stop)
);


ihm ihm (
    .clk(clk),                    
    .swt_increase(swt_increase),  
    .swt_decrease(swt_decrease), 
    .swt_start_stop(swt_start_stop),      
    .motor_pwm(motor_pwm),      
    .motor_running(motor_running)
);

pwm pwm (
 .clk(clk),
 .swt_increase(swt_increase),  
 .swt_decrease(swt_decrease),
 .PWM_OUT(PWM_OUT),
 . DUTY_CYCLE( DUTY_CYCLE)
);

binary_to_digits binary_to_digits (
    .binary_in( DUTY_CYCLE),
    .digit0(digit0),
    .digit1(digit1),
    .digit2(digit2)
);

display display(
    .clk(clk),
    .digit0(digit0),    // Units digit
    .digit1(digit1),    // Tens digit
    .digit2(digit2),    // Hundreds digit
    .HEX0(HEX0),
    .HEX1(HEX1),
    .HEX2(HEX2)
);


endmodule
