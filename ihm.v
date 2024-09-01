module ihm(
    input clk, swt_increase, swt_decrease, swt_start_stop,
    output reg motor_pwm, motor_running
	 //output reg [6:0] display
);

// Registrador de estado
reg [1:0] state;
//reg [3:0] contador;

// Codificando estados
parameter standby = 1'b0,
          motor_on = 1'b1;

// Estado inicial
//initial state <= standby;

// Primeiro procedimento - Estado próximo
always @(posedge clk) begin	  
    begin
        case (state)
            standby: begin
                if (swt_start_stop == 1'b1) 
                    state <= motor_on;
                else 
                    state <= standby;
            end
            
            motor_on: begin
                if (swt_start_stop == 1'b0) 
                    state <= standby;
                else 
                    state <= motor_on;
            end
				
            default: state <= standby;
        endcase
    end // <-- Aqui estava faltando o fechamento do bloco `else`
end

// Segundo procedimento - Saídas
always @(state or swt_start_stop or swt_increase or swt_decrease) begin
    case (state)
        standby: begin
            if (swt_start_stop == 1'b1) begin
                motor_pwm = 1'b1;
                motor_running = 1'b1;
					 //contador = 4'b0101; //Quando for ligado, irá para 5
            end else begin
                motor_pwm = 1'b0;
                motor_running = 1'b0;
					 //contador = 4'b0000; //Em standby, será 0
            end
        end
        
        motor_on: begin
            if (swt_start_stop == 1'b0) begin
                motor_pwm = 1'b0;
                motor_running = 1'b0;
					 //contador = 4'b0000; //Quando for para standby, será 0					 
            end else if (swt_increase == 1'b1 && swt_decrease == 1'b0) begin
                motor_pwm = 1'b1;
                motor_running = 1'b1;
					 //if (contador == 4'b1001) contador = 4'b1001;
					 //else contador = contador + 1; //Acréscimo de 1					 
            end else if (swt_increase == 1'b0 && swt_decrease == 1'b1) begin
					 motor_pwm = 1'b1;
					 motor_running = 1'b1;
					 //if (contador = 4'b0000) contador = 4'b0000;
					 //else contador = contador - 1; //Decrescimo de 1					 
				end else if (swt_increase == 1'b1 && swt_decrease == 1'b1) begin
                motor_pwm = 1'b0;
                motor_running = 1'b1;
					 //Não acontecerá nada com o contador, permanecerá o mesmo
            end
        end
    endcase
end

/*always @* begin
	case(contador)
		4'b0000 : display = 7'b1000000; //0
		4'b0001 : display = 7'b1111001; //1
		4'b0010 : display = 7'b0100100; //2 
		4'b0011 : display = 7'b0110000; //3 
		4'b0101 : display = 7'b0010010; //5
		4'b0111 : display = 7'b1111000; //7
		4'b1000 : display = 7'b0000000; //8
		4'b1001 : display = 7'b0011000; //9
		default: display = 7'b0010010; //5
	endcase
end */

endmodule
