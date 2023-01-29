ThisBuild / scalaVersion := "2.13.10"
ThisBuild / organization := "zen"


val AkkaVersion = "2.7.0"
lazy val distributedReverseString = (project in file("."))
  .settings(
    name := "Distributed Reverse String",
    scalacOptions += "-deprecation",
    libraryDependencies ++= Seq(
        "com.typesafe.akka" %% "akka-actor-typed" % AkkaVersion,
        "com.typesafe.akka" %% "akka-actor-testkit-typed" % AkkaVersion % Test
    ),
  )