// Code your testbench here
// or browse Examples
module And_Gate_TB();
  
  reg[2] r_in;
  wire[1] w_out;
  
  And_Gate_Project UUT
  (.sw(r_in),
   .led(w_out));
  
  initial 
    begin
      $dumpfile("dump.vcd"); $dumpvars;
      r_in[0] <= 1'b0;
      r_in[1] <= 1'b0;
      #10;
      r_in[0] <= 1'b0;
      r_in[1] <= 1'b1;
      #10;
      r_in[0] <= 1'b1;
      r_in[1] <= 1'b0;
      #10;
      r_in[0] <= 1'b1;
      r_in[1] <= 1'b1;
      #10
      $finish();
    end
endmodule 
      
