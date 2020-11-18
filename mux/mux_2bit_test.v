`timescale 1ns / 1ns
module mux_2bit_test();
    reg [1:0] in0, in1;
    reg sel;
    wire [1:0] out;

    mux_2bit mux(in0, in1, sel, out);
    initial begin
        {in0, in1, sel} = 5'b00_01_1;
        #100 {in0, in1, sel} = 5'b00_10_1;
        #100 {in0, in1, sel} = 5'b01_11_1;
        #100 {in0, in1, sel} = 5'b01_00_1;
        #100 {in0, in1, sel} = 5'b01_01_0;
        #100 {in0, in1, sel} = 5'b00_01_0;
        #100 {in0, in1, sel} = 5'b10_11_0;
        #100 {in0, in1, sel} = 5'b01_11_0;
        #100;
    end
endmodule