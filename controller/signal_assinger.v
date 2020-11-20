module signal_assigner(ps, s0, s1, s2, sig_rst, ld1, ld2, ready);
    input [2:0] ps;
    output s0, s1, s2, sig_rst, ld1, ld2, ready;
    
    wire [2:0] not_ps;

    not not_ps0(not_ps[0], ps[0]),
        not_ps1(not_ps[1], ps[1]),
        not_ps2(not_ps[2], ps[2]);

    and ld1_and(ld1, not_ps[2], ps[1], not_ps[0]),
        sig_rst_and(sig_rst, not_ps[2], not_ps[1], ps[0]);

    wire [2:0] ld2_and_layer;
    and ld2_and0(ld2_and_layer[0], ps[2], not_ps[0]),
        ld2_and1(ld2_and_layer[1], ps[2], not_ps[1]),
        ld2_and2(ld2_and_layer[2], not_ps[2], ps[1], ps[0]);
    
    or ld2_res(ld2, ld2_and_layer[0],
               ld2_and_layer[1], ld2_and_layer[2]);
    
    wire [1:0] s0_and_layer;
    and s0_and0(s0_and_layer[0], not_ps[2], ps[1], ps[0]),
        s0_and1(s0_and_layer[1], ps[2], not_ps[1], not_ps[0]);

    or s0_res(s0, s0_and_layer[0], s0_and_layer[1]);

    wire [1:0] s1_and_layer;
    and s1_and0(s1_and_layer[0], not_ps[2], ps[1], ps[0]),
        s1_and1(s1_and_layer[1], ps[2], not_ps[1], ps[0]);

    or s1_res(s1, s1_and_layer[0], s1_and_layer[1]);

    assign s2 = s1;

    and ready_and(ready, not_ps[0], not_ps[1], not_ps[2]);
endmodule