
object FileMatcher {
  private def fileHere = (new java.io.File(".")).listFiles
  private def fileMatching(matcher: String => Boolean) =
    for (file <- fileHere; if matcher( file.getName))
    yield file
  def fileEnding(query: String) =
    fileMatching(_.endsWith(query))
  def fileContains(query: String) =
    fileMatching(_.contains(query))
  def fileRegex(query: String) =
    fileMatching(_.matches(query))
}


object Main extends App {
  println("Control Abstraction")

  def containsNeg(nums: List[Int]) = nums.exists( _ < 0)
  println(containsNeg(Nil))
  println(containsNeg(List(0,-1,-2)))

  //carried

  def plainOldSum(x: Int, y: Int) = x + y
  println(plainOldSum(1,2))
  def curriedSum(x: Int)(y: Int) = x + y
  println(curriedSum(1)(2))
  println((curriedSum(1)_) (2))

  def twice(op: Double => Double, x: Double) = op(op(x))
  println(twice(_ + 2, 0))
  println(twice(x => x + 2, 5))

  // def withPrinterWriter(file: File)(op: PrintWriter => Unit) = {
  //  val writer = new PrintWriter(file)
  //   try {
  //     op(writer)
  //   } finally {
  //     writer.close()
  //   }
  // }

  //val file = new File("data.txt")
  //withPrinterWriter(file) {
  //   writer => writer.println(new java.util.Date)
  //}

  println { "Hello world" }

  var assertionsEnabled = true

  def myAssert(predicate: => Boolean ) =
    if (assertionsEnabled && ! predicate)
      throw new AssertionError

  myAssert(5 > 3)

}
