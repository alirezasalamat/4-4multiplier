module register_8bit(clk, rst, ld, in, out);

    input clk, rst, ld;
    input [7:0] in;
    output reg [7:0] out;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            out <= 8'b0;
        end
        else if(ld) begin
            out <= in;
        end
    end
endmodule

module test_register_8bit();

    reg clk = 1'b0, ld = 1'b1, rst;
    reg [7:0] in;
    wire [7:0] out;

    register_8bit reg8(clk, rst, ld, in, out);
    
    always #10 clk = ~clk;

    initial begin
    #10 rst = 1;
    #10 rst = 0;
    in = 8'b10101010;
    #200
    in = 8'b00100101;
    ld = 1'b0;
    #200 ld = 1'b1;
    #100 $stop;
    end
endmodule