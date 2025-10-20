`timescale 1ns / 1ps

module tb();
    reg a,b; 
    wire sum,carry;
    
    halfAdder h1(a,b,sum,carry);
 
   initial begin 
       a=0;b=0; 
       #10 b=1;
       #10 a=1;
       #10 b=0;
       #10 $finish;
   end
endmodule
