module RAM_2Port_TB ();

  localparam DEPTH = 4;
  localparam WIDTH = 8;

  reg r_clk = 1'b0;
  reg r_wr_dv = 1'b0, r_rd_en = 1'b0;
  reg [$clog2(DEPTH)-1:0] r_wr_addr = 0, r_rd_addr = 0;
  reg  [WIDTH-1:0] r_wr_data = 0;
  wire [WIDTH-1:0] w_rd_data;

  always #10 r_clk <= !r_clk;  // create oscillating clock

  RAM_2Port #(
      .WIDTH(WIDTH),
      .DEPTH(DEPTH)
  ) dut (
      // Write Signals
      .i_wr_clk (r_clk),
      .i_wr_addr(r_wr_addr),
      .i_wr_dv  (r_wr_dv),
      .i_wr_data(r_wr_data),
      // read signals
      .i_rd_clk (r_clk),
      .i_rd_addr(r_rd_addr),
      .i_rd_en  (r_rd_en),
      .o_rd_dv  (),
      .o_rd_data(w_rd_data)
  );

  initial begin
    repeat (4) @(posedge r_clk);  // Give simulation a few clocks to start

    // Fill memory with incrementing pattern
    repeat (DEPTH) begin
      r_wr_dv <= 1'b1;
      @(posedge r_clk);
      r_wr_data <= r_wr_data + 1;
      r_wr_addr <= r_wr_addr + 1;
    end
    r_wr_dv <= 1'b0;

    // Read out incrementing pattern
    repeat (DEPTH) begin
      r_rd_en <= 1'b1;
      @(posedge r_clk);
      r_rd_addr <= r_rd_addr + 1;
    end
    r_rd_en <= 1'b0;

    repeat (4) @(posedge r_clk);

    // test reading and writing at the same time
    r_wr_addr <= 1;
    r_wr_data <= 84;
    r_rd_addr <= 1;
    r_rd_en   <= 1'b1;
    r_wr_dv   <= 1'b1;
    @(posedge r_clk);
    r_rd_en <= 1'b0;
    r_wr_dv <= 1'b0;
    repeat (3) @(posedge r_clk);
    r_rd_en <= 1'b1;
    @(posedge r_clk);
    r_rd_en <= 1'b0;
    repeat (3) @(posedge r_clk);

    $finish();
  end

endmodule
