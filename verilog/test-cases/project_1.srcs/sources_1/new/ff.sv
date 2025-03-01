`timescale 1ns / 1ps

module ff(
  input wire logic clk,
  input  wire logic    d,
  output reg q);
  
  always @(posedge clk) begin
      q <= d;
  end
  
endmodule: ff
