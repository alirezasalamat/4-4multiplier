module multiplier(clk, rst, start, in_1, in_2, out);
    input clk, rst, start;
    input [3:0] in_1, in_2;
    output [7:0] out;

    wire sig_rst, ld1, ld2, s0, s1, s2;

    datapath d(in_1, in_2, clk, sig_rst, ld1, ld2, s0, s1, s2, out);
    controller c(clk, rst, start, s0, s1, s2, sig_rst, ld1, ld2);
endmodule

module test_bench();

    reg clk = 1'b0 , rst, start;
    reg [3:0] in_1, in_2;
    wire [7:0] out;

    multiplier m(clk, rst, start, in_1, in_2, out);

    always #5 clk = ~clk;

    initial begin
        #10 rst = 1; #10 rst = 0;
        in_1 = 4'b0110; in_2 = 4'b1001;
        #10 start = 1'b1;
        #10 start = 1'b0;
        #200 $stop;
    end
endmodule
