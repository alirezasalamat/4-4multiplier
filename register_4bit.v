module register_8bit(clk, rst, ld, in, out);

    input clk, rst, ld;
    input [4:0] in;
    output reg [4:0] out;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            out <= 8'b0;
        end
        else if(ld) begin
            out <= in;
        end
    end
endmodule

module test_register_4bit();

    reg clk = 1'b0 , rst, ld;
    reg [4:0] in;
    wire [4:0] out;

    register_8bit reg8(clk, rst, ld, in, out);
    
    always #10 clk = ~clk;

    initial begin
    #10 ld = 1;
    in = 8'b10101010;
    #20 ld = 0;
    #200
    in = 8'b00100101;
    #100 ld = 1;
    in = 8'b00000001;
    #100 ld = 0;
    #100 $stop;
    end
endmodule