module top (clk, KEY, HEX0, HEX1, HEX2);

input wire clk;
input wire [3:0] KEY;
output wire [6:0] HEX0;
output wire [6:0] HEX1;
output wire [6:0] HEX2;

wire btn_increase, btn_decrease, btn_start, btn_stop;
wire motor_pwm, motor_running;

controller controller (
  .clk(clk),
  .KEY(KEY),
  .btn_increace(btn_increace),
  .btn_decrease(btn_decrease),
  .btn_start(start),
  .btn_stop(btn_stop)
);


ihm ihm (
    .clk(clk),        
    .rst(rst),                 
    .btn_increase(btn_increase),  
    .btn_decrease(btn_decrease), 
    .btn_start(btn_start),      
    .btn_stop(btn_stop),     
    .motor_pwm(motor_pwm),      
    .motor_running(motor_running)
);

pwm pwm (
 .clk(clk),
 .btn_increace(btn_increace),  
 .btn_decrease(btn_decrease),
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
