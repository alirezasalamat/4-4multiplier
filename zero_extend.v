module zero_extend(in, out);
    input [3:0] in;
    output [7:0] out;

    reg one = 1'b1, zero = 1'b0;

    and and_1(out[0], in[0], one);
    and and_2(out[1], in[1], one);
    and and_3(out[2], in[2], one);
    and and_4(out[3], in[3], one);

    and and_5(out[4], zero);
    and and_6(out[5], zero);
    and and_7(out[6], zero);
    and and_8(out[7], zero);
endmodule

module test_zero_extend();

    reg [3:0] in;
    wire [7:0] out;

    zero_extend z(in, out);

    initial begin
        #10 in = 4'b1000;
        #10 in = 4'b1111;
        #10 in = 4'b0101;
        #10 $stop;
    end
endmodule