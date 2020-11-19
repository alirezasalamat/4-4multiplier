module register_4bit(clk, rst, ld, in, out_1, out_2);

    input clk, rst, ld;
    input [3:0] in;
    output reg [1:0] out_1, out_2;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            out_1 <= 2'b0;
            out_2 <= 2'b0;
        end
        else if(ld) begin
            out_1 <= in[3:2];
            out_2 <= in[1:0];
        end
    end
endmodule

module test_register_4bit();

    reg clk = 1'b0 , rst, ld;
    reg [3:0] in;
    wire [1:0] out_1, out_2;

    register_4bit reg4(clk, rst, ld, in, out_1, out_2);
    
    always #10 clk = ~clk;

    initial begin
    #10 ld = 1;
    in = 4'b1010;
    #20 ld = 0;
    #200
    in = 4'b0010;
    #100 ld = 1;
    in = 4'b0000;
    #100 ld = 0;
    #100 $stop;
    end
endmodule