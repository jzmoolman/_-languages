module demux_lfsr_project_top (
    input  i_clk,
    input  i_switch_1,
    input  i_switch_2,
    output o_led_1,
    output o_led_2,
    output o_led_3,
    output o_led_4
);

  wire w_done;
  reg  r_lfsr_toggle = 1'b0;

  lfsr_22 lfsr_22_inst (
      .i_clk(i_clk),
      .o_data(),  // not connected
      .o_done(w_done)
  );

  always @(posedge i_clk) begin
    if (w_done) r_lfsr_toggle <= !r_lfsr_toggle;
  end
  ;

  demux_1_to_4 demux_inst (
      .i_data  (r_lfsr_toggle),
      .i_sel_0 (i_switch_1),
      .i_sel_1 (i_switch_2),
      .o_data_1(o_led_1),
      .o_data_2(o_led_2),
      .o_data_4(o_led_3),
      .o_data_5(o_led_4)
  );

endmodule

