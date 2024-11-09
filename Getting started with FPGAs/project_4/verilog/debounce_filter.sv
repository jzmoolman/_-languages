module Debounce_Filter #(
    parameter DEBOUNCE_LIMIT = 20
) (
    input  i_clk,
    input  i_bouncy,
    output o_debounced
);

  reg [$clog2(DEBOUNCE_LIMIT)-1:0] r_count = 0;
  reg r_state = 1'b0;

  always @(posedge i_clk) begin
    if (i_bouncy !== r_state && r_count < DEBOUNCE_LIMIT - 1) begin
      r_count <= r_count + 1;
    end else if (r_count == DEBOUNCE_LIMIT - 1) begin
      r_state <= i_bouncy;
      r_count <= 0;
    end
  end

  assign o_debounced = r_state;
endmodule
