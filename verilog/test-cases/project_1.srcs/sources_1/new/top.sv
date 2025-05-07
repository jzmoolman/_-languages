`timescale 1ns / 1ps

module top();

    logic clk;
    
    logic d;
    logic q;
 
    ff ff_inst(.*);
    
    logic en;
    logic data;
    mux mux_inst(.*);
    
    logic [2:0] cnt1;
    logic [2:0] cnt0;
    logic rst;
    counter1 counter1_ints(
    .clk(clk),
    .rst(rst),
    .cnt(cnt1));
 
 
 counter0 counter0_ints(
    .clk(clk),
    .rst(rst),
    .cnt(cnt0));
    testbench testbench_inst(.*);
 
    initial begin
      clk <= 0;
      rst <= 1;
      #5 rst <= 0;   
      clk = ~clk;
      forever #5 clk = ~clk;
    end
endmodule: top  
