/*
 * Dummy file to start a Chisel project.
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 * 
 */

package empty

import chisel3._
import chisel3.util._

class MyBundle extends Bundle() {
   val test = Bool()
}

class Add extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(8.W))
    val b = Input(UInt(8.W))
    val c = Output(UInt(8.W))
  })

  val t  = new MyBundle {
    val a = UInt(8.W)
  }
  val tt  = Vec(3, UInt(t.getWidth.W))


  println("TEST " + io.a)
  println("log2Ceil " + log2Ceil(17))
  println("Bundle width " + io.getWidth)
  println("MyBundle width " + t.getWidth)
  println("MyBundle vec width " + tt)


  val reg = RegInit(0.U(8.W))
  reg := io.a + io.b

  io.c := reg
}

object AddMain extends App {
  println("Generating the adder hardware")
  emitVerilog(new Add(), Array("--target-dir", "generated"))
}