`timescale 1ns/ 100ps

module top_tb;

    reg clk;
    reg SW2, SW1, SW0;

    wire [6:0] HEX0;
    wire [6:0] HEX1;
    wire [6:0] HEX2;

    wire [17:0] SW;
	 
	 assign SW = {15'b0, SW2, SW1, SW0};

    top top (
        .clk(clk),
        .SW(SW),
        .HEX0(HEX0),
        .HEX1(HEX1),
        .HEX2(HEX2)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        SW2 = 1'b0;
        SW1 = 1'b0;
        SW0 = 1'b0;
        #3;
		  

		  // Liga
        SW0 = 1'b1;
		  #3
		  
		  $display("At time %t: HEX0 = %b, HEX1 = %b, HEX2 = %b", 
                  $time, HEX0, HEX1, HEX2);
		  

		  // Aumenta
        SW1 = 1'b1;
		  #3;
		  SW1 = 1'b0;
		  #3;
		  
		  $display("At time %t: HEX0 = %b, HEX1 = %b, HEX2 = %b", 
                  $time, HEX0, HEX1, HEX2);
	
		  // Aumenta
        SW1 = 1'b1;
		  #3
		  SW1 = 1'b0;
		  #20;
		 
			$display("At time %t: HEX0 = %b, HEX1 = %b, HEX2 = %b", 
                  $time, HEX0, HEX1, HEX2); 
		  
		  // Diminui
		  SW2 = 1'b1;
		  #20
		  SW2 = 1'b0;
        #20;
		  
		  $display("At time %t: HEX0 = %b, HEX1 = %b, HEX2 = %b", 
                  $time, HEX0, HEX1, HEX2);

        $stop;
    end

endmodule
