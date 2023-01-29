object Lists{
    //Arrays are mutable
    //Lists are immutable 

    val list :List[Int] = List(1,2,3,4,5,6,7,8,9)
    val names :List[String] = List("Max","John","Tom")



    def main(args:Array[String]):Unit = {

        println(list)
        
        //CONS
        println(0::list) //Used to prepend 0 to the lists into a new list

        //NIL
        println(1::5::4::Nil)

        println(list.head)

        println(list.tail)

        println(list.isEmpty)
        
        println(list.reverse)

        //List of 5 element filled with 2
        println(List.fill(5)(2))

        println(list.max)

        //Iterate on the list

        list.foreach(println)

        var sum : Int= 0
        list.foreach(sum+=_)
        println("Sum: "+sum)


        for(name <- names ){
            println(name)
        }

        //Access by index
        println(names(0))   


    }
}