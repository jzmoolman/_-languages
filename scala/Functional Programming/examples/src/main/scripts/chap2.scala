def partial1[A,B,C](a: A, f: (A,B) => C): B=>C =
  (b: B) => f(a,b)

def curry[A,B,C](f: (A,B) => C): A=>(B=>C) = {
  (a: A) => ((b: B) => f(a,b))
}

def uncurry[A,B,C] (f: A=>B=>C): (A,B)=>C = {
  (a: A, b: B) => f(a)(b)
}

val f = curry((x:Int,y:Int)=> x+y)


def compose[A,B,C](f: B=>C, g: A=>B): A=>C =
  (a: A) => f(g(a))
val f = (x:Double)=> math.Pi/2 - x
val cos = f compose math.sin
