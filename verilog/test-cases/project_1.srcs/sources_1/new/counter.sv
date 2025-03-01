`timescale 1ns / 1ps


module counter(
     input logic clk,
     input logic rst,
     output logic [2:0] cnt);
    
   
    always @(posedge  clk or posedge rst)
       if (rst) 
         cnt <= 3'b0;
       else 
        cnt <= cnt + 1;
endmodule
