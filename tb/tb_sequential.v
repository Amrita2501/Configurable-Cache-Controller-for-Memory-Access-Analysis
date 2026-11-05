`timescale 1ns/1ps

module tb_sequential;;

reg clk;
reg rst;
reg req;
reg [31:0] addr;

wire hit;
wire miss;

cache_controller uut(
    .clk(clk),
    .rst(rst),
    .addr(addr),
    .req(req),
    .hit(hit),
    .miss(miss)
);

always #5 clk = ~clk;

initial begin

    $dumpfile("results/cache.vcd");
    $dumpvars(0, tb_sequential);

    clk = 0;
    rst = 1;
    req = 0;
    addr = 0;

    #20;
    rst = 0;

    #10;
    req = 1;

    addr = 32'h00001000;
    #10;

    addr = 32'h00001040;
    #10;

    addr = 32'h00001080;
    #10;

    addr = 32'h000010C0;
    #10;

    addr = 32'h00001100;
    #10;

    addr = 32'h00001140;
    #10;

    req = 0;

    #20;
    $display("");
    $display("========================");
    $display("CACHE STATISTICS");
    $display("========================");

    $display("Total Accesses = %0d", uut.total_accesses);
    $display("Total Hits     = %0d", uut.total_hits);
    $display("Total Misses   = %0d", uut.total_misses);

    $display("========================");
    $display("");
    $finish;

end

endmodule
