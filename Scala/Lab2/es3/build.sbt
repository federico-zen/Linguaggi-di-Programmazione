ThisBuild / scalaVersion := "2.13.10"
ThisBuild / organization := "zen"



lazy val arithmetic = (project in file("."))
  .settings(
    name := "arithmetic",
    scalacOptions += "-deprecation",
    libraryDependencies += "org.scala-lang.modules" %% "scala-parser-combinators" % "1.1.2"
  )