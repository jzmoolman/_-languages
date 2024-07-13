scalaVersion := "2.13.12"

scalacOptions ++= Seq(
  "-feature",
  "-language:reflectiveCalls",
)

libraryDependencies += "org.chipsalliance" %% "chisel" % "6.4.0"
addCompilerPlugin("org.chipsalliance" % "chisel-plugin" % "6.4.0" cross CrossVersion.full)
libraryDependencies += "edu.berkeley.cs" %% "chiseltest" % "6.0.0"
