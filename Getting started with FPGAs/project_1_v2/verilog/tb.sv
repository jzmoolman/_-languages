// Code your testbench here
// or browse Examples
module switches_to_leds_TB ();

  reg   r_switch_1;
  reg   r_switch_2;
  reg   r_switch_3;
  reg   r_switch_4;
  wire  w_led_1;
  wire  w_led_2;
  wire  w_led_3;
  wire  w_led_4;

  switches_to_leds UUT (
      .i_switch_1(r_switch_1),
      .i_switch_2(r_switch_2),
      .i_switch_3(r_switch_3),
      .i_switch_4(r_switch_4),
      .o_led_1(w_led_1),
      .o_led_2(w_led_2),
      .o_led_3(w_led_3),
      .o_led_4(w_led_4)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    r_switch_1 <= 1'b0;
    r_switch_2 <= 1'b0;
    r_switch_3 <= 1'b0;
    r_switch_4 <= 1'b0;

    #10;
    r_switch_1 <= 1'b1;
    r_switch_2 <= 1'b0;
    r_switch_3 <= 1'b0;
    r_switch_4 <= 1'b0;
    #10;
    r_switch_1 <= 1'b0;
    r_switch_2 <= 1'b1;
    r_switch_3 <= 1'b0;
    r_switch_4 <= 1'b0;
    #10;
    r_switch_1 <= 1'b0;
    r_switch_2 <= 1'b0;
    r_switch_3 <= 1'b1;
    r_switch_4 <= 1'b0;
    #10;
    r_switch_1 <= 1'b0;
    r_switch_2 <= 1'b0;
    r_switch_3 <= 1'b0;
    r_switch_4 <= 1'b1;
    #10 $finish();
  end
endmodule

