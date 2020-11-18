`timescale 1ns / 1ns
module mux_1bit_test();
    reg in0, in1, sel;
    wire out;

    mux_1bit mux(in0, in1, sel, out);
    integer i;
    initial begin
        {in0, in1, sel} = 3'b000;
        for (i = 0; i < 8; i = i + 1)
            #100 {in0, in1, sel} = {in0, in1, sel} + 3'b001;
        
        for (i = 0; i < 8; i = i + 1)
            #100 {in0, in1, sel} = {in0, in1, sel} - 3'b001;
        
        #100;
    end
endmodule