module led_toggle_project(
  input i_clk,
  input i_switch_1,
  output o_led_1);


reg  r_led_1 = 1'b0;
reg  r_switch_1 = 1'b0;

always @(posedge i_clk) 
begin
  r_switch_1 <= i_switch_1;
   
  if (i_switch_1 == 1'b0 && r_switch_1 == 1'b1)
  begin
     r_led_1 <= ~r_led_1;
  end
end

assign o_led_1 = r_led_1;

endmodule