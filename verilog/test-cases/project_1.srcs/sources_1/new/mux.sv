`timescale 1ns / 1ps

module mux(
    input logic en,
    output logic data);
    
    assign data = en ? 1'b1 : 1'b0;
      
endmodule
