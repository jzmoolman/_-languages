module ram_2port #(
    parameter WIDTH = 16,
    DEPTH = 256
) (
    // Write signals
    input i_wr_clk,
    input [$clog2(DEPTH)-1:0] i_wr_addr,
    input i_wr_dv,
    input [WIDTH-1:0] i_wr_data,

    // Read signal
    input i_rd_clk,
    input [$clog2(DEPTH)-1:0] i_rd_addr,
    input i_rd_en,
    output reg o_rd_dv,
    output reg [WIDTH-1:0] o_rd_data
);

  reg [WIDTH-1:0] r_mem[DEPTH-1:0];

  always @(posedge i_wr_clk) begin
    if (i_wr_dv) begin
      r_mem[i_wr_addr] <= i_wr_data;
    end
  end

  always @(posedge i_rd_clk) begin
    o_rd_dv <= i_rd_en;
    r_mem[i_wr_addr] <= i_wr_data;
  end

endmodule
