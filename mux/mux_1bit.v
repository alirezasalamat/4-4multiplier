module mux_1bit(in0, in1, sel, out);
    input in0, in1, sel;
    output out;

    wire not_sel;
    wire out_and_layer[1:0];

    not nsel(not_sel, sel);

    and out_and0(out_and_layer[0], not_sel, in0),
        out_and1(out_and_layer[1], sel, in1);

    or out_res(out, out_and_layer[0], out_and_layer[1]);
endmodule