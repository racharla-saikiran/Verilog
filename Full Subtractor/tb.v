`timescale 1ns/1ps

module tb;
    reg a,b,c;
    wire diff,borr; 
    
    fullSub DUT (a,b,c,diff,borr);
    initial begin
        a=0; 
        repeat(2) begin
            b=0;
            repeat(2) begin
                c=0;
                #10 c=1;
                #10 b=b+1;
            end
            a=a+1;
        end    
        $finish;
    end
endmodule 