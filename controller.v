module controller (
    input wire clk,
	 input wire [17:0] SW,
    output reg swt_increase,
    output reg swt_decrease,
    output reg swt_start_stop
);

    always @(posedge clk) begin
        swt_increase <= SW[2];
        swt_decrease <= SW[1];
        swt_start_stop <= SW[0];
    end

endmodule
