// Generated by CIRCT firtool-1.62.0
module ValidModule(	// src/main/scala/empty/Add.scala:141:7
  input        clock,	// src/main/scala/empty/Add.scala:141:7
               reset,	// src/main/scala/empty/Add.scala:141:7
               io_incoming_ready,	// src/main/scala/empty/Add.scala:142:14
  output       io_outgoing_valid,	// src/main/scala/empty/Add.scala:142:14
  output [7:0] io_outgoing_bits_field1,	// src/main/scala/empty/Add.scala:142:14
               io_outgoing_bits_field2	// src/main/scala/empty/Add.scala:142:14
);

  wire [7:0] io_outgoing_bits_field2_0 = io_incoming_ready ? 8'hB : 8'h0;	// src/main/scala/empty/Add.scala:144:39, :145:29, :150:29
  assign io_outgoing_valid = io_incoming_ready;	// src/main/scala/empty/Add.scala:141:7
  assign io_outgoing_bits_field1 = io_outgoing_bits_field2_0;	// src/main/scala/empty/Add.scala:141:7, :144:39, :145:29, :150:29
  assign io_outgoing_bits_field2 = io_outgoing_bits_field2_0;	// src/main/scala/empty/Add.scala:141:7, :144:39, :145:29, :150:29
endmodule

