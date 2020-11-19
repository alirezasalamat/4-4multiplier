module DFF_risingEdge(D, clk, rst, Q);
    input D, clk, rst;  
    output reg Q; 
    always @(posedge clk or posedge async_reset) begin
        if(rst)
            Q <= 1'b0; 
         else 
            Q <= D; 
     end 
endmodule 