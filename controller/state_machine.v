`timescale 1ns / 1ns

module state_machine(clk, rst, start, v);
    input clk, rst, start;
    output [2:0] v;

    wire [2:0] not_v, next_v;
    
    not (not_v[0], v[0]),
        (not_v[1], v[1]),
        (not_v[2], v[2]);

    wire [2:0] v0_and_layer;
    and v0_and0(v0_and_layer[0], v[2], not_v[1], not_v[0]),
        v0_and1(v0_and_layer[1], not_v[2], v[1], not_v[0]),
        v0_and2(v0_and_layer[2], start, not_v[0], not_v[2]);

    or next_v0_res(next_v[0], v0_and_layer[0],
                   v0_and_layer[1], v0_and_layer[2]);
    
    wire [2:0] v1_and_layer;
    and v1_and0(v1_and_layer[0], not_v[2], not_v[1], v[0]),
        v1_and1(v1_and_layer[1], not_v[2], v[1], not_v[0]),
        v1_and2(v1_and_layer[2], v[2], not_v[1], v[0]);
    
    or next_v1_res(next_v[1], v1_and_layer[0],
                   v1_and_layer[1], v1_and_layer[2]);
    
    wire [1:0] v2_and_layer;
    and v2_and0(v2_and_layer[0], not_v[2], v[1], v[0]),
        v2_and1(v2_and_layer[1], v[2], not_v[1]);

    or next_v2_res(next_v[2], v2_and_layer[0], v2_and_layer[1]);

    DFF_risingEdge v0_dff(next_v[0], clk, rst, v[0]),
                   v1_dff(next_v[1], clk, rst, v[1]),
                   v2_dff(next_v[2], clk, rst, v[2]);
endmodule

module test_state_machine();
    reg clk = 1'b0, rst, start;
    wire [2:0] v;

    state_machine sm(clk, rst, start, v);
    always #10 clk = ~clk;

    initial begin
        rst = 1'b1;
        #200 start = 1'b0;
        #50 rst = 1'b0;
        #50 start = 1'b1;
        #200 $stop;
    end
endmodule