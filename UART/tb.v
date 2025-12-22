`timescale 1ns / 1ps
module tb;
    reg clk,rst,rx,newd;
    reg [7:0] dintx;
    wire tx,donetx,donerx;
    wire [7:0] doutrx;
    
    uart_top #(100000,9600) dut (clk,rst,rx,dintx,newd,tx,doutrx,donetx,donerx);
    
    initial begin 
        clk<=0;
        rst<=1;
        rx<=1;
        
    end 
    
    always #5 clk <= ~clk;
    
    reg [7:0] rx_data=0;
    reg [7:0] tx_data = 0;
    initial begin 
        repeat(5) @(posedge clk);
        rst<=0;
        for (int i=0;i<10;i=i+1) begin 
            rst=0;
            newd=1;
            dintx = $urandom();
            wait(tx==0);
            @(posedge dut.dut1.uclk);
            for(int j=0;j<8;j=j+1) begin 
                @(posedge dut.dut1.uclk);
                tx_data = {tx,tx_data[7:1]};
            end
            @(posedge donetx);        
        end 
        
        for(int i=0;i<10;i=i+1) begin
            rst=0;
            newd=0;
            rx=0;
            @(posedge dut.dut1.uclk);
            for(int j=0;j<8;j=j+1) begin 
                @(posedge dut.dut1.uclk);
                rx= $urandom();
                rx_data = {rx,rx_data[7:1]};
            end 
            
            @(posedge donerx);
            rx=1;
        end 
    
    end 
    
    
endmodule