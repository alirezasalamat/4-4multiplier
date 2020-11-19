module shift_left_2(in, out);
    input [7:0] in;
    output wire [7:0] out;

    reg one = 1'b1, zero = 1'b0;

    and and_1(out[0], zero);
    and and_2(out[1], zero);
    and and_3(out[2], in[0], one);
    and and_4(out[3], in[1], one);
    and and_5(out[4], in[2], one);
    and and_6(out[5], in[3], one);
    and and_7(out[6], in[4], one);
    and and_8(out[7], in[5], one);

endmodule

module test_shift_left_2();
    reg [7:0] in;
    wire [7:0] out;

    shift_left_2 s(in, out);

    initial begin
        #10 in = 8'b00111111;
        #100 in = 8'b10010010;
        #100 $stop; 
    end
endmodule
