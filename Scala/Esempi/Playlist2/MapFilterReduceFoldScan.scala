object  MapFilterReduceFoldScan{

    val list = List(0,1,2,3,4,5,6,7,8,9)
    val list2 = List("A","B","C","D")
    val map = Map(1->"Max",2->"Gin")

    def main(args:Array[String]):Unit= {
      
        //MAP
          println("MAP EXAMPLES")
        println( list.map(x=>x*2)) // list.map(_ * 2))

        println(list.map(x=> x / 0.2)) 

        println(list.map(x=> "Number: "+x)) 
        println(list.map(x=> "HI"*x))

        println(map.values.map(x => "HI " + x))

        println("hello".map(_.toUpper))

        val listOfList = List(List(1,2,3,4),List(5,6,7,8,9,10))
        println(listOfList)
        println(listOfList.flatten)


        println(list.map(x => List(x,x+1)))

        val flatMapList = list.flatMap(x => List(x,x+1))
        println(flatMapList)
        println()
        println()
        
        //FILTER
        println("FITLER EXAMPLES")

        println(list.filter(x=> x % 2 == 0))
        

        //REDUCE
        println(list2.reduceLeft(_+_))
        println(list.reduceLeft(_+_))

        println(list.reduceLeft((x,y)=> {
          println("Value : "+x+ " "+y)
          x+y
        }))

        println(list.reduceRight((x,y)=> {
          println("Value : "+x+ " "+y)
          x-y
        }))

        //Different 
        println(list.reduceLeft(_-_))
        println(list.reduceRight(_-_))

        //FOLD LEFT - RIGHT

        //The different Bewteewn Fold and Filter is that fold need the starting value
        println(list.foldLeft(10)(_+_))
        println(list2.foldLeft("z")(_+_))

        println(list2.foldRight("z")(_+_))


        //SCAN
        //Scan give me the map of intermediate results
        println(list.scanLeft(10)(_+_))
        println(list2.scanLeft("z")(_+_))


    }

}