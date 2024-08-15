`timescale 1ns/100ps

module ihm_tb;

	reg clk, rst, swt_start_stop, swt_increase, swt_decrease;
	wire motor_running, motor_pwm;

	ihm uut (.clk(clk),
	.rst(rst),
	.swt_start_stop(swt_start_stop),
	.swt_increase(swt_increase),
	.swt_decrease(swt_decrease),
	.motor_running(motor_running),
	.motor_pwm(motor_pwm));
	
	initial begin
		clk = 0;
		rst = 0;
		swt_start_stop = 0;
		swt_increase = 0;
		swt_decrease = 0;
	
	
		#10
		rst = 1;
		
		#10
		rst = 0;
		
		#10
		swt_increase = 1;
		swt_decrease = 0;
		
		#10
		swt_increase = 0;
		swt_decrease = 0;
		swt_start_stop = 0;
		
		#10
		swt_increase = 0;
		swt_decrease = 1;
		
		#10
		swt_increase = 1;
		swt_decrease = 1;
		
		#10 //mudança para motor_on
		swt_increase = 1;
		swt_decrease = 0;
		swt_start_stop = 1;
		
		#10 //mudança para standby
		swt_start_stop = 0;
		
		#10 //mudança para motor_on
		swt_start_stop = 1;
		
		#10 //increase
		swt_increase= 1;
		swt_decrease = 0;
		
		#10 //decrease
		swt_increase = 0;
		swt_decrease = 1;
	
		#10 //neutro
		swt_increase = 1;
		swt_decrease = 1;
		
		#10 //rst
		rst = 1;
		
		#10 
		rst = 0;
		
		#50
		$stop;
	
	end
	
	always #10 clk = ~clk;
	
endmodule