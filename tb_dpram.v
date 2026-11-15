module tb_dpram;

reg clk;
reg we_a;
reg [3:0] addr_a;
reg [7:0] din_a;
reg [3:0] addr_b;
wire [7:0] dout_b;

dpram uut (
    .clk(clk),
    .we_a(we_a),
    .addr_a(addr_a),
    .din_a(din_a),
    .addr_b(addr_b),
    .dout_b(dout_b)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    we_a = 0;
    addr_a = 0;
    din_a = 0;
    addr_b = 0;

    #10 we_a = 1; addr_a = 4'h1; din_a = 8'h11;
    #10 addr_a = 4'h3; din_a = 8'h33;

    #10 we_a = 0; addr_b = 4'h1;
    #10 addr_b = 4'h3;

    #20 $finish;
end

endmodule
