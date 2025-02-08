module FIFO #(
    parameter WIDTH = 8,
    DEPTH = 256
) (
    input                     i_rst_l,
    input                     i_clk,
    // write side
    input                     i_wr_dv,
    input  [       WIDTH-1:0] i_wr_data,
    input  [$clog2(DEPTH)-1:0] i_af_level,
    output                    o_af_flag,
    output                    o_full,
    // read side
    input                     i_rd_en,
    output                    o_rd_dv,
    output reg [   WIDTH-1:0] o_rd_data,
    input  [$clog2(DEPTH)-1:0] i_ae_level,
    output                    o_ae_flag,
    output                    o_empty
);

  reg  [$clog2(DEPTH)-1:0] r_wr_addr;
  reg  [$clog2(DEPTH)-1:0] r_rd_addr;
  reg  [  $clog2(DEPTH):0] r_count;

  wire                    w_rd_dv;
  wire [       WIDTH-1:0] w_rd_data;

  RAM_2Port #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH)
  ) ram_inst (
      // write port
      .i_wr_clk (i_clk),
      .i_wr_addr(r_wr_addr),
      .i_wr_dv  (i_wr_dv),
      .i_wr_data(i_wr_data),
      // read prot
      .i_rd_clk (i_clk),
      .i_rd_addr(r_rd_addr),
      .i_rd_en  (i_rd_en),
      .o_rd_dv  (w_rd_dv),
      .o_rd_data(w_rd_data)
  );

  always @(posedge i_clk or negedge i_rst_l) begin
    if (~i_rst_l) begin
      r_wr_addr <= 0;
      r_rd_addr <= 0;
      r_count   <= 0;
    end else begin
      // write
      if (i_wr_dv) begin
        if (r_wr_addr == DEPTH - 1) begin
          r_wr_addr <= 0;
        end else begin
          r_wr_addr <= r_wr_addr + 1;
        end
      end

      // read
      if (i_rd_en) begin
        if (r_rd_addr == DEPTH - 1) begin
          r_rd_addr <= 0;
        end else begin
          r_rd_addr <= r_rd_addr + 1;
        end
      end

      // read with no writes
      if (i_rd_en & ~i_wr_dv) begin
        if (r_count != 0) begin
          r_count <= r_count - 1;
        end
        // write with no rea
      end else if (i_wr_dv & ~i_rd_en) begin
        if (r_count != DEPTH) begin
          r_count <= r_count + 1;
        end
      end

      if (i_rd_en) begin
        o_rd_data <= w_rd_data;
      end

    end
  end


  assign o_full = (r_count == DEPTH) || (r_count == DEPTH - 1 && i_wr_dv && !i_rd_en);
  assign o_empty = (r_count == 0);

  assign o_af_flag = (r_count > DEPTH - i_af_level);
  assign o_ae_flag = (r_count < i_ae_level);

  assign o_rd_dv = w_rd_dv;

  /////////////////////////////////////////////////////////////////////////////
  // ASSERTION CODE, NOT SYNTHESIZED
  // synthesis translate_off
  // Ensures that we never read from empty FIFO or write to full FIFO.
  always @(posedge i_clk) begin
    if (i_rd_en && !i_wr_dv && r_count == 0) begin
      $error("Error! Reading Empty FIFO");
    end

    if (i_wr_dv && !i_rd_en && r_count == DEPTH) begin
      $error("Error! Writing Full FIFO");
    end
  end
  // synthesis translate_on
  /////////////////////////////////////////////////////////////////////////////



endmodule

