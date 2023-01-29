object  FunctionalProgramming extends App{

    //Scala is OO
    class Person(name:String){
        def apply(age:Int) = println(s"I Have Age $age")

    }
    
    val bob = new Person("Bob")
    bob(43) //Invoking the applly method

    /*
        Scala runs on JVM, the JVM knows what a objects is but not what a function is
        Functional Programming :
            - Compose function
            - Pass function as args
            - Return function as result

        Conclusion:FunctionX   X = 1....22
    */

    val simpleIncrementer = new Function1[Int,Int] { //Instantiated a Traits 
        override def apply(arg: Int): Int = arg +1
    } //Define a function

    simpleIncrementer(23) //24

    //All scala functions are instanes of these function_x types

    val stringConcatenator = new Function2[String,String,String] {
        override def apply(arg1:String,arg2:String):String = arg1+arg2

    }

    stringConcatenator("Hello ","World")

    //Sintax Sugar

    /*
        Define a new Fucntion 1 and override the apply
    */

    var doubler : Int => Int = (x:Int) => 2*x
    doubler(8) //8

    //equivalent to 
    /*
         var doubler : Function1[Int,Int] = new Function1[Int,Int] {
            override def apply(x:Int) = 2*x

        }

    equivalent to 

        var doubler : Function1[Int,Int] = (x:Int) => 2*x
    */

    //Higher Order Functions : Take functions as argument or return functions as results

    val aMappdeList = List(1,2,3).map(x => x + 1)
    println("A MappedList " + aMappdeList)

    val aFlatMappedList = List(1,2,3).flatMap(x => List(x,2*x))
    /*Alternatives

        val aFlatMappedList = List(1,2,3).flatMap {x => 
            List(x,2*x)
        }
    
    */
    println("A FlatMappedList "+aFlatMappedList)


    val aFilteredList = List(1,2,3,4,5).filter(x => x <=3)
    println("A FilteredList "+aFilteredList)

    /*Alternatives

        val aFilteredList = List(1,2,3,4,5).filter( _<=3 ) 
    
    */

    //All combination  1,2,3 and 'a','b','c'

    val allPairs = List(1,2,3).flatMap( n => List('a','b','c').map(letter => s"$n-$letter") )
    println("allPairs "+allPairs)
    
    //for comprehensions
    val alternativePairs = for { //not the loop
        number <- List(1,2,3)
        letter <- List('a','b','c')
    }yield s"$number-$letter"

    println("alternativePairs "+alternativePairs)

    /**
      * Collections
      */

    //Lists
    //it had a head and a tail
    val list = List(1,2,3,4,5)
    val head = list.head
    val rest = list.tail
    val aPrependendedList = 0 :: list //0,1,2,3,4,5
    val extendedList = 0 +: list :+6 //0,1,2,3,4,5,6

    //Sequences
    val aSequence: Seq[Int] = Seq(1,2,3)
    val accessedElement = aSequence.apply(1) //2

    //Vector
    val aVector = Vector(1,2,3,4,5)

    //Sets : no duplicates
    val set = Set(1,2,3,4,1,2,3) //(1,2,3,4)
    val setHas5 = set.contains(5) //false
    val addset = set + 5 //(1,2,3,4,5)
    val remove = set - 3 //(1,2,4)

    //Ranges
    val aRange = 1 to 1000
    val twoBytwo = aRange.map(x=> 2*x).toList

    //Tuples
    val aTuple = ("Bon Jovi","Rock",1982)

    //Maps
    val aMap : Map[String,Int] = Map(
        ("Daniel",2341),
        ("Jane",1231414),
        "Jimmy"->123414 // Equivalent to ("Jimmy",123414)
    )
}
