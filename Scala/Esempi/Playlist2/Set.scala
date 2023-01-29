object  Set{

    //By Deafult all set are immutable
    val intSet:Set[Int] = Set(1,1,1,2,3,4,5,5,6,7,8,8,9,9,10)
    val intSet2:Set[Int] = Set(11,12,13,14,15,16,17,18,19,20)

    val setName:Set[String] = Set("Max","Tom","Tom","John")

    //If i want to be mutable
    //var mutSet = scala.collection.mutable.Set(1,2,3,4,5,5,6,7,8,9,10,10)

    def main(args:Array[String]):Unit = {
        println(intSet)
        println(setName)

        //println(mutSet+11)
        //println(mutSet)

        //Check if the element is in the set
        println(intSet(8))
    

        println(intSet.head)
        println(intSet.tail)

        println(intSet++ intSet2)
        println(intSet.concat(intSet2))

        //Intersection between 2 sets
        println(intSet.&(intSet2))

        print(intSet.min)


        intSet.foreach(println)

        for(name <- setName){
            println(name)

        }




    }


}