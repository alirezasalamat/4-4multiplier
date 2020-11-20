`timescale 1ns / 1ns

module multiplier(clk, rst, start, in_1, in_2, out, ready);
    input clk, rst, start;
    input [3:0] in_1, in_2;
    output [7:0] out;
    output ready;

    wire sig_rst, ld1, ld2, s0, s1, s2;

    datapath d(in_1, in_2, clk, sig_rst, ld1, ld2, s0, s1, s2, out);
    controller c(clk, rst, start, s0, s1, s2, sig_rst, ld1, ld2, ready);
endmodule

module test_bench();

    reg clk = 1'b0 , rst, start;
    reg [3:0] in_1, in_2;
    wire [7:0] out;
    wire ready;
    
    multiplier m(clk, rst, start, in_1, in_2, out, ready);

    always #5 clk = ~clk;

    initial begin
        #10 rst = 1; 
        #10 start = 1'b1;
        #10 rst = 0;
        in_1 = 4'b0110; in_2 = 4'b1001;
        #10 start = 1'b0;
        
        #200 in_1 = 4'b1010; in_2 = 4'b0011;
        start = 1'b1;
        #10 start = 1'b0;
        
        #200 in_1 = 4'b1010; in_2 = 4'b0011;
        start = 1'b1;
        #10 start = 1'b0;
        
        #200 in_1 = 4'b1011; in_2 = 4'b0101;
        start = 1'b1;
        #10 start = 1'b0;
        
        #200 in_1 = 4'b0111; in_2 = 4'b1100;
        start = 1'b1;
        #10 start = 1'b0;
        
        #200 in_1 = 4'b1011; in_2 = 4'b0101;
        start = 1'b1;
        #10 start = 1'b0;
        #200 $stop;

    end
endmodule
