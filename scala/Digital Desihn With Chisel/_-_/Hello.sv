// Generated by CIRCT firtool-1.62.0
// Standard header to adapt well known macros for register randomization.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

// Include register initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS

// Include rmemory initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_MEM_
    `define ENABLE_INITIAL_MEM_
  `endif // not def ENABLE_INITIAL_MEM_
`endif // not def SYNTHESIS

module Hello(	// src/main/scala/com/helloworld/main.scala:7:7
  input  clock,	// src/main/scala/com/helloworld/main.scala:7:7
         reset,	// src/main/scala/com/helloworld/main.scala:7:7
  output io_led	// src/main/scala/com/helloworld/main.scala:8:14
);

  reg [31:0] cntReg;	// src/main/scala/com/helloworld/main.scala:12:23
  reg        blkReg;	// src/main/scala/com/helloworld/main.scala:13:23
  always @(posedge clock) begin	// src/main/scala/com/helloworld/main.scala:7:7
    if (reset) begin	// src/main/scala/com/helloworld/main.scala:7:7
      cntReg <= 32'h0;	// src/main/scala/com/helloworld/main.scala:12:23
      blkReg <= 1'h0;	// src/main/scala/com/helloworld/main.scala:7:7, :13:23
    end
    else begin	// src/main/scala/com/helloworld/main.scala:7:7
      automatic logic _GEN;	// src/main/scala/com/helloworld/main.scala:16:15
      _GEN = cntReg == 32'h17D783F;	// src/main/scala/com/helloworld/main.scala:12:23, :16:15
      if (_GEN)	// src/main/scala/com/helloworld/main.scala:16:15
        cntReg <= 32'h0;	// src/main/scala/com/helloworld/main.scala:12:23
      else	// src/main/scala/com/helloworld/main.scala:16:15
        cntReg <= cntReg + 32'h1;	// src/main/scala/com/helloworld/main.scala:12:23, :15:20
      blkReg <= _GEN ^ blkReg;	// src/main/scala/com/helloworld/main.scala:13:23, :16:{15,28}, :18:12
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// src/main/scala/com/helloworld/main.scala:7:7
    `ifdef FIRRTL_BEFORE_INITIAL	// src/main/scala/com/helloworld/main.scala:7:7
      `FIRRTL_BEFORE_INITIAL	// src/main/scala/com/helloworld/main.scala:7:7
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin	// src/main/scala/com/helloworld/main.scala:7:7
      automatic logic [31:0] _RANDOM[0:1];	// src/main/scala/com/helloworld/main.scala:7:7
      `ifdef INIT_RANDOM_PROLOG_	// src/main/scala/com/helloworld/main.scala:7:7
        `INIT_RANDOM_PROLOG_	// src/main/scala/com/helloworld/main.scala:7:7
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// src/main/scala/com/helloworld/main.scala:7:7
        for (logic [1:0] i = 2'h0; i < 2'h2; i += 2'h1) begin
          _RANDOM[i[0]] = `RANDOM;	// src/main/scala/com/helloworld/main.scala:7:7
        end	// src/main/scala/com/helloworld/main.scala:7:7
        cntReg = _RANDOM[1'h0];	// src/main/scala/com/helloworld/main.scala:7:7, :12:23
        blkReg = _RANDOM[1'h1][0];	// src/main/scala/com/helloworld/main.scala:7:7, :13:23
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// src/main/scala/com/helloworld/main.scala:7:7
      `FIRRTL_AFTER_INITIAL	// src/main/scala/com/helloworld/main.scala:7:7
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_led = blkReg;	// src/main/scala/com/helloworld/main.scala:7:7, :13:23
endmodule
