
`timescale 1ns / 1ps


module LED_Toggle_Project(
    input sysclk_n,
    input sysclk_p, 
    input[0:0] sw,
    output[0:0] led);
    
    

    wire s_clk;
 
    IBUFGDS clk_inst (
      .O(s_clk),
      .I(sysclk_p),
      .IB(sysclk_n)
    );
    
    reg r_LED = 1'b0;
    reg r_Switch = 1'b0;
   
    
    always @(posedge s_clk)
    begin
        r_Switch <= sw[0];
        if ( sw[0] == 1'b0 && r_Switch == 1'b1) 
        begin
          r_LED = ~ r_LED;
        end
    end
    
    assign led = r_LED;
    
endmodule
