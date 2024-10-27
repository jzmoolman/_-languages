/*
 * Dummy file to start a Chisel project.
 *
 * Author: Martin Schoeberl (martin@jopdesign.com)
 * 
 */

package empty

import chisel3._
import chisel3.util._

import java.util.concurrent.ForkJoinTask


class MyBundle extends Bundle() {
   val test = Bool()
}

trait Decode {
    val table: Array[(Int, List[Int])]
  }

class Decode1 extends Decode {
  val table: Array[(Int, List[Int])] = Array(
    0 -> List(0,0,0),
    1 -> List(0,0,1),
    2 -> List(0,1,0),
    3 -> List(0,1,1)
  )
}

class Decode2  extends Decode {
  val table: Array[(Int, List[Int])] = Array(
    4 -> List(1,0,0),
    5 -> List(1,0,1),
    6 -> List(1,1,0)
  )
}

class MyClass {
  val decode_table = {
    (if (false) new Decode1 +: Option(new Decode2).toSeq else Nil) ++:
    (if (true) new Decode1 +: Option(new Decode2).toSeq else Nil)
  } //flatMap(_.table)
}

class MyClass2 {
  val decode_table = {
    (if (true) 0 +: Option(1).toSeq else Nil) ++:
    (if (true) 2 +: Option(3).toSeq else Nil)
  } //flatMap(_.table)
}

class Add extends Module {
  val io = IO(new Bundle {
    val a = Flipped(UInt(8.W))
    val b = Flipped(UInt(8.W))
    val c = UInt(8.W)
  })

  val t  = new MyBundle {
    val a = UInt(8.W)
  }
  val tt  = Vec(3, UInt(t.getWidth.W))

  val bp = BitPat("b1??1")



  println("TEST " + io.a)
  println("log2Ceil " + log2Ceil(17))
  println("Bundle width " + io.getWidth)
  println("MyBundle width " + t.getWidth)
  println("MyBundle vec width " + tt)
  println("BitPat " + bp)
  println("BitPat.width  " + bp.width)
  println("BitPat.mask  " + bp.mask)
  println("BitPat.mask.bitcount  " + bp.mask.bitCount)
  println("BitPat.value  " + bp.value)
  val diff = 4
  println("Pad BitPat", BitPat(0.U(diff.W)) ## bp)
//  val c = new MyClass2
//  println(c.decode_table)
  val ttt   = { new Decode1 +: Option(new Decode2).toSeq } flatMap(_.table)
  println(ttt)
  val tttt   =  { new Decode1 +: Option(new Decode2).toSeq } map(_.table)
  println(tttt.flatten)
//  tttt.map(x => x.table.flatten)
//  ttt.map(x => (x => println(x)))
//  println(ttt.flatMap(x=>x)
 //    (if (true) 2 +: Option(3).toSeq else Nil)
 //  println("Print table " + c.table(1)._1)
 //  println("Print table " + c.table(1)._2)

  val reg = RegInit(0.U(8.W))
  reg := io.a + io.b

  io.c := reg
}

class ProducerClass extends Module {
  val io  = IO( new Bundle {
    val readyvalid = Decoupled(UInt(32.W))
  })
  io.readyvalid.valid := true.B
  io.readyvalid.bits := 1.U
}

class ConsumerClass extends Module {
  val io  = IO( new Bundle {
    val readyvalid = Flipped(Decoupled(UInt(32.W)))
  })
  io.readyvalid.ready := false.B
}

class Request extends Bundle {
  val field1 = UInt(8.W)
  val field2 = UInt(8.W)
}

class TLBPTWIO extends Bundle {
     val incoming = Flipped(Decoupled(new Request))
     val outgoing = Decoupled((new Request))
    //  val incoming = Flipped(UInt(32.W))
    //  val outgoing = UInt(32.W)
}

class ValidIO_ extends Bundle {
  val incoming_ready = Flipped(UInt(1.W))
  val outgoing = Decoupled(Valid(new Request))
}

class TLBPTWModule extends  Module  {
  val io = IO( new TLBPTWIO)
  io.outgoing.bits := io.incoming.bits
  io.outgoing.valid := io.incoming.valid
  io.incoming.ready := 0.U
}

class ValidModule extends  Module {
  val io = IO( new ValidIO_)
  io.outgoing.valid := io.incoming_ready
  when (io.incoming_ready === true.B) {
    io.outgoing.bits.bits.field1 := 11.U
    io.outgoing.bits.bits.field2 := 11.U
  }
    .otherwise
  {
    io.outgoing.bits.bits.field1 := 11.U
    io.outgoing.bits.bits.field2 := 11.U

  }


}
class TLU extends Module {
  val io = IO( new Bundle {
    val in = Input(Bool())
    val out = Output (Bool())
  })
  val h_ready :: h_s1 :: h_s2 :: h_s2_nack :: h_wait :: h_replay :: h_dead :: Nil = Enum(7)
  println(h_dead)
  io.out := io.in

}

class AdderNode(dFn: Seq[Int] => Int,
                uFn: Seq[Int] => Int) {
  def add(): Int = {
    dFn(Seq(1,2,3))
  }
}


class Adder {
  val node = new AdderNode (
    { case dps: Seq[Int] =>
      println("What is this dps" + dps)
      9
    },
    { case ups: Seq[Int] =>
      println("What is this ups" + ups)
     8
    })
  }

object AddMain extends App {
  println("Generating the adder hardware")
  var adder = new Adder
  println(adder.node.add())
//  emitVerilog(new TLU, Array("--target-dir", "generated"))
}