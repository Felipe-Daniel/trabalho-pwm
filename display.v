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
	// UNIDADES
    case (digit0)
	    4'b0000: HEX0 = 7'b1000000; // "000"
        4'b0001: HEX0 = 7'b1000000; // "010"
        4'b0010: HEX0 = 7'b1000000; // "020"
        4'b0011: HEX0 = 7'b1000000; // "030"
        4'b0100: HEX0 = 7'b1000000; // "040"
        4'b0101: HEX0 = 7'b1000000; // "050"
        4'b0110: HEX0 = 7'b1000000; // "060"
        4'b0111: HEX0 = 7'b1000000; // "070"
        4'b1000: HEX0 = 7'b1000000; // "080"
        4'b1001: HEX0 = 7'b1000000; // "090"
        4'b1010: HEX0 = 7'b1000000; // "100"
        default: HEX0 = 7'b1111111; // Blank
    endcase
   // DEZENAS
    case (digit1)
        4'b0000: HEX1 = 7'b0000001; // "000"
        4'b0001: HEX1 = 7'b1111100; // "010"
        4'b0010: HEX1 = 7'b0100100; // "020"
        4'b0011: HEX1 = 7'b0110000; // "030"
        4'b0100: HEX1 = 7'b0011001; // "040"
        4'b0101: HEX1 = 7'b1000010; // "050"
        4'b0110: HEX1 = 7'b0000010; // "060"
        4'b0111: HEX1 = 7'b1111000; // "070"
        4'b1000: HEX1 = 7'b0000000; // "080"
        4'b1001: HEX1 = 7'b0010000; // "090"
        4'b1010: HEX1 = 7'b1000000; // "100"
        default: HEX1 = 7'b1111111; // Blank
    endcase
    // CENTENAS
    case (digit2)
		  4'b0000: HEX2 = 7'b1111111; // "000"
        4'b0001: HEX2 = 7'b1111111; // "010"
        4'b0010: HEX2 = 7'b1111111; // "020"
        4'b0011: HEX2 = 7'b1111111; // "030"
        4'b0100: HEX2 = 7'b1111111; // "040"
        4'b0101: HEX2 = 7'b1111111; // "050"
        4'b0110: HEX2 = 7'b1111111; // "060"
        4'b0111: HEX2 = 7'b1111111; // "070"
        4'b1000: HEX2 = 7'b1111111; // "080"
        4'b1001: HEX2 = 7'b1111111; // "090"
        4'b1010: HEX2 = 7'b1111100; // "100"
        default: HEX2 = 7'b1111111; // Blank
    endcase
end


endmodule
