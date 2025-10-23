
module fullSub(input a,b,c, output diff,borr);
    assign diff = a^b^c;
    assign borr = (~a&b)|(~a&c)|(b&c);

endmodule 