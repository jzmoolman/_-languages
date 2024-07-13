#!/usr/bin/env scala-cli

import scala.collection.mutable
import scala.collection.immutable

var i = 0
while ( i < args.length) {
  println("Hello, " + args(i) + "!")
  i += 1
}

args.foreach( arg => println(arg))

for (arg <- args)
    println(arg)

val greetingString = new Array[String](3)
greetingString(0) = "Hello"
greetingString(1) = ", "
greetingString(2) = "World"

for (i <- 0 to 2)
  println(greetingString(i))



greetingString.update(0, "Hello 2")
greetingString.update(1, ", ")
greetingString.update(2, "World")


for (i <- 0 to 2)
  println(greetingString.apply(i))


val OneTwo = List(1,2)
val ThreeFour = List(3,4)
val oneTwoThreeFour = OneTwo ::: ThreeFour

println(oneTwoThreeFour)

val twoThree = List(2,3)
val oneTwoThree = 1 :: twoThree
println(oneTwoThree)

val pair = (99, "Luftballoons")
println(pair._1)
println(pair._2)

var jetSet = Set("Boeing", "Airbus")
jetSet += "Lear"
println(jetSet.contains("Cessna"))
println(jetSet)

val movieSet = mutable.Set("Hitch", "Poltergeist")
movieSet += "Shrek"
println(movieSet)

val hashSet = immutable.HashSet("Tomatoes", "Chilies")
println(hashSet + "Coriand")

val treasureMap = mutable.Map[Int, String]()
treasureMap += (1 -> "Go to island.")
treasureMap += (2 -> "Find bing X on ground.")
treasureMap += (3 -> "Dig.")
println(treasureMap(2))




