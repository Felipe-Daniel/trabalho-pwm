module display (
    input wire [3:0] PWM_OUT,         // 4-bit input ranging from 0 to 10
    input wire clk,
    input wire [3:0] digit0,
    input wire [3:0] digit1,
    input wire [3:0] digit2,
    output reg [6:0] HEX0,
    output reg [6:0] HEX1,
    output reg [6:0] HEX2
);

always @(*) begin
    case (digit0)
        4'b0000: HEX0 = 7'b1111111; // Digit 1 in "000"
        4'b0001: HEX0 = 7'b1111111; // Digit 1 in "010"
        4'b0010: HEX0 = 7'b1111111; // Digit 1 in "020"
        4'b0011: HEX0 = 7'b1111111; // Digit 1 in "030"
        4'b0100: HEX0 = 7'b1111111; // Digit 1 in "040"
        4'b0101: HEX0 = 7'b1111111; // Digit 1 in "050"
        4'b0110: HEX0 = 7'b1111111; // Digit 1 in "060"
        4'b0111: HEX0 = 7'b1111111; // Digit 1 in "070"
        4'b1000: HEX0 = 7'b1111111; // Digit 1 in "080"
        4'b1001: HEX0 = 7'b1111111; // Digit 1 in "090"
        4'b1010: HEX0 = 7'b0000011; // Digit 1 in "100"
        default: HEX0 = 7'b1111111; // Blank
    endcase
    
    case (digit1)
        4'b0000: HEX1 = 7'b0000001; // Digit 2 in "000"
        4'b0001: HEX1 = 7'b0000011; // Digit 2 in "010"
        4'b0010: HEX1 = 7'b0100100; // Digit 2 in "020"
        4'b0011: HEX1 = 7'b0110000; // Digit 2 in "030"
        4'b0100: HEX1 = 7'b0011001; // Digit 2 in "040"
        4'b0101: HEX1 = 7'b1000010; // Digit 2 in "050"
        4'b0110: HEX1 = 7'b0000010; // Digit 2 in "060"
        4'b0111: HEX1 = 7'b1111000; // Digit 2 in "070"
        4'b1000: HEX1 = 7'b0000000; // Digit 2 in "080"
        4'b1001: HEX1 = 7'b0010000; // Digit 2 in "090"
        4'b1010: HEX1 = 7'b1000000; // Digit 2 in "100"
        default: HEX1 = 7'b1111111; // Blank
    endcase
    
    case (digit2)
        4'b0000: HEX2 = 7'b1000000; // Digit 3 in "000"
        4'b0001: HEX2 = 7'b1000000; // Digit 3 in "010"
        4'b0010: HEX2 = 7'b1000000; // Digit 3 in "020"
        4'b0011: HEX2 = 7'b1000000; // Digit 3 in "030"
        4'b0100: HEX2 = 7'b1000000; // Digit 3 in "040"
        4'b0101: HEX2 = 7'b1000000; // Digit 3 in "050"
        4'b0110: HEX2 = 7'b1000000; // Digit 3 in "060"
        4'b0111: HEX2 = 7'b1000000; // Digit 3 in "070"
        4'b1000: HEX2 = 7'b1000000; // Digit 3 in "080"
        4'b1001: HEX2 = 7'b1000000; // Digit 3 in "090"
        4'b1010: HEX2 = 7'b1000000; // Digit 3 in "100"
        default: HEX2 = 7'b1111111; // Blank
    endcase
end


endmodule
