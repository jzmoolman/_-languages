


object Rational {
  implicit def intToRational(x: Int) = new Rational(x)
}

class Rational(n: Int, d: Int) {
  //println("Created " + n + "/" + d)
  require(d != 0)

  private val g = gcd(n.abs, d.abs)
  println(g)

  val numer: Int = n / g
  val denom: Int = d / g

  def this(n: Int) = this(n,1)

  override def toString =  numer + "/" + denom
  def +(that: Rational) : Rational =
    new Rational(n * that.denom + that.numer * d, d * that.denom)
  def +(i: Int): Rational =
    new Rational(numer + i*denom, denom)

  def -(that: Rational) : Rational =
    new Rational(n * that.denom - that.numer * d, d * that.denom)
  def -(i: Int): Rational =
    new Rational(numer - i*denom, denom)


  def *(that: Rational): Rational =
    new Rational(numer * that.numer, denom * that.denom)
  def *(i: Int): Rational =
    new Rational(numer * i, denom)


  def /(that: Rational): Rational =
    new Rational(numer * that.denom, denom * that.numer)
  def /(i: Int): Rational =
    new Rational(numer, denom*i)

 
  def lessThan(that: Rational) =
    this.numer * that.denom < that.numer * this.denom
  def max(that: Rational) =
    if ( this.lessThan(that)) that else this
  private def gcd(a: Int, b: Int): Int =
  {
      if (b == 0) a else gcd(b, a % b)
  }
}


object Main extends App {
  val r = new Rational(1,2) + (new Rational(1,2)) + (new Rational(1))
  println(r)
  val q = new Rational(66,42) * 2
  println(q)
  val o = 2 * new Rational(66,42) 
  println(o)
}
