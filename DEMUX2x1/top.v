
module mux(input a,sel,output y1,y0);

    assign y0 = a&~sel;
    assign y1 = a&sel;
endmodule 