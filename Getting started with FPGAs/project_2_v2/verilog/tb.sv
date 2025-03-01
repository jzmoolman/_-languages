

module and_gate_project_TB ();

  logic i_switch_1;
  logic i_switch_2;
  wire  o_led_1;

  and_gate_project UUT (
      .i_switch_1(i_switch_1),
      .i_switch_2(i_switch_2),
      .o_led_1(o_led_1)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    i_switch_1 <= 1'b0;
    i_switch_2 <= 1'b0;
    #10;

    i_switch_1 <= 1'b1;
    i_switch_2 <= 1'b1;
    #10;
    $finish();
  end
endmodule

