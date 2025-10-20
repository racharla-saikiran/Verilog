`timescale 1ns / 1ps
module top(input a,b,c, output sum,carry);
    wire t1,t2,t3;
    ha h1 (a,b,t1,t2);
    ha h2 (t1,c,sum,t3);
    or o1 (carry,t2,t3);
endmodule

module ha(input a,b,output sum,carry);
    assign sum = a^b;
    assign carry = (a&b);
endmodule
