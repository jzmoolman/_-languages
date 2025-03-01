module debounce_Filter_TB();

    logic r_clk = 1'b1;
    logic r_bouncy = 1'b0;
    logic w_debounced;

    always #2 r_clk <= !r_clk;

    debounce_filter debounce_filter_inst #(.DEBOUNCE_LIMIT(4)) UUT
        (.i_clk(r_clk),
         .i_bouncy(r_bouncy_1),
        .o_led(w_debounced));

    initial begin
            repeat(3) @(posedge i_clk);
            r_bouncy <= 1'b1;

            @(posedge r_clk);
            r_bounce <= 1'b0; // glitch

            @(posedge r_clk);
            r_bounce <= 1'b1; // glitch


            @(posedge r_clk);
            r_bounce <= 1'b0; // glitch

            repeat(6) @(posedge r_clk);

            $display("Test Complete");
            $finish();
    end



endmodule

