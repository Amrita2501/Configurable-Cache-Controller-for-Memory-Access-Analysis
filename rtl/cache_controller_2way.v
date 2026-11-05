module cache_controller_2way(

    input clk,
    input rst,

    input [31:0] addr,
    input req,

    output reg hit,
    output reg miss

);

parameter NUM_SETS = 32;

// Way 0
reg valid0 [0:NUM_SETS-1];
reg [20:0] tag0 [0:NUM_SETS-1];

// Way 1
reg valid1 [0:NUM_SETS-1];
reg [20:0] tag1 [0:NUM_SETS-1];

// LRU bit
reg lru [0:NUM_SETS-1];

wire [4:0] index;
wire [20:0] tag;

assign index = addr[10:6];
assign tag   = addr[31:11];

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

        for(i=0;i<NUM_SETS;i=i+1)
        begin
            valid0[i] <= 0;
            valid1[i] <= 0;

            tag0[i] <= 0;
            tag1[i] <= 0;

            lru[i] <= 0;
        end

    end

    else if(req)
    begin

        total_accesses <= total_accesses + 1;

        // Hit in Way 0
        if(valid0[index] && (tag0[index] == tag))
        begin

            hit <= 1;
            miss <= 0;

            total_hits <= total_hits + 1;

            lru[index] <= 1;

        end

        // Hit in Way 1
        else if(valid1[index] && (tag1[index] == tag))
        begin

            hit <= 1;
            miss <= 0;

            total_hits <= total_hits + 1;

            lru[index] <= 0;

        end

        // Miss
        else
        begin

            hit <= 0;
            miss <= 1;

            total_misses <= total_misses + 1;

            if(lru[index] == 0)
            begin
                valid0[index] <= 1;
                tag0[index] <= tag;
                lru[index] <= 1;
            end

            else
            begin
                valid1[index] <= 1;
                tag1[index] <= tag;
                lru[index] <= 0;
            end

        end

    end

end

endmodule
