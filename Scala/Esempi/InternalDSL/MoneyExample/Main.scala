import money._


object Main {
   implicit val exchanger = Exchanger (
        Map (
            Conversion(EUR,USD)-> 1.2,
            Conversion(USD,EUR) -> 0.8
        )
    )

    def main(args:Array[String]):Unit = {

        //println(Money(10,EUR).add(Money(20,EUR),exchanger))

        println(10(EUR)+20(EUR))
        println(10(EUR) to USD )
    }

}
