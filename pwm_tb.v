`timescale 1ns / 100ps
module pwm_tb;
 // Inputs
 reg clk;
 reg swt_increase;
 reg swt_decrease;
 // Outputs
 wire PWM_OUT;
 wire [3:0] counter_PWM;
 // Instantiate the PWM Generator with variable duty cycle in Verilog
 
 pwm pwm(
  .clk(clk), 
  .swt_increase(swt_increase), 
  .swt_decrease(swt_decrease), 
  .PWM_OUT(PWM_OUT),
  .counter_PWM(counter_PWM)
 );
 // Create 100Mhz clock
 initial begin
	 clk = 0;
	 forever #5 clk = ~clk;
 end 
 initial begin
  swt_increase = 0;
  swt_decrease = 0;
   
  #100;
	 swt_increase = 1; 
  #100;// increase duty cycle by 10%
    swt_increase = 0;
  #100; 
    swt_increase = 1;
  #100;// increase duty cycle by 10%
    swt_increase = 0;
  #100; 
    swt_increase = 1;
  #100;// increase duty cycle by 10%
    swt_increase = 0;
  #100;
    swt_increase = 1; 
  #100;//decrease duty cycle by 10%
    swt_increase = 0;
  #100; 
    swt_increase = 1;
  #100;//decrease duty cycle by 10%
    swt_increase = 0;
  #100;
    swt_increase = 1;
  #100;//decrease duty cycle by 10%
    swt_increase = 0;
	 
	 
 end
endmodule