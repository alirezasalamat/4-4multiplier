module datapath(a, b, clk, rst, ld, s0, s1, s2, out);
    input [3:0] a, b;
    input clk, rst, ld, s0, s1, s2;
    output reg [7:0] out;

    reg [1:0] out_1_reg_1, out_2_reg_1, out_1_reg_2, out_2_reg_2;
    register_4bit reg_1(clk, rst, ld, a, out_1_reg_1, out_2_reg_1);
    register_4bit reg_2(clk, rst, ld, b, out_1_reg_2, out_2_reg_2);

    reg [1:0] out_mux_1, out_mux_2;
    mux_2bit mux_1(out_2_reg_1, out_1_reg_1, s0, out_mux_1);
    mux_2bit mux_2(out_2_reg_2, out_1_reg_2, s1, out_mux_2);

    reg [3:0] out_mul;
    mulltiplier_2bit mul(out_mux_1, out_mux_2, out_mul);

    reg [7:0] out_zero_extend;
    zero_extend zero_extender(out_mul, out_zero_extend);

    reg cin = 1'b1, cout;
    reg [7:0] out_mux_3;
    reg [7:0] out_adder;
    adder_8bit adder(out_zero_extend, out_mux_3, cin, out_adder, cout);

    reg [7:0] out_reg_3;
    register_8bit reg_3(clk, rst, out_adder, out_reg_3);

    reg [7:0] out_shifter;
    shift_left_2 shifter(out_reg_3, out_shifter);

    mux_8bit mux_3(out_shifter, out_reg_3, s2, out_mux_3); 
endmodule