// Singly Linked List

package fpscala.datastructures

sealed  trait List_0[+A]

case object Nil extends List_0[Nothing]
case class Cons[+A](head:A, tail:List_0[A]) extends List_0[A]

object  List_0 {
  def sum(ints: List_0[Int]): Int = ints match {
    case Nil => 0
    case Cons(x,xs) => x + sum(xs)
  }
  def product(ds: List_0[Double]): Double = ds match {
    case Nil => 1.0
    case Cons(0.0,_) => 0
    case Cons(x,xs) => x * product(xs)
  }
  def tail[A](l:List_0[A]): List_0[A]  = l match {
    case Cons(_,xs) => xs
    case _ => Nil
  }
  def setHead[A](l: List_0[A], v: A): List_0[A]  = l match {
    case Cons(_,xs) => Cons(v,xs)
    case _ => Nil
  }

  def dropWhile[A](l: List_0[A])(f: A=> Boolean): List_0[A] = l match {
    case Cons(x,xs) if f(x) => dropWhile(xs)(f)
    case _ => l
  }

  def foldRight[A,B](as: List_0[A], z: B, f: (A,B)=>B):B = as match {
    case Nil => z
    case Cons(x,xs) => f(x,foldRight(xs,z,f))
  }
  def foldRightCurry[A,B](as: List_0[A], z: B)(f: (A,B)=>B):B = as match {
    case Nil => z
    case Cons(x,xs) => f(x,foldRightCurry(xs,z){f})
  }

  @annotation.tailrec
  def foldLeft[A,B](as:List_0[A], acc: B)(f:(A,B)=>B): B = as match {
      case Nil => acc
      case Cons(x,xs) => foldLeft(xs,f(x,acc)){f}
  }



//  def foldRight2[A,B](as: List_0[A], z: B,f: (A,B) => B): B = as match {
//    case Nil => z
//    case Cons(x,xs) => f(x,foldRight(xs,z){f})
//  }
//
//  def foldLeftViaFoldRight[A,B](l: List_0[A], z: B, f: (B,A) => B): B = {
//    println("foldLeftViaFoldRight")
//    foldRight2(l, (b:B) => b, (a,g) => b => g(f(b,a)))(z)
//  }

  def sumFoldLeft(as: List_0[Int]): Int = {
    foldLeft(as, 0) { _ + _}
  }

  def productFoldLeft(as: List_0[Int]): Int ={
    foldLeft(as, 1) { _ * _}
  }

  def length[A](as: List_0[A]):Int = {
      this.foldRightCurry(as,0){(x,y)=>1+y}
  }

  def appendLeft[A](as: List_0[A], value:A): List_0[A] = {
    foldLeft(as, Cons(value, Nil)) { Cons(_,_) }
  }
  def appendRight[A](as: List_0[A], value:A): List_0[A] = {
    foldRightCurry(as, Cons(value, Nil)) { Cons(_,_) }
  }

//  def concat[A](l: List_0[List_0[A]]): List_0[A] = {
//    foldRight(l, Nil:List_0[A], append)
//  }

  def incrementEach(l: List_0[Int]): List_0[Int] = {
    foldRight(l, Nil: List_0[Int], (i: Int, acc: List_0[Int]) => Cons(i + 1, acc))
  }

  def incrementEach(l: Seq[Int]): Seq[Int] = {
     //    l.foldRight(Seq[Int]()) ( (x:Int, z:Seq[Int]) => { z.appended(x+1) } )
    l.foldLeft(Seq[Int]()) ( (z:Seq[Int],x :Int) => { z.appended(x+1) } )
  }

//  def incrementEach(l: List_0[Int]): List_0[Int] =
//    foldRight(l, Nil: List_0[Int], (i, acc) => Cons(i + 1, acc))

  def apply[A](as: A*): List_0[A] = {
    if (as.isEmpty) Nil
    else Cons(as.head, apply(as.tail:_*))
  }
}

object Main {
  def main(args: Array[String]): Unit = {
    println("Chapter 3")
    val x = List_0(1,2,3,4,5) match {
      case Cons(x, Cons(2, Cons(4,_))) => x
      case Nil => 42
      case Cons(x,Cons(y,Cons(3,Cons(4,_)))) => x+y
      case _ => 101
    }
    println(s"x= $x")
    val list2 = List_0(1,2,3,4,5)
    println(List_0.sum(list2))
    println(list2)
    println(List_0.tail(list2))
    println(List_0.setHead(list2, 9))
    // println(List.dropWhile(list2, (x: Int) => x < 4))
    println(List_0.dropWhile(list2)( (x: Int) => x < 4 ) )
    println(List_0.dropWhile(list2)( x => x < 4))
    println(List_0.dropWhile(list2)(_ < 4) )
    println(List_0.dropWhile(list2) { _ < 4} )
    println(List_0.foldRightCurry(list2, 0) { (x,y) => x + y} )
    println(List_0.foldRightCurry(list2, 0) { _ + _} )
    println(List_0.foldRightCurry(list2, Cons(9,Nil:List_0[Int])) {Cons(_,_) } )
    println(List_0.foldRightCurry(list2, Cons(9,Nil:List_0[Int])) {Cons(_,_) } )
    println(List_0.length(list2))
    println(List_0.foldLeft(list2,0){ _ + _ })
    println(List_0.sumFoldLeft(list2))
    println(List_0.productFoldLeft(list2))

    println(List_0.foldLeft(list2, Nil:List_0[Int]) { Cons(_,_)})
    println(List_0.appendLeft(list2,9))
    println(List_0.appendRight(list2,9))

    println(List_0.incrementEach(list2))
    val seq  = Seq(1,2,3,4,5)
    println(seq)
    println(List_0.incrementEach(seq))

    // Flatmap
    println("")
    println("Flatmap")
    println(s"seq $seq")
    println(seq.flatMap(i => Seq(i,i+10)))
    // Fliter using flatMapt
    println(seq.flatMap(i => if ( i % 2 == 0 ) Seq(i) else Seq()))




  }
}



