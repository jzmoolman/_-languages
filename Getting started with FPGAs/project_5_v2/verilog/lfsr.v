module lfsr_22 (
  input         i_clk,
  input         i_reset,
  output [21:0] o_data,
  output        o_done);

  reg [21:0] r_lfsr;
  wire w_xnor;

  always @(posedge i_clk)
  begin
    if (i_reset) begin
      r_lfsr <= 22'b1;  
    end else begin
      r_lfsr <= {r_lfsr[20:0], w_xnor};
    end;
  end
  

  assign w_xnor = r_lfsr[21] ^~r_lfsr[20];
  assign o_data = r_lfsr;
  assign o_done = (r_lfsr == 22'd0);

endmodule
