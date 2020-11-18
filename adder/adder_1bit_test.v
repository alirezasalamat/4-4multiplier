`timescale 1ns / 1ns
module adder_1bit_test();
    reg a, b, cin;
    wire r, cout;

    adder_1bit adder(a, b, cin, r, cout);
    integer i;
    initial begin
        {a, b, cin} = 3'b000;
        for (i = 0; i < 8; i = i + 1)
            #100 {a, b, cin} = {a, b, cin} + 3'b001;
        
        for (i = 0; i < 8; i = i + 1)
            #100 {a, b, cin} = {a, b, cin} - 3'b001;
        
        #100;
    end
endmodule