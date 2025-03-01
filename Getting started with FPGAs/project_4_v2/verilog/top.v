module debounce_project_top
   (input  i_clk,
    input  i_switch_1,
    output o_led_1);

  wire w_debounced_switch;

  debounce_filter #(.DEBOUNCE_LIMIT(25000)) debounce_filter_inst
  (.i_clk(i_clk),
   .i_bouncy(i_switch_1),
   .o_debounced(w_debounced_switch));

  led_toggle_project led_toggle_project_inst (
      .i_clk(i_clk),
      .i_switch_1(w_debounced_switch),
      .o_led_1(o_led_1)
  );

endmodule

module debounce_filter #(parameter DEBOUNCE_LIMIT = 20) (
    input  i_clk,
    input  i_bouncy,
    output o_debounced
);

  reg [$clog2(DEBOUNCE_LIMIT)-1:0] r_count = 0;
  reg r_state = 1'b0;

  always @(posedge i_clk)
  begin
    if (i_bouncy !== r_state && r_count < DEBOUNCE_LIMIT-1)
    begin
      r_count <= r_count + 1;
    end 
    else if (r_count == DEBOUNCE_LIMIT-1)
    begin
      r_state <= i_bouncy;
      r_count <= 0;
    end 
    else 
    begin
      r_count <= 0;
    end
  end
  assign o_debounced = r_state;
endmodule
