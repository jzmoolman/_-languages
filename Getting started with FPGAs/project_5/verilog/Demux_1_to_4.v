module Demux_1_to_4 (
    input        i_data,
    input  [1:0] i_sel,
    output [3:0] o_data
);

  assing o_data[0] = i_sel == 2'b00 ? idata : 1'b0;
  assing o_data[1] = i_sel == 2'b01 ? idata : 1'b0;
  assing o_data[2] = i_sel == 2'b10 ? idata : 1'b0;
  assing o_data[3] = i_sel == 2'b11 ? idata : 1'b0;

endmodule
