`timescale 10ps / 1ps

module tb();
    reg [3:0]a,b; 
    wire [3:0]sum; wire carry;
    rippleCarryAdder DUT(a,b,sum,carry);
 
   initial begin 
   a=0;
      repeat(16) begin
        b=0;
        repeat(16) begin 
        #10 b=b+1;
        end
        a=a+1;
        end 
        #10 $finish;
   end
endmodule
