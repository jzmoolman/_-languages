import Ordering.Implicits._


object  MyModule {
  private def abs(n: Int): Int  =
    if (n < 0) -n
    else n

  private def factorial(n: Int): Int = {
    @annotation.tailrec
    def go(n: Int, acc: Int): Int =
      if (n<=0) acc
      else go(n-1, n*acc)

    go(n,1)
  }

  private def fib(n: Int): Int = {

    @annotation.tailrec
    def go(a: Int, b: Int, n: Int): Int = {
      if (n == 0)
        a
      else
        go(b,a+b,n-1)

    }
    go(0,1,n)
  }

  private  def formatAbs(x: Int) ={
    val msg = "The absolute value of %d is %d"
    msg.format(x, abs(x))
  }

  private  def formatFactorial(x: Int) ={
    val msg = "The Factorinal value of %d is %d"
    msg.format(x, factorial(x))
  }

  private  def formatFib(x: Int) ={
    val msg = "The fibonacci value of %d is %d"
    msg.format(x, fib(x))
  }

  private def formatResult(name: String, n: Int, f: Int => Int): String = {
    val msg = "The %s value of %d is %d"
    msg.format(name, n, f(n))
  }

  def isSorted[A:Ordering] (as: Array[A], ordered: (A,A) => Boolean): Boolean = {
     val o = as.sorted
      println(as.mkString(","))
      println(o.mkString(","))
      val b = (as zip o)
      println(b.mkString(","))
      var result: Boolean = true
      val c = b.map( { case (a,b) =>  if (ordered(a,b) == false)
          result = false
        result
      })
      println(c.mkString(","))
      result
  }

  def main (args: Array[String]): Unit = {
    println(formatResult("Abs", -42, abs))
    println(formatResult("Factorial", 3, factorial))
    println(formatResult("Fibonacci", 7, fib))
    val a = Array[Int](1,3,4,5,9)
    println(isSorted( a, (x:Int,y: Int) => x == y))
  }
}
