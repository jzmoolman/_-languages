module demux_1_to_4_tb ();

  logic r_clk = 1'b1;
  logic w_data = 1'b1;
  logic w_sel_1;
  logic w_sel_2;
  logic w_data_1;
  logic w_data_2;
  logic w_data_3;
  logic w_data_4;

  always #5 r_clk <= !r_clk;

  demux_1_to_4 UUT (
      .i_data  (w_data),
      .i_sel_1 (w_sel_1),
      .i_sel_2 (w_sel_2),
      .o_data_1(w_data_1),
      .o_data_2(w_data_2),
      .o_data_3(w_data_3),
      .o_data_4(w_data_4)
  );

  initial begin
    w_sel_1 <= 1'b0;
    w_sel_2 <= 1'b0;

    @(posedge r_clk);
    w_sel_1 <= 1'b0;
    w_sel_2 <= 1'b1;


    @(posedge r_clk);
    w_sel_1 <= 1'b1;
    w_sel_2 <= 1'b0;

    @(posedge r_clk);
    w_sel_1 <= 1'b1;
    w_sel_2 <= 1'b1;

    
    @(posedge r_clk);
    $finish();
  end

endmodule
