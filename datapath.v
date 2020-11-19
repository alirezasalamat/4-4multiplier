module datapath(a, b, clk, rst, ld_1, ld_2, s0, s1, s2, out);
    input [3:0] a, b;
    input clk, rst, ld_1, ld_2, s0, s1, s2;
    output [7:0] out;

    wire [1:0] out_1_reg_1, out_2_reg_1, out_1_reg_2, out_2_reg_2;
    register_4bit reg_1(clk, rst, ld_1, a, out_1_reg_1, out_2_reg_1);
    register_4bit reg_2(clk, rst, ld_1, b, out_1_reg_2, out_2_reg_2);

    wire [1:0] out_mux_1, out_mux_2;
    mux_2bit mux_1(out_2_reg_1, out_1_reg_1, s0, out_mux_1);
    mux_2bit mux_2(out_2_reg_2, out_1_reg_2, s1, out_mux_2);

    wire [3:0] out_mul;
    multiplier_2bit mul(out_mux_1, out_mux_2, out_mul);

    wire [7:0] out_zero_extend;
    zero_extend zero_extender(out_mul, out_zero_extend);

    reg cin = 1'b1;
    wire cout;
    wire [7:0] out_mux_3;
    wire [7:0] out_adder;
    adder_8bit adder(out_zero_extend, out_mux_3, cin, out_adder, cout);

    wire [7:0] out_reg_3;
    register_8bit reg_3(clk, rst, ld_2, out_adder, out_reg_3);

    wire [7:0] out_shifter;
    shift_left_2 shifter(out_reg_3, out_shifter);

    mux_8bit mux_3(out_shifter, out_reg_3, s2, out_mux_3); 
endmodule