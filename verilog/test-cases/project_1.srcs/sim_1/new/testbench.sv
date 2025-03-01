`timescale 1ns / 1ps

module testbench(
    input logic clk,
    output logic d,
    input logic q,
    output logic en,
    input logic data);
        
   initial begin
     d = 0;
     
     en = 0;
     #7;
     d = 1;
     en = 1;
     #10
     d = 0;
     en = 0;
     #10;
     d = 1;
     en = 1; 
    
   end
           

endmodule
