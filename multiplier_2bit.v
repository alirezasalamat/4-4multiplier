module multiplier_2bit(in_1, in_2, out);

    input [1:0] in_1, in_2;
    output [3:0] out;

    wire not_a0, not_a1, not_b0, not_b1;

    // not gates
    not not_1(not_a0, in_1[0]);
    not not_2(not_a1, in_1[1]);
    not not_3(not_b0, in_2[0]);
    not not_4(not_b1, in_2[1]);

    //c0
    and and_1(out[0], in_1[0], in_2[0]);

    //c1
    wire and_2_out, and_3_out, and_4_out, and_5_out;
    and and_2(and_2_out, in_1[1], not_b1 , in_2[0]);
    and and_3(and_3_out, in_1[0], not_a1 , in_2[1]);
    and and_4(and_4_out, in_1[0], not_b0 , in_2[1]);
    and and_5(and_5_out, in_1[1], not_a0 , in_2[0]);

    or or_1(out[1], and_2_out, and_3_out, and_4_out, and_5_out);

    //c2
    wire and_6_out, and_7_out;
    and and_6(and_6_out, in_1[1], not_a0, in_2[1]);
    and and_7(and_7_out, in_1[1], not_b0, in_2[1]);

    or or_2(out[2], and_6_out, and_7_out);

    //c3
    and and_8(out[3], in_1[0], in_1[1], in_2[0], in_2[1]);
    
    always @(out) begin
        $display("%t: MULTIPLIER 2 BIT: OUT=%d", $time, out);    
    end

endmodule

module test_multiplier_2bit();

    reg [1:0] in_1 , in_2;
    wire [3:0] out;

    multiplier_2bit mul_2(in_1, in_2, out);

    initial begin
        #10 in_1 = 2'b10; in_2 = 2'b11;
        #100 in_1 = 2'b01; in_2 = 2'b10;
        #100 in_1 = 2'b00; in_2 = 2'b11;
        #100 in_1 = 2'b01; 
        #100 $stop;
    end
endmodule