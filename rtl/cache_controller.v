module cache_controller(

    input clk,
    input rst,

    input [31:0] addr,
    input req,

    output reg hit,
    output reg miss

);

parameter CACHE_LINES = 64;

reg valid [0:CACHE_LINES-1];
reg [19:0] tag_array [0:CACHE_LINES-1];

wire [5:0] index;
wire [19:0] tag;

assign index = addr[11:6];
assign tag   = addr[31:12];

integer i;

// Statistics
integer total_accesses;
integer total_hits;
integer total_misses;

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin

        hit <= 0;
        miss <= 0;

        total_accesses <= 0;
        total_hits <= 0;
        total_misses <= 0;

        for(i=0;i<CACHE_LINES;i=i+1)
        begin
            valid[i] <= 0;
            tag_array[i] <= 0;
        end

    end

    else if(req)
    begin

        total_accesses <= total_accesses + 1;

        if(valid[index] && (tag_array[index] == tag))
        begin

            hit <= 1;
            miss <= 0;

            total_hits <= total_hits + 1;

        end

        else
        begin

            hit <= 0;
            miss <= 1;

            total_misses <= total_misses + 1;

            valid[index] <= 1;
            tag_array[index] <= tag;

        end

    end

end

endmodule
