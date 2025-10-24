`timescale 1ns/1ps

module tb;
    reg cin;
    reg [3:0] a,b;
    wire carry; wire [3:0]sum;
    
    CLA DUT (a,b,cin,sum,carry);
    
    initial begin 
        a=0;
        repeat(16) begin 
            b=0;
            repeat(16) begin 
                cin=0;#10;
                cin=1;#10;
                b=b+1;
            end
            a=a+1;
        end 
        $finish;
    end 

endmodule 