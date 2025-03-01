`timescale 1ns / 1ps

module top();

    logic clk;
    
    logic d;
    logic q;
 
    ff ff_inst(.*);
    
    logic en;
    logic data;
    mux mux_inst(.*);
    
    logic [2:0] cnt;
    logic rst;
    counter counter_ints(
    .clk(clk),
    .rst(rst),
    .cnt(cnt));
 
    testbench testbench_inst(.*);
 
    initial begin
      clk <= 0;
      rst <= 1;
      #5 rst <= 0;   
      clk = ~clk;
      forever #5 clk = ~clk;
    end
endmodule: top  
