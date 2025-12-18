module uart_top #(parameter clk_freq = 10000000, baud_rate=9600) 
    (input clk,rst,rx,input [7:0]dintx,input newd, output tx, output [7:0]doutrx, output donetx,donerx);
    
    uarttx #(clk_freq,baud_rate)dut1(clk,rst,newd,dintx,tx,donetx);
    uartrx #(clk_freq, baud_rate) dut2(clk,rst,rx,donerx,doutrx);
    
endmodule 



module uarttx #(parameter clk_freq = 1000000, parameter baud_rate = 9600)
    (input clk,rst, newd, input [7:0] tx_data, output reg tx,donetx);
    localparam clk_count = (clk_freq/baud_rate);
    
    integer count = 0;
    integer counts =0;
    reg uclk = 0;
    parameter idle =0;
    parameter transfer =1;

    reg state;
    
    always @(posedge clk) begin 
        if(count<clk_count/2) 
            count=count+1;
        else begin 
            count<=0;
            uclk = ~uclk;
        end 
    end 
    
    reg [7:0] din;
    
    always@(posedge uclk)begin 
        if(rst) state <=idle;
        else begin 
            case(state)
            idle: begin counts<=0;
                        tx<=1'b1;
                        donetx<=0;
                        if(newd) begin
                            state<=transfer;
                            din<=tx_data;
                            tx<=0;end 
                        else 
                            state<=idle;
                  end
            transfer : begin 
                        if(counts<=7) begin 
                            counts<=counts+1;
                            tx<=din[counts];
                            state<=transfer;
                            end 
                            else begin 
                                counts<=0;
                                tx<=1;
                                state<=idle;
                                donetx<=1;
                            end       
                        end      
            default : state<=idle;
                  
                  endcase
        end 
    end 
    
    endmodule 
    
module uartrx #(parameter clk_freq = 1000000, parameter baud_rate = 9600)
        (input clk,rst,rx,output reg done, output reg [7:0] rxdata);
    localparam clk_count = (clk_freq/baud_rate);
    integer count =0;
    integer counts=0;
    reg uclk=0;
    parameter idle =0;
    parameter start =1;

    reg state;
    
    always @(posedge clk) begin 
        if(count<clk_count/2) 
            count=count+1;
        else begin 
            count<=0;
            uclk = ~uclk;
        end 
    end 
    
    always @(posedge uclk)begin 
        if(rst) begin 
                 counts<=0;
                    rxdata<=0;
                    done<=0;
            
            end 
        else begin 
            case(state) 
            idle : begin 
                    counts<=0;
                    rxdata<=0;
                    done<=0;
                    if(rx==0)   state<=start;
                    else state <=idle;
            end 
            start : begin 
                    if(counts<=7) begin 
                        counts=counts+1;
                        rxdata<={rx,rxdata[7:1]};
                    end 
                    else begin 
                        counts<=0;
                        done<=1;
                        
                        state<=idle;                   
                    end 
            end 
            default : state<=idle;
            endcase 
        end      
    end 
endmodule     
    
    
    
    
    
    
    
    
