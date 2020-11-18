module adder_8bit(a, b, cin, r, cout);
    input [7:0] a, b;
    input cin;
    output [7:0] r;
    output cout;

    wire [8:0] carry;
    assign carry[0] = cin;
    assign cout = carry[8];

    genvar i;
    generate for (i = 0; i < 8; i = i + 1)
        adder_1bit r_i(a[i], b[i], carry[i], r[i], carry[i + 1]);
    endgenerate
endmodule