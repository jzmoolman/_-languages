module Debounce_Project_Top (
    input  i_clk,
    input  i_sw,
    output o_led
);

  wire w_debounce_switch;

  Debounce_Filter #(
      .DEBOUCE_LIMIT(250000)
  ) debounce_inst (
      .i_clk(i_clk),
      .i_bouncy(i_sw),
      .o_debounced(w_debounce_switch)
  );

  LED_Toggle_Project led_toggle_inst (
      .i_clk(i_clk),
      .i_switch(w_debounce_switch),
      .o_led(o_led)
  );

endmodule
