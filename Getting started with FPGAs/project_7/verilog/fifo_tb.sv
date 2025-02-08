module FIFO_TB ();

  localparam DEPTH = 4;
  localparam WIDTH = 8;

  reg r_clk = 1'b0, r_rst_l = 1'b0;
  reg r_wr_dv = 1'b0, r_rd_en = 1'b0;
  reg [WIDTH-1:0] r_wr_data = 0;
  reg [$clog2(DEPTH)-1:0] r_af_level = DEPTH-1, r_ae_level = 1;
  wire w_af_flag, w_ae_flag, w_full, w_empty, w_rd_dv;
  wire [WIDTH-1:0] w_rd_data;
  
  FIFO #(.WIDTH(WIDTH), .DEPTH(DEPTH)) dut 
  (
  .i_rst_l(r_rst_l),
  .i_clk(r_clk),
  // write side
  .i_wr_dv(r_wr_dv),
  .i_wr_data(r_wr_data),
  .i_af_level(r_af_level),
  .o_af_flag(w_af_flag),
  .o_full(w_full),
  // read side
  .i_rd_en(r_rd_en),
  .o_rd_dv(w_rd_dv),
  .o_rd_data(w_rd_data),
  .i_ae_level(r_ae_level),
  .o_ae_flag(w_ae_flag),
  .o_empty(w_empty)
  );

  always #10 r_clk <= !r_clk; // create oscillating clock

  // this task triggers a reset condition to the fifo.
  task reset_fifo();
    @(posedge r_clk);
    r_rst_l <= 1'b0;
    r_wr_dv <= 1'b0;  // ensure rd/wr are off
    r_rd_en <= 1'b0;
    @(posedge r_clk);
    r_rst_l <= 1'b1;
    @(posedge r_clk);
    @(posedge r_clk);
  endtask


  initial
  begin 
    integer i;

  reset_fifo();

    // Write single word, ensure it appears on output
    r_wr_dv   <= 1'b1;
    r_wr_data <= 8'hAB;
    @(posedge r_clk);
    r_wr_dv   <= 1'b0;
    @(posedge r_clk);
    assert (!w_empty);

    repeat(4) @(posedge r_clk);

    // read out that word, ensure dv and empty is correct
    r_rd_en <= 1'b1;
    @(posedge r_clk);
    r_rd_en <= 1'b0;
    @(posedge r_clk);
    assert (w_rd_dv);
    assert (w_empty);
    assert (w_rd_data == 8'hAB);


    // Test: Fill FIFO with incrementing pattern, then read it back.
    reset_fifo();
    r_wr_data <= 8'h30;
    repeat(DEPTH)
    begin
      r_wr_dv <= 1'b1;
      @(posedge r_clk);
      r_wr_dv <= 1'b0;
      @(posedge r_clk);
      r_wr_data <= r_wr_data + 1;
    end
    r_wr_dv <= 1'b0;
    @(posedge r_clk);
    assert (w_full);
    @(posedge r_clk);

    // Read out and verify incrementing pattern
    for (i=8'h30; i<8'h30 + DEPTH; i=i+1)
    begin
      r_rd_en <= 1'b1;
      @(posedge r_clk);
      r_rd_en <= 1'b0;
      @(posedge r_clk);
      assert (w_rd_dv);
      //assert (w_rd_data == i) else $error("rd_data is %d i is %d", w_rd_data, i);
      @(posedge r_clk);
    end
    assert (w_empty);


    // Test: Read and write on same clock cycle when empty + full
    reset_fifo();
    r_rd_en <= 1'b1;
    r_wr_dv <= 1'b1;
    @(posedge r_clk);
    @(posedge r_clk);
    r_rd_en <= 1'b0;
    repeat(DEPTH) @(posedge r_clk);
    assert (w_full);
    r_rd_en <= 1'b1;
    @(posedge r_clk);
    assert (w_full);
    @(posedge r_clk);
    assert (w_full);
    r_wr_dv <= 1'b0;
    r_rd_en <= 1'b0;

    // Test: Almost Empty, Almost Full Flags
    // AE is set to 1, AF is set to 3
    reset_fifo();
    assert (w_ae_flag);
    assert (!w_af_flag);
    
    r_wr_dv <= 1'b1;
    @(posedge r_clk);
    assert (w_ae_flag);
    assert (!w_af_flag);
    @(posedge r_clk);
    assert (!w_ae_flag);
    assert (!w_af_flag);
    @(posedge r_clk);
    assert (!w_ae_flag);
    assert (w_af_flag);
    @(posedge r_clk);
    assert (!w_ae_flag);
    assert (w_af_flag);
    assert (w_full);  

    $finish();
  end

endmodule
