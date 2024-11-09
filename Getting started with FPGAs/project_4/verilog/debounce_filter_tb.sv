
`timescale 1ns / 1ps


module Debounce_Filter_TB ();
  reg r_clk = 1'b0;
  reg r_bouncy = 1'b0;

  always #2 r_clk <= !r_clk;

  Debounce_Filter #(
      .DEBOUNCE_LIMIT(4)
  ) UUT (
      .i_clk(r_clk),
      .i_bouncy(r_bouncy),
      .o_debounced(w_debounced)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

    repeat (3) @(posedge r_clk);
    r_bouncy <= 1'b1;


    @(posedge r_clk);
    r_bouncy <= 1'b0;  // simulate glitch/bounce of switch

    @(posedge r_clk);
    r_bouncy <= 1'b1;


    repeat (6) @(posedge r_clk);
    $display("Test Completed");
    $finish();
  end
endmodule
