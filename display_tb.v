module display_tb;

    // Inputs
    reg clk;
    reg [3:0] digit0;
    reg [3:0] digit1;
    reg [3:0] digit2;

    // Outputs
    wire [6:0] HEX0;
    wire [6:0] HEX1;
    wire [6:0] HEX2;

    // Instantiate the Unit Under Test (UUT)
    display uut (
        .clk(clk), 
        .digit0(digit0), 
        .digit1(digit1), 
        .digit2(digit2), 
        .HEX0(HEX0), 
        .HEX1(HEX1), 
        .HEX2(HEX2)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Stimulus process
    initial begin
        // Initialize Inputs
        digit0 = 4'b0000;
        digit1 = 4'b0000;
        digit2 = 4'b0000;
        
        // Wait for the clock
        #10;
        
        // Test Case 1: Display "000"
        digit0 = 4'b0000;
        digit1 = 4'b0000;
        digit2 = 4'b0000;
        #10;

        // Test Case 2: Display "050"
        digit0 = 4'b0101;
        digit1 = 4'b0101;
        digit2 = 4'b0000;
        #10;
        
        // Test Case 3: Display "090"
        digit0 = 4'b1001;
        digit1 = 4'b1001;
        digit2 = 4'b0000;
        #10;
        
        // Test Case 4: Display "100"
        digit0 = 4'b0000;
        digit1 = 4'b0000;
        digit2 = 4'b1010;
        #10;
        
        // Add more test cases as needed
        #100;

        // Finish simulation
        $stop;
    end

endmodule
