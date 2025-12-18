
module DFF(input d,clk, output reg q,output qb);
    always @(posedge clk) 
        q <=d;
    assign qb  = ~q;
endmodule 