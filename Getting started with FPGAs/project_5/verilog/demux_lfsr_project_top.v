module Demux_LFSR_Project_Top (
    input i_clk,
    input [1:0] i_switch,
    output [3:0] o_led
);

  reg  r_lfsr_toggle = 1'b0;
  wire w_lfsr_done;

  LFSR22 lfsr22_inst (
      .i_clk(i_clk),
      .o_lfsr_data(),
      .olfsr_done(w_lfsr_done)
  );

  always @(posedge i_clk) begin
    if (w_lfsr_done) r_lfsr_toggle <= !r_lfsr_toggle;
  end

  Demux_1_to_4 demux_inst (
      .i_data(r_lfsr_toggle),
      .i_sel (i_switch),
      .o_led (o_led)
  );

endmodule
