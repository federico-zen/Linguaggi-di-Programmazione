
//https://www.youtube.com/watch?v=qe85507fSc8&list=PLmtsMNDRU0Bzj7INIrLugi3a_WClwQuiS&ab_channel=RocktheJVM


object PMTricks{

    //switch
    val aNumber = 41
    val ordinal = aNumber match {
        case 1 => "First"
        case 2 => "Second"
        case 3 => "Third"
        case _ => s"$aNumber th"

    }

    //Case Classes
    case class Person(name:String,age:Int)
    val bob = Person("bob",44)

    val bobGreeting = bob match{
        case Person(n,a) => s"Hi, MY name is $n and I am $a years old"
    }
    //List Extractors
    val number = List(1,2,3,4)

    val mustHaveTree = number match{
        case List(_,_,3,somethingElse) => s"The 4th elements is $somethingElse"
    }

    //Haskell-like Prepending

    val startsWithOne = number match{

        case 1::tail => s"List Start with one, tail is $tail"
    }

    def process(aList:List[Int]) = aList match{
        
        case Nil => "List Is Empty"
        case head :: tail=>  s"List Start with $head, tail is $tail"

    }

    //var arg pattern
    val iDontCaseAboutTheRest = number match{

        case List(_,2,_*) => "I only care about the second number being 2" //_* is the rest of the lists
    }
    
    //other infix pattern
    val mustEndWith = number match{
        case List(1,_*) :+ 4 => "OK"

    }


    //type Specifiers

    def giveMeAValue():Any = 45

    val gimmeTheType = giveMeAValue() match{
        case _:String => "String"
        case _:Int => "Int"
        case _=> "Something else"

    }


    // name binding
    def requestMoreInfo(p:Person):String = s"The person ${p.name} is a good person"

    val bobsInfo = bob match{
        case p @ Person(name, age) => s"$name's info: ${requestMoreInfo(p)}"
    }

    // Conditional guards
    val ordinal2 = aNumber match{
        case 1 => "First"
        case 2 => "Second"
        case 3 => "Third"
        case n if n%10 == 1 => n + "st"
        case n if n%10 == 2 => n + "nd"
        case n if n%10 == 3 => n + "rd"
        case _ => aNumber + "th"

    }

    //Alternative Patterns
    val myOptimalList = number match {
        case List(1,_*) | List(_,_,3,_*) => "I like this list" // Case List(1,_*) OR List(_,_,3,_*)
        case _ => "I Hate This List"

    }




    def main(args:Array[String]):Unit = {

        println(process(number))
        println(gimmeTheType)
        println(bobsInfo)
        println(ordinal2)
        println(myOptimalList)

    }



}