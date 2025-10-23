`timescale 1ns/1ps

module tb;
    reg [3:0]b;
    wire [3:0]g; 
    
    bin2Gray DUT (b,g);
    
    initial begin
    b=4'b0000;
        repeat(16)        #10 b=b+1;
        $finish;
    end
endmodule 