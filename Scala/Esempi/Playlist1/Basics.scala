//Extends App vuole dire che è eseguibile
object Basics extends App {

    //Define Value
    val n : Int = 42 //E' immutabile per via del val

    val aBoolean = false

    val aString = "I love Scala"
    val aInt = 50
    var Composed = "I"+" "+"love"+" "+"Scala"

    var inInterpolated = s"The meaning of life  is $aInt"

    //if
    val ifExpression = if(aInt > 43 ) 56 else 999

    //code block

    val aCodeBlock = {

        //definition

        val aLocalValue = 50

        //deve restituire qualcosa
        aLocalValue + 3

    }

    //functions
    def myFun(x:Int , y : String):String = y+" "+ x

    //larger Function

    def myFun2(x:Int,y:String) : String = {

        y+" "+ x

    }

    //Recoursive Function
    def factorial(n:Int):Int = {
        if(n<= 1) 1 
        else n*factorial(n-1)
    }

    //Unit type = void

    def myUnitFunction():Unit = {
        println("Unit")
    }

    // value returned by all Unit function
    val unit = () 



    



}