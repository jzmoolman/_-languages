

class PreferredPrompt(val preferences: String)

object Greeter {
  def greet(name: String)(implicit prompt: PreferredPrompt) = {
    println("welcome, " + name + ". The system is ready.")
    println(prompt.preferences)
  }
}

object JoesPrefs {
  implicit val prompt = new PreferredPrompt("Yes, master>")
}

import JoesPrefs._

abstract class Field[T] private (val default: Option[T]) {
  def this() = this(None)
  def this(default: T) = this(Some(default))
}



case object PgLevels extends Field[Int](2)

object Main extends App {

  println("TEST PROG")
  println(PgLevels.default)

  val bobsPrompt = new PreferredPrompt("relax> ")
  Greeter.greet("Bob")(bobsPrompt)
  Greeter.greet("Joe")



}