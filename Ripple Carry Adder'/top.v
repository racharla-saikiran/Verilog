
module rippleCarryAdder(input [3:0]a,b, output [3:0] sum, output carry);
    wire [2:0]t;
    halfAdder ha1 (a[0],b[0],sum[0],t[0]);
    fullAdder fa1 (a[1],b[1],t[0],sum[1],t[1]);
    fullAdder fa2 (a[2],b[2],t[1],sum[2],t[2]);
    fullAdder fa3 (a[3],b[3],t[2],sum[3],carry);
endmodule 



module fullAdder(input a,b,c, output sum,carry);
    wire t1,t2,t3;
    halfAdder h1 (a,b,t1,t2);
    halfAdder h2 (t1,c,sum,t3);
    or o1 (carry,t2,t3);
endmodule

module halfAdder(input a,b,output sum,carry);
    assign sum = a^b;
    assign carry = (a&b);
endmodule
