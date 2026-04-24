module tb;

reg clk, rst;
reg [3:0] req;
wire [3:0] gnt;

arbiter_rr dut (
    .clk(clk),
    .rst(rst),
    .req(req),
    .gnt(gnt)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    req = 0;

    #10 rst = 0;

    #10 req = 4'b0001;
    #10 req = 4'b1010;
    #10 req = 4'b1111;
    #50 $finish;
end

endmodule