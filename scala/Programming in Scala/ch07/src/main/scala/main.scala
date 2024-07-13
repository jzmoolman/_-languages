



object Main extends App {
  println("Chapter 7 - Built Control Structures")

  val filename =
    if (!args.isEmpty) args(0)
    else "default.txt"

  println(filename)

  //var line = ""
  //line = readLine()
  //println("Read: " + line)

  val fileHere = (new java.io.File(".")).listFiles
  for (file <- fileHere
     // if file.getName.endsWith(".scala" )
    if file.isFile
  )
    println(file)

  for ( i <- 1 to 4)
    println(i)

  def scalaFiles = for {
    file <- fileHere
    if file.getName.endsWith(".sbt")
  } yield file
  val files = scalaFiles
  println(scalaFiles.toList)



  def gcdLoop(x: Long, y: Long):Long = {
    var a = x
    var b = y
    while (a != 0) {
      val temp = a
      a = b % a
      b = temp
    }
    b
  }

  def gcd(x: Long, y: Long): Long =
    if (y == 0) x else gcd(y, x % y)


  val firstArg = if (args.length > 0) args(0) else ""
  val friend = firstArg match {
    case "salt" => "pepper"
    case "chips" => "salsa"
    case "eggs" => "bacon"
    case _ => "huh?"
  }
  println(friend)

  def makeRowSeq(row:Int) =
    for (col <- 1 to 10) yield {
      val prod = (row*col).toString
      val padding = " " * (4-prod.length)
      padding + prod
    }

  def makeRow(row: Int) = makeRowSeq(row).mkString

  def multiTable = {
    val tableSeq = 
      for (row <- 1 to 10)
      yield makeRow(row)
  }

  println(multiTable)

}
