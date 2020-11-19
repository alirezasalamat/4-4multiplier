module mux_8bit(in0, in1, sel, out);
    input [7:0] in0, in1;
    input sel;
    output [7:0] out;

    mux_1bit out0_mux(in0[0], in1[0], sel, out[0]),
             out1_mux(in0[1], in1[1], sel, out[1]),
             out2_mux(in0[2], in1[2], sel, out[2]),
             out3_mux(in0[3], in1[3], sel, out[3]),
             out4_mux(in0[4], in1[4], sel, out[4]),
             out5_mux(in0[5], in1[5], sel, out[5]),
             out6_mux(in0[6], in1[6], sel, out[6]),
             out7_mux(in0[7], in1[7], sel, out[7]);
endmodule