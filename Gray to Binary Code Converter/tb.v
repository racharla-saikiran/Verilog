`timescale 1ns/1ps

module tb;
    reg [3:0]g;
    wire [3:0]b; 
    
    Gray2Bin DUT (g,b);
    
    initial begin
    g=4'b0000;
        repeat(16)        #10 g=g+1;
        $finish;
    end
endmodule 