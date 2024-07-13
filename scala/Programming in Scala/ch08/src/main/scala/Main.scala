import scala.io.Source



object LongLines {
  def processFile(filename: String, width: Int) = {

    def processLine(line: String) = {
        if (line.length > width)
        println(filename + ": " + line.trim)
    }

    val source = Source.fromFile(filename)
    for ( line <- source.getLines())
      processLine(line)
  }
}



object Main extends App {
  println("Functions and Closures")
  val width = args(0).toInt
  for (arg <- args.drop(1))
    LongLines.processFile(arg, width )

  (for (i <- 1 to 4) yield i).toList.foreach(println _)

  def echo(args2: String*) =
    for (arg <- args2) println(arg)

  echo("hello", "world")

  val arr = Array("What's", "up", "doc?")
  echo(arr:_*)

  def approximate(guess: Double): Double =
    if (isGoodEnough(guess)) guess
    else approximate(improve(guess))

  def approximateLoop(initialGuess: Double): Double = {
    var guess = initialGuess
    while (!isGoodEnoungh(guess))
      guess = improve(guess)
    guess
  }


}
