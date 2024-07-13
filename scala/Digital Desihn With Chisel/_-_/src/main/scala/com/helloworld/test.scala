
package com.helloworld

import chisel3._


class Test extends Module {
  val io = IO(new Bundle {
    val led = Output(UInt(1.W))
  })
  val cntReg = RegInit(0.U(8.W))


  cntReg := Mux(cntReg === 9.U, 0.U, cntReg + 1.U)


  io.led := cntReg(4)
}

object Test extends App {
  println("Digital Design with Chisel");
  println(emitVerilog(new Test()))
}
