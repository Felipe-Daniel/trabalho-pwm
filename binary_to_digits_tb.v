module binary_to_digits_tb();

    // Inputs
    reg [3:0] binary_in;

    // Outputs
    wire [3:0] digit0;
    wire [3:0] digit1;
    wire [3:0] digit2;

    // Instantiate the binary_to_digits module
    binary_to_digits uut (
        .binary_in(binary_in),
        .digit0(digit0),
        .digit1(digit1),
        .digit2(digit2)
    );

    initial begin
        // Test all possible input values (0 to 10)
        binary_in = 4'd0;
        #10;
        binary_in = 4'd1;
        #10;
        binary_in = 4'd2;
        #10;
        binary_in = 4'd3;
        #10;
        binary_in = 4'd4;
        #10;
        binary_in = 4'd5;
        #10;
        binary_in = 4'd6;
        #10;
        binary_in = 4'd7;
        #10;
        binary_in = 4'd8;
        #10;
        binary_in = 4'd9;
        #10;
        binary_in = 4'd10;
        #10;

        // Finish simulation
        $finish;
    end

endmodule
