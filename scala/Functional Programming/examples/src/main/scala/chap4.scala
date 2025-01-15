package fpscala.datastructures

sealed trait Option[+A] {
  def map[B](f: A => B): Option[B] = this match {
    case None => None
    case Some(x) => Some(f(x))
  }

  def getOrElse[B >: A](default: => B): B = this match {
    case None => default
    case Some(x) => x
  }


  def flatMap[B](f: A => Option[B]): Option[B] = this match {
    case None => None
    case Some(x) => f(x)
  }

  def flatMap_2[B](f: A => Option[B]): Option[B] =
    map(f).getOrElse(None)

  def orElse[B >: A](ob: => Option[B]): Option[B] = this match {
    case None =>  { println("Late evaluate"); ob }
    case Some(x) => Some(x)
  }

  def orElse_2[B >: A](ob: => Option[B]): Option[B] =
    map(Some(_)).getOrElse(ob)

  def filter(f: A => Boolean): Option[A] = this match {
    case None => None
    case Some(x) => if ( f(x) == true) Some(x) else None
  }

  def filter_2(f: A => Boolean): Option[A] =
    flatMap_2(a => if (f(a)) Some(a) else None)

}

object Option {
  def map2[A,B,C](a: Option[A], b: Option[B])(f: (A, B) => C): Option[C] =
    a.flatMap(aa => b.map(bb => f(aa,bb)))
  def map2_comp[A,B,C](a: Option[A], b: Option[B])(f: (A, B) => C): Option[C] =
    for { aa <- a
          bb <- b
    } yield f(aa,bb)
}


case class Some[+A](get: A) extends Option[A]
case object None extends Option[Nothing]

class Test {
  val one: Int = 1;
}

object Chapter4 {

  def failingFn(i: Int): Int = {
    println("Enter - failingfn")
    val y : Int = throw new Exception("fail:")
    try {
      val x = 42 + 5
      x + y
    }
    catch {
      case e: Exception => 43
    }
  }

  def failingFn2(i: Int): Int = {
    println("Enter - failingfn")
    try {
      val x = 42 + 5
      x + ((throw new Exception("fail:")): Int)
    }
    catch {
      case e: Exception => 43
    }
  }

  def mean0(xs: Seq[Double]): Double =
    if (xs.isEmpty)
      throw new ArithmeticException("mean of empty list!")
    else xs.sum / xs.length

  def mean(xs: Seq[Double]): Option[Double] =
    if (xs.isEmpty)
      None
    else
      Some(xs.sum / xs.length)

  def variance(xs: Seq[Double]): Option[Double] =
      mean(xs).flatMap(m => mean(xs.map(x => math.pow(x - m, 2))))

  def variance_2(xs: Seq[Double]): Option[Double] =
      mean(xs).flatMap(m => mean(xs.map(x => math.pow(x - m, 2))))

  def lift[A,B](f: A=>B) : Option[A] => Option[B] = _ map f

  def abs_2: Option[Int] => Option[Int] = lift(math.abs)
//  def abs_2: Option[Double] => Option[Double] = lift(math.abs)

  def sequance[A](as: List[Option[A]]): Option[List[A]] =
    as.foldRight(Some(List()): Option[List[A]]) { (x,xs) => {
      xs match {
        case None => None
        case Some(l:List[A]) => {
          x match {
            case Some(v) => Some(l :+ v)
            case None => None
          }
        }
      }
    }
  }

  def traverse[A,B](as: List[A])(f: A => Option[B]): Option[List[B]] =
    as.foldRight(Some(List()): Option[List[B]]) { (x,xs) => {
      xs match {
        case None => None
        case Some(l:List[B]) => {
          f(x) match {
            case None => None
            case Some(v) => Some(l :+ v)
            }
          }
        }
      } }

  def main(args: Array[String]):Unit = {
    println("Chapter 4 - Handeling errors without exceptions")
    //    failingFn(1)
    //    mean(Seq())

    val n = None
    val s = Some(1)

    // map
//    println(n.map(x => x))
//    println(s.map(x => x+1))

    // flatMap
//    println(n.flatMap_2(x => x))
//    println(n.flatMap(x => x))
//    println(s.flatMap_2( _ =>  None ))
//    println(s.flatMap( _ =>  None ))

    //  getOrElse
    //  println(n.getOrElse(-1))
    //  println(s.getOrElse(1))

    //  orElse
//    println(n.orElse( { println("From orElse - None"); None } ))
//    println(s.orElse( { println("will not evaluate"); None } ))
//    println(n.orElse_2( { println("From orElse - None"); None } ))
//    println(s.orElse_2( { println("will not evaluate"); None } ))



    // filter
//    println(n.filter(x => x == 1))
//    println(s.filter(x => x == 1))
//    println(s.filter(x => x > 1))
    // variance
//    println(variance(Seq(1,2,3)))

/*
 *  Lift
 */

//    println(math.abs(1))
//    println(math.abs(-1))
//    println(abs_2(Some(1)))
//    println(abs_2(Some(-1)))
//
//    val seq = Seq(1, 2, -1)
//    println(seq)
//    println(seq.map(math.abs(_)))
//    val some_seq = Seq(Some(1), Some(2), Some(-1))
//    println(some_seq.map(abs_2(_)))




/*
 * map2 4.3
 */

    println("")
    println("map2 4.3")
    println(Option.map2(Some(1),Some(2)){
      (x,y) => x + y
    })
    println(Option.map2(None:Option[Int],Some(2)){
      (x,y) => x + y
    })
    println(Option.map2_comp(None:Option[Int],Some(2)){
      (x,y) => x + y
    })


/*
 *  Sequnace 4.4
 */
    println("")
    println(sequance(List(Some(1),Some(2),Some(3))))
    println(sequance(List(Some(1),Some(2),Some(3),None)))

    /*
     *  Traverse 4.5
     */
    println( traverse(List(1,2,3)){
        x => Some(x)
    })
    println( traverse(List(1,2,3))( x=> if (x > 1) Some(x) else None))


    val c = new Test {
      val two: Int = 2
    }
    println(c.one)
    println(c.two)

    ()
  }
}
