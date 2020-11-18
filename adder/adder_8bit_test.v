`timescale 1ns / 1ns
module adder_8bit_test();
    reg [7:0] a, b;
    reg cin;
    wire [7:0] r;
    wire cout;

    adder_8bit adder(a, b, cin, r, cout);
    initial begin
        cin = 1'b0;
        {a, b} = {8'b0000_0001, 8'b0000_0010};
        #100 {a, b} = {8'b0000_1110, 8'b0000_0110};
        #100 {a, b} = {8'b0010_1110, 8'b0100_0110};
        #100 cin = 1'b1;
        #100 cin = 1'b0;
        #100;
    end
endmodule