
package com.helloworld

import chisel3._


class HelloExt extends Module {
  val io = IO(new Bundle {
    val sw = Input(UInt(2.W))
    val led = Output(UInt(1.W))
  })
  io.led := io.sw(0)
}

object HelloExt extends App {
  println("Digital Design with Chisel");
  println(emitVerilog(new HelloExt()))
}
