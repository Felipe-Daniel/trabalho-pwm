module pwm
 (
 clk,
 swt_increase, // entrada para aumentar em 10%
 swt_decrease, // entrada para diminuir em 10%
 PWM_OUT,
 counter_PWM // sinal de saída PWM de 10MHz
    );
 input clk;
 input swt_increase;
 input swt_decrease;
 output PWM_OUT;
 output counter_PWM;
 wire slow_clk_enable; // sinal de habilitação de clock lento para FFs de debounce
 reg[27:0] counter_debounce = 0; // contador para criar sinais de habilitação de clock lento
 wire tmp1, tmp2, duty_inc;
 wire tmp3, tmp4, duty_dec;
 reg[3:0] counter_PWM = 5; // contador para criar sinal PWM de 10MHz
 reg[3:0] DUTY_CYCLE = 5; // começa em 50%

 always @(posedge clk)
 begin
   counter_debounce <= counter_debounce + 1;
   if(counter_debounce >= 1)
    counter_debounce <= 0;
 end
 
 assign slow_clk_enable = counter_debounce == 1 ? 1 : 0;

 DFF_PWM PWM_DFF1(clk, slow_clk_enable, swt_increase, tmp1);
 DFF_PWM PWM_DFF2(clk, slow_clk_enable, tmp1, tmp2); 
 assign duty_inc =  tmp1 & (~tmp2) & slow_clk_enable;
 
 // FFs de debounce para o botão de diminuir
 DFF_PWM PWM_DFF3(clk, slow_clk_enable, swt_decrease, tmp3);
 DFF_PWM PWM_DFF4(clk, slow_clk_enable, tmp3, tmp4); 
 assign duty_dec =  tmp3 & (~tmp4) & slow_clk_enable;
 
 // variar o ciclo usando os botões
 always @(posedge clk)
 begin
   if(duty_inc == 1 && DUTY_CYCLE <= 9) 
    DUTY_CYCLE <= DUTY_CYCLE + 1;
   else if(duty_dec == 1 && DUTY_CYCLE >= 1) 
    DUTY_CYCLE <= DUTY_CYCLE - 1;
 end 
 
 always @(posedge clk)
 begin
   counter_PWM <= counter_PWM + 1;
   if(counter_PWM >= 9)
    counter_PWM <= 0;
 end
 
 assign PWM_OUT = counter_PWM < DUTY_CYCLE ? 1 : 0;
 
endmodule

module DFF_PWM(clk, en, D, Q);
input clk, en, D;
output reg Q;
always @(posedge clk)
begin 
 if(en == 1) // sinal de habilitação de clock lento
  Q <= D;
end 
endmodule
