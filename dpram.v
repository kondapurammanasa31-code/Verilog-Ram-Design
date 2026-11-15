module dpram #(
parameter DATA_WIDTH = 8,
parameter ADDR_WIDTH = 4
)(
input wire clk,
input wire we_a,
input wire [ADDR_WIDTH-1:0] addr_a,
input wire [DATA_WIDTH-1:0] din_a,
input wire [ADDR_WIDTH-1:0] addr_b,
output reg [DATA_WIDTH-1:0] dout_b
);

reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

always @(posedge clk) begin
    if (we_a)
        mem[addr_a] <= din_a;

    dout_b <= mem[addr_b];
end

endmodule
