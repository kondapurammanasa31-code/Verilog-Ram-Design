module tb_sram_single_port;

reg clk;
reg we;
reg [3:0] addr;
reg [7:0] din;
wire [7:0] dout;

sram_single_port uut (
.clk(clk),
.we(we),
.addr(addr),
.din(din),
.dout(dout)
);

always #5 clk = ~clk;

initial begin
clk = 0;
we = 0;
addr = 0;
din = 0;

#10 we = 1; addr = 4'h2; din = 8'hAA;
#10 addr = 4'h4; din = 8'h55;

#10 we = 0; addr = 4'h2;
#10 addr = 4'h4;

#20 $finish;
end

endmodule
