module adder_1bit(a, b, cin, r, cout);
    input a, b, cin;
    output r, cout;

    wire a_not, b_not, not_cin;
    wire [3:0] r_and_layer;
    wire [2:0] cout_and_layer;

    not na(not_a, a),
        nb(not_b, b),
        nc(not_cin, cin);

    and r_and0(r_and_layer[0], not_a, not_b, cin),
        r_and1(r_and_layer[1], not_a, b, not_cin),
        r_and2(r_and_layer[2], a, b, cin),
        r_and3(r_and_layer[3], a, not_b, not_cin);
    
    or r_res(r, r_and_layer[0], r_and_layer[1],
             r_and_layer[2], r_and_layer[3]);

    and cout_and0(cout_and_layer[0], a, b),
        cout_and1(cout_and_layer[1], b, cin),
        cout_and2(cout_and_layer[2], a, cin);

    or cout_res(cout, cout_and_layer[0],
                cout_and_layer[1], cout_and_layer[2]);

endmodule