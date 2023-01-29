ThisBuild / scalaVersion := "2.13.10"
ThisBuild / organization := "zen"



lazy val calculator = (project in file("."))
  .settings(
    name := "calculator",
    scalacOptions += "-deprecation",
    libraryDependencies += "org.scala-lang.modules" %% "scala-parser-combinators" % "1.1.2"
  )