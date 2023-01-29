import scala.util.Failure
import scala.concurrent.ExecutionContext.Implicits.global
import scala.util.Try
import scala.util.Success
import scala.concurrent.Future
object Advanced extends App{
    

    //Lazy Evaluation
    lazy val aLazyValue = 2
    lazy val aLazyValueWithSideEffect = {
        println("I'm so very Lazy !")
        43
    }

    //Lazy evaluation is usefull in infinite collections
    val eagerValue = aLazyValueWithSideEffect +1



    //pseudo-collections: Option, Try
    def methodWichCanReturnNull():String = "hello,Scala"
    val anOption = Option(methodWichCanReturnNull()) //Some("hello,Scala")
    //option = "Collection with contains at most one element" : Some(value) or None
    
    val stringProcessing = anOption match {
        case None => "Nothing"
        case Some(value) => s"Valid String : $value "
    }

    def methodWichCanThrowException() : String = throw new RuntimeException

    val aTry = Try(methodWichCanThrowException()) //contains a string or an Exception
    // a try = "collection" with the vaule of the code or an exception if the code throw one
    val anotherStringProcessing = aTry match{
        case Success(value) =>s"Valid String : $value "
        case Failure(ex) => s"Exception : $ex"
    }




    /**
      * Evaluate Something on Another Thread 
      * (Asinchronous Programming)
      */
    val aFuture = Future{ 
        println("Loading...")
        Thread.sleep(1000)
        println("Computed a Value")
        67
    }

    //Future is a collection with contains a value when it's evaluated
    //Future is composable with map,flatmap and filter



    //Implicits Basics

    //#1 : Implicit Arguments

    def aMethodWithImplicitArgs(implicit arg: Int) = arg+1
    implicit val myImplicit = 46
    println(aMethodWithImplicitArgs) //aMethodWithImplicitArgs(myImplicit) -> 47

    //#2 : Implicit Conversion
    implicit class MyRichInteger(n:Int) {
        def isEven()= n % 2 == 0

    }
    println(23.isEven()) //Serach an Implicit Wrapper -> new MyRichInteger(23).isEven()

    



}