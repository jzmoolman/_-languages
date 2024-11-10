module Demux_1_to_4 (
    input        i_data,
    input[1:0] i_sel,
    output[3:0] o_data
);

  assign o_data[0] = i_sel == 2'b00 ? i_data : 1'b0;
  assign o_data[1] = i_sel == 2'b01 ? i_data : 1'b0;
  assign o_data[2] = i_sel == 2'b10 ? i_data : 1'b0;
  assign o_data[3] = i_sel == 2'b11 ? i_data : 1'b0;


endmodule
