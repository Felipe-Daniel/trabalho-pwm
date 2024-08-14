module top (clk, KEY);

input wire clk;
input wire [3:0] KEY;

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
endmodule
