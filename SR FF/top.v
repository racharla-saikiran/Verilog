
module SRFF(input s,r,clk, output q,qb);
        reg s0,r0;
        always @(posedge clk) begin
             s0 <= ~(s);
             r0 <= ~(r);
        end
        assign q = ~(s0&qb);
        assign qb = ~(r0&q);
endmodule 