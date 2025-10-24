
module mux(input a,b,c,d,input [1:0]sel,output reg y);
    always @(*) begin
    case(sel)
    0 :  y=a;
    1 :  y=b;
    2 :  y=c; 
    3 :  y=d;
    endcase
    end
endmodule 