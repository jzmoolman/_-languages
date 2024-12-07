import chisel3._
import _root_.circt.stage.ChiselStage

class TestQueue extends Module {
  val in_a = IO(Input(Bool()))
  val out_a = IO(Output(Bool()))
  out_a := in_a
  val q = Queue(QueueIn, 10)
}

object Main extends App {
  println(
    ChiselStage.emitSystemVerilog(
      gen = new TestQueue,
      firtoolOpts = Array("-disable-all-randomization", "-strip-debug-info")
    )
  )
}
