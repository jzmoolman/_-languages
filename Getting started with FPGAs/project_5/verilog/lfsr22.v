module LFSR_22 (
    input i_clk,
    output [21:0] o_data,
    output o_done
);

  reg [21:0] r_lfsr = 22'b0;
  wire w_xnor;

  always @(posedge i_clk) begin
    r_lfsr <= {r_lfsr[21:0], w_xnor};
  end

  assign w_xnor = r_lfsr[21] ^~ r_lfsr[20];
  assign o_done = (r_lfsr == 21'd0);
  assign o_data = r_lfsr;

endmodule

