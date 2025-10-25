
module encoder(input [3:0]a,output reg [1:0]y);
    always @(a) begin 
        case(a) 
        4'h1 : y = 2'b00;
        4'h2 : y = 2'b01;
        4'h4 : y = 2'b10;
        4'h8 : y = 2'b11;
        default : y = 2'bxx;
        endcase 
        
    end 

endmodule 