`timescale 1ns / 1ps



module demux_lfsr_project_tb(
    );
    
    reg r_clk = 1'b0;
    reg [1:0] r_sw = 2'b00;
    wire [3:0] w_led;
    
    always #2 r_clk = !r_clk;
    
    
    Demux_LFSR_Project_Top dut_inst(
    .i_clk(r_clk),
    .i_switch(r_sw),
    .o_led(w_led));
    
    
endmodule
