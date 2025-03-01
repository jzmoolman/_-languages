module ram_2port_tb ();
  logic r_wr_clk = 1'b1;
  logic [$clog2(256)-1:0] w_wr_addr;
  logic w_wr_dv;
  logic [15:0] w_rw_data;
  logic r_rd_clk = 1'b1;
  logic [$clog2(256)-1:0] w_rd_addr;
  logic w_rd_en;
  logic w_rd_dv;
  logic [15:0] w_rd_data;



  always #5 r_rd_clk <= !r_rd_clk;
  always #5 r_wr_clk <= !r_wr_clk;

  ram_2port #(.WIDTH(16), .DEPTH(256)) ram_port_tb 
  (
      .i_wr_clk (r_wr_clk),
      .i_wr_addr(w_wr_addr),
      .i_wr_dv  (w_wr_dv),
      .i_wr_data(w_wr_data),
      .i_rd_clk (r_wr_clk),
      .i_rd_addr(w_wr_addr),
      .i_rd_en  (w_rd_en),
      .o_rd_dv  (w_wr_dv),
      .o_rd_data(w_wr_data)
  );
  

  initial begin
    w_rd_addr <= $clog2(256)-1'd0;
    
    @(posedge r_wr_clk);
    w_wr_addr <= $clog2(256)-1'd0;
    w_wr_data <= 16'hf;
    
    assign w_rd_en = 1'b1; 
   
    #10
    assign w_rd_en = 1'b0;
    
    #10
    $finish();

  end
endmodule
