ThisBuild / scalaVersion := "2.13.10"
ThisBuild / organization := "zen"


val pVersion = "1.1.2"
lazy val brainfuck = (project in file("."))
  .settings(
    name := "brainfuck",
    scalacOptions += "-deprecation",
    libraryDependencies += "org.scala-lang.modules" %% "scala-parser-combinators" % "1.1.2"
  )