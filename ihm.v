module ihm(
    input clk, rst, btn_increase, btn_decrease, btn_start, btn_stop,
    output reg motor_pwm, motor_running
);

// Registrador de estado
reg state;

// Codificando estados
parameter standby = 1'b0,
          motor_on = 1'b1;

// Estado inicial
initial state <= standby;

// Primeiro procedimento - Estado próximo
always @(posedge clk or posedge rst) begin
    if (rst) 
        state <= standby;
    else begin
        case (state)
            standby: begin
                if (btn_start == 1'b1 && btn_stop == 1'b0) 
                    state <= motor_on;
                else 
                    state <= standby;
            end
            
            motor_on: begin
                if (btn_stop == 1'b1) 
                    state <= standby;
                else 
                    state <= motor_on;
            end
        endcase
    end
end

// Segundo procedimento - Saídas
always @(state or btn_start or btn_stop or btn_increase or btn_decrease) begin
    case (state)
        standby: begin
            if (btn_start == 1'b1 && btn_stop == 1'b0) begin
                motor_pwm = 1'b0;
                motor_running = 1'b1;
            end else begin
                motor_pwm = 1'b0;
                motor_running = 1'b0;
            end
        end
        
        motor_on: begin
            if (btn_stop == 1'b1) begin
                motor_pwm = 1'b0;
                motor_running = 1'b0;
            end else if (btn_increase == 1'b1 && btn_decrease == 1'b0) begin
                motor_pwm = 1'b1;
                motor_running = 1'b1;
            end else if (btn_increase == 1'b1 && btn_decrease == 1'b1) begin
                motor_pwm = 1'b0;
                motor_running = 1'b1;
            end 
        end
    endcase
end

endmodule
