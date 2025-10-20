`timescale 1ns / 1ps
module tb;
    reg a,b,c;
    wire sum,carry; 
    integer i;
    top DUT(a,b,c,sum,carry);
    
    initial begin 
    for (i=0;i<8;i=i+1) begin
        {a,b,c} = i; #10;
        end 
        $finish;
     end   
        
endmodule
