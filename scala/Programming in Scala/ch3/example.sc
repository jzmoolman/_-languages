import scala.io.Source

println(args(0))


def widthOfLength(s: String) = s.length.toString.length

if ( args.length > 0 ) {
  val lines = Source.fromFile(args(0)).getLines().toList
  val longestLine = lines.reduceLeft(
    (a,b) => if (a.length > b.length) a else b
  )
  //println("longestLine " + longestLine)
  val maxWidth = widthOfLength(longestLine)
  //println("maxWidth " + maxWidth)

  for (line <- lines) {
    val numSpaces = maxWidth - widthOfLength(line)
    // println(numSpaces) 
    val padding = " " * numSpaces
    println(padding + line.length + "|" + line)
 }
} else {
  Console.err.println("Error reading file")
}


