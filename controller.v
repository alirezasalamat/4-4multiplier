`timescale 1ns / 1ns

module controller(clk, rst, start, s0, s1, s2, sig_rst, ld1, ld2);
    input clk, rst, start;
    output  s0, s1, s2, sig_rst, ld1, ld2;

    wire [2:0] ps;
    state_machine sm(clk, rst, start, ps);
    signal_assigner sa(ps, s0, s1, s2, sig_rst, ld1, ld2);
    
    always @(ps) begin
        $display("%t: CNTL_TEST: ps=%d", $time, ps);    
    end
endmodule

module test_controller();
    reg clk = 1'b0, rst, start;
    wire s0, s1, s2, sig_rst, ld1, ld2;

    controller c(clk, rst, start, s0, s1, s2, sig_rst, ld1, ld2);

    always #10 clk = ~clk;

    initial begin
        rst = 1'b1;
        #200 start = 1'b0;
        #50 rst = 1'b0;
        #50 start = 1'b1;
        #200 $stop;
    end

    always @(c.sm.v)
        $display("%t: CNTL_TEST: ps=%d", $time, c.ps);
endmodule