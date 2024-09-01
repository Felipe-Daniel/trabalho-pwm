module controller_tb;

    // Inputs
    reg clk;
    reg [17:0] SW;

    // Outputs
    wire swt_increase;
    wire swt_decrease;
    wire swt_start_stop;

    // Instantiate the Unit Under Test (UUT)
    controller uut (
        .clk(clk),
        .SW(SW),
        .swt_increase(swt_increase),
        .swt_decrease(swt_decrease),
        .swt_start_stop(swt_start_stop)
    );

    // Clock generation
    always #5 clk = ~clk; // Toggle clock every 5 time units

    initial begin
        // Initialize Inputs
        clk = 0;
        SW = 18'b0;

        // Apply test cases

        // Test Case 1: All switches are 0
        #10;
        SW = 18'b0;
        #10;
        // Observe outputs for SW = 0

        // Test Case 2: Set SW[2] (swt_increase)
        SW = 18'b100; // Binary for SW[2]=1, SW[1:0]=0
        #10;
        // Observe outputs for swt_increase

        // Test Case 3: Set SW[1] (swt_decrease)
        SW = 18'b010; // Binary for SW[1]=1, SW[2,0]=0
        #10;
        // Observe outputs for swt_decrease

        // Test Case 4: Set SW[0] (swt_start_stop)
        SW = 18'b001; // Binary for SW[0]=1, SW[2:1]=0
        #10;
        // Observe outputs for swt_start_stop

        // Test Case 5: All switches are set
        SW = 18'b111; // Binary for SW[2:0]=111
        #10;
        // Observe outputs for all switches set

        // Finish simulation
        #20;
        $finish;
    end

endmodule
