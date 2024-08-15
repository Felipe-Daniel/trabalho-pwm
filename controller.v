module controller (
    input wire clk,
    input wire [3:0] KEY,
    output reg btn_increase,
    output reg btn_decreace,
    output reg btn_start,
    output reg btn_stop
);

    always @(posedge clk) begin
        btn_increase <= KEY[0];
        btn_decreace <= KEY[1];
        btn_start <= KEY[2];
        btn_stop <= KEY[3];
    end

endmodule
