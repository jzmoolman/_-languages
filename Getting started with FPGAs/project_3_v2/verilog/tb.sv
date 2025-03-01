module led_toggle_project_TB ();

  logic i_clk = 1'b1;
  always #5 i_clk <= ~i_clk;

  logic i_switch_1;
  logic o_led_1;

  led_toggle_project UUD (
      .i_clk(i_clk),
      .i_switch_1(i_switch_1),
      .o_led_1(o_led_1)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    i_switch_1 <= 1'b0;
    #2 
    
    i_switch_1 <= 1'b1;

   #10
   i_switch_1 <= 1'b0;

   #18
   $display("Test completed");
    
    
    $finish();

  end
endmodule
