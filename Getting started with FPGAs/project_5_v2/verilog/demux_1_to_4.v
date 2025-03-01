module demux_1_to_4 
   (input  i_data,
    input  i_sel_1,
    input  i_sel_2,
    output o_data_1,
    output o_data_2,
    output o_data_3,
    output o_data_4);

   assign o_data_1 = !i_sel_1 & !i_sel_2 ? i_data : 1'b0;
   assign o_data_2 = !i_sel_1 & i_sel_2 ? i_data : 1'b0;
   assign o_data_3 = i_sel_1 & !i_sel_2 ? i_data : 1'b0;
   assign o_data_4 = i_sel_1 & i_sel_2 ? i_data : 1'b0;

 
endmodule