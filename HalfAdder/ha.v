`timescale 1ns / 1ps
module halfAdder(input a,b,output sum,carry);
    assign sum = a^b;
    assign carry = a&b;
endmodule
