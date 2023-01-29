
case class City(name: String)
case class Train(name: String, schedule: List[(Time, City)]) {
  assert(schedule.length > 1, "Schedule must contain at least to elements")
}

object TrainDSL {
  import TimeDSL._
  
  // Exercise2: Make the following two syntaxes work and return a Train
  
  // val train1: Train = "International" at
  //  8 :: 50 from "Rotterdam" at
  //  "11:20" from "Paris"

  // val train2: Train = "Intercity" at
  //  8 :: 50 from "Rotterdam" at
  //  "10:00" from "Amersfoort" at
  //  12 :: 10 from "Groningen"
}