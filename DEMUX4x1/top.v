
module mux(input a,input [1:0] sel,output reg [3:0]temp);
    always @(a,sel) begin
    temp=4'b0000;
        case (sel) 
        0: temp[0]=a;
        1: temp[1]=a;
        2: temp[2]=a;
        3: temp[3]=a;
        default : temp[0]=a;
        endcase
    end 
endmodule 