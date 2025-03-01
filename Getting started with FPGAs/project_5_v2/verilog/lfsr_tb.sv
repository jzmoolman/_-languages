module lfsr_tb();

    logic r_clk = 1'b1;
    logic w_reset = 1'b1;
    
    logic [21:0] w_data;
    logic w_done = 1'b0;

    always #5 r_clk <= !r_clk;

    lfsr_22 UUT 
    (.i_clk(r_clk),
     .i_reset(w_reset),
     .o_data(w_data),
     .o_done(w_done));

     initial begin
     repeat(1) @(posedge r_clk);
     w_reset <= 1'b0;
     while (w_done == 1'b0) begin
        @(posedge r_clk);
      
      end
      $finish();
      end
endmodule



