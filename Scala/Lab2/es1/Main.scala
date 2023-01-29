import Calculator._
import Calculator.Conversions._


object Main {
  
    def main(args:Array[String]):Unit = {

        val opList =List(
            (2*5)*(40),
            "B" ==>5,
            "A" ==> 10,
            "A" ==> 10 +40 +50
        ) 
        opList.foreach{op=>
            println(op)

        }

    }

}
