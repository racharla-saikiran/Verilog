
module srLath(input s,r,output  q,qb);
        assign q  = ~(qb|r);
        assign qb = ~(q|s);

endmodule 