module mux_2bit(in0, in1, sel, out);
    input [1:0] in0, in1;
    input sel;
    output [1:0] out;

    mux_1bit out0_mux(in0[0], in1[0], sel, out[0]),
             out1_mux(in0[1], in1[1], sel, out[1]);
endmodule