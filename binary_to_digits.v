module binary_to_digits(
    input wire [3:0] binary_in, // 4-bit binary input (0-10)
    output reg [3:0] digit0,    // Units digit
    output reg [3:0] digit1,    // Tens digit
    output reg [3:0] digit2     // Hundreds digit
);

always @(*) begin
    case (binary_in)
        4'b0000: begin
            digit0 = 4'd0;    // 0
            digit1 = 4'd0;    // 0
            digit2 = 4'd0;    // 0
        end
        4'b0001: begin
            digit0 = 4'd0;    // 10 -> 0
            digit1 = 4'd1;    // 1
            digit2 = 4'd0;    // 0
        end
        4'b0010: begin
            digit0 = 4'd0;    // 20 -> 0
            digit1 = 4'd2;    // 2
            digit2 = 4'd0;    // 0
        end
        4'b0011: begin
            digit0 = 4'd0;    // 30 -> 0
            digit1 = 4'd3;    // 3
            digit2 = 4'd0;    // 0
        end
        4'b0100: begin
            digit0 = 4'd0;    // 40 -> 0
            digit1 = 4'd4;    // 4
            digit2 = 4'd0;    // 0
        end
        4'b0101: begin
            digit0 = 4'd0;    // 50 -> 0
            digit1 = 4'd5;    // 5
            digit2 = 4'd0;    // 0
        end
        4'b0110: begin
            digit0 = 4'd0;    // 60 -> 0
            digit1 = 4'd6;    // 6
            digit2 = 4'd0;    // 0
        end
        4'b0111: begin
            digit0 = 4'd0;    // 70 -> 0
            digit1 = 4'd7;    // 7
            digit2 = 4'd0;    // 0
        end
        4'b1000: begin
            digit0 = 4'd0;    // 80 -> 0
            digit1 = 4'd8;    // 8
            digit2 = 4'd0;    // 0
        end
        4'b1001: begin
            digit0 = 4'd0;    // 90 -> 0
            digit1 = 4'd9;    // 9
            digit2 = 4'd0;    // 0
        end
        4'b1010: begin
            digit0 = 4'd0;    // 100 -> 0
            digit1 = 4'd0;    // 0
            digit2 = 4'd1;    // 1
        end
        default: begin
            digit0 = 4'd0;    // Default to 0
            digit1 = 4'd0;
            digit2 = 4'd0;
        end
    endcase
end

endmodule
