
module CLA(input [3:0]a,b,input cin, output [3:0]sum, output carry);
    wire [3:0]c,g,p; 

    assign g[0] = a[0]&b[0];
    assign g[1] = a[1]&b[1];
    assign g[2] = a[2]&b[2];
    assign g[3] = a[3]&b[3];
    assign p[0] = a[0]^b[0];
    assign p[1] = a[1]^b[1];
    assign p[2] = a[2]^b[2];
    assign p[3] = a[3]^b[3];
    
    assign c[0] = cin;
    assign c[1] = g[0]|(p[0]&cin);
    assign c[2] = g[1]|(p[1]&(g[0]|(p[0]&cin)));
    assign c[3] = g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&cin)))));
    assign carry = g[3]|(p[3]&(g[2]|(p[2]&(g[1]|(p[1]&(g[0]|(p[0]&cin)))))));
    
    assign sum[0] = p[0]^c[0];
    assign sum[1] = p[1]^c[1];
    assign sum[2] = p[2]^c[2];
    assign sum[3] = p[3]^c[3];
    
endmodule 