`timescale 1ns/1ps

module tb;
    reg a,b;
    wire diff,borr; 
    
    halfSub DUT (a,b,diff,borr);
    
    initial begin 
        a=0;b=0;
        #10 a=1;
        #10 b=1;
        #10 a=0;
        #10 $finish;
    end
endmodule 