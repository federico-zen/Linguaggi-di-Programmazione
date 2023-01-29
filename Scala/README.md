# ♨️Esercizi Scala♨️
Esercizi di Scala assegnati a Lezione o presi da alcuni video

## ♨️Installazione Parser-Combinator♨️
sbt:
```
scala 
ThisBuild / scalaVersion := "2.13.10"
ThisBuild / organization := "zen"

lazy val parser = (project in file("."))
  .settings(
    name := "Parser",
    scalacOptions += "-deprecation",
    libraryDependencies += "org.scala-lang.modules" %% "scala-parser-combinators" % "1.1.2"
  )


```


## ♨️Fonti Esercizi♨️
Esercizi Presi dal Web : <br>
 👉 [Playlist1](https://www.youtube.com/playlist?list=PLmtsMNDRU0BxryRX4wiwrTZ661xcp6VPM) <br>
 👉 [Playlist2](https://www.youtube.com/playlist?list=PLS1QulWo1RIagob5D6kMIAvu7DQC5VTh3) <br>