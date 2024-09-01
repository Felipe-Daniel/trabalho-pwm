module top (clk, SW, HEX0, HEX1, HEX2);

input wire clk;
input wire [2:0] SW;
output wire [6:0] HEX0;
output wire [6:0] HEX1;
output wire [6:0] HEX2;

wire swt_increase, swt_decrease, swt_start, swt_stop;
wire motor_pwm, motor_running;

controller controller (
  .clk(clk),
  .SW(SW),
  .swt_increase(swt_increase),
  .swt_decrease(swt_decrease),
  .swt_start_stop(swt_start_stop)
);


ihm ihm (
    .clk(clk),        
    .rst(rst),                 
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
 .PWM_OUT(PWM_OUT)
);

binary_to_digits binary_to_digits (
    .binary_in(PWM_OUT),
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
