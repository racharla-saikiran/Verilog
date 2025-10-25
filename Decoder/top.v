
module decoder(input [2:0]a,output reg [7:0]y);
    always @(a) begin 
        case(a) 
        0 : y = 8'h01;
        1 : y = 8'h02;
        2 : y = 8'h04;
        3 : y = 8'h08;
        4 : y = 8'h10;
        5 : y = 8'h20;
        6 : y = 8'h40;
        7 : y = 8'h80;
        default : y =8'hxx;
        endcase 
        
    end 

endmodule 