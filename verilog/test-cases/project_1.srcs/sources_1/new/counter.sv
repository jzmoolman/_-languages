`timescale 1ns / 1ps


module counter1(
     input logic clk,
     input logic rst,
     output logic [2:0] cnt);
    
   
    always @(posedge  clk or posedge rst)
       if (rst) 
         cnt <= 3'b0;
       else 
        cnt <= cnt + 1;
endmodule


module counter0(
     input logic clk,
     input logic rst,
     output logic [2:0] cnt);
    
    logic [2:0] r_cnt;
    int  t_cnt;
    always @(posedge  clk or posedge rst)
       if (rst) 
         r_cnt <= 3'b0;
       else begin 
        t_cnt <= r_cnt;
        r_cnt <= r_cnt + 1;
      end
      
      assign cnt = t_cnt;             
endmodule
