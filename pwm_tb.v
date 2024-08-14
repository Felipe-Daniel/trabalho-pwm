`timescale 1ns / 1ps
module tb_PWM_Generator_Verilog;
 // Inputs
 reg clk;
 reg btn_increase;
 reg btn_decrease;
 // Outputs
 wire PWM_OUT;
 // Instantiate the PWM Generator with variable duty cycle in Verilog
 PWM_Generator_Verilog PWM_Generator_Unit(
  .clk(clk), 
  .btn_increase(btn_increase), 
  .btn_decrease(btn_decrease), 
  .PWM_OUT(PWM_OUT)
 );
 // Create 100Mhz clock
 initial begin
 clk = 0;
 forever #5 clk = ~clk;
 end 
 initial begin
  btn_increase = 0;
  btn_decrease = 0;
  #100; 
    btn_increase = 1; 
  #100;// increase duty cycle by 10%
    btn_increase = 0;
  #100; 
    btn_increase = 1;
  #100;// increase duty cycle by 10%
    btn_increase = 0;
  #100; 
    btn_increase = 1;
  #100;// increase duty cycle by 10%
    btn_increase = 0;
  #100;
    btn_decrease = 1; 
  #100;//decrease duty cycle by 10%
    btn_decrease = 0;
  #100; 
    btn_decrease = 1;
  #100;//decrease duty cycle by 10%
    btn_decrease = 0;
  #100;
    btn_decrease = 1;
  #100;//decrease duty cycle by 10%
    btn_decrease = 0;
 end
endmodule