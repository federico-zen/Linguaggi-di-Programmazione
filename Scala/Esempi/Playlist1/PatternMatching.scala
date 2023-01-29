object PatternMatching extends App{
  
    
    val i = 55
    val order = i match {
        case 1 => "First"
        case 2 => "Second"
        case 3 => "Third"
        case _ => i+"th"
    }

    println(order)

    //Pattern matchin can decomposition
    case class Person(name:String,age:Int)
    val bob = Person("Bob",43)

    val perosonGreeting = bob  match {
        case Person(n,a) => s"Hi my name is $n and i 'am $a yeas old!"
        case _ => ""

    }  
    println(perosonGreeting) 


    //Descostructing tuples
    val tuple = ("Bon Jovi","Rock")
    val bandD = tuple match {
        case (band,genre) => s"Band : $band , Genre : $genre "
        case _ => ""
    }

    println(bandD)

    //decomposing list
    val aList = List(1,2,3)

    val listD =  aList match {
        case List(_,2,_) => "List contains 2 in second position"
        case _ => "Unknow List"

    }

    //IF PM dosen't match , it will throw a MatchError
    //PM tries all case in sequence


}
