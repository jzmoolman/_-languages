module LED_Toggle_Project(
    input i_clk,
    input i_sw,
    output o_led);

    reg r_led = 1'b0;
    reg r_switch = 1'b0;

  always @(posedge i_clk)
    begin
        r_switch <= i_sw;
      if ( i_sw == 1'b0 && r_switch == 1'b1) 
        begin
          r_led = ~ r_led;
        end
    end

    assign led = r_led;

endmodule
