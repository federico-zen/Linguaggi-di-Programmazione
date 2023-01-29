object Maps{
    
    //801 max
    //802 tom
    //804 jimmy
    
    val map : Map[Int,String]=Map(801->"Max",802->"Tom",804->"Jimmy",804->"Johnny")
    val map2 : Map[Int,String]=Map(805->"Jimmy")
    //If there is a duplication it save the last key -> value

    def main(args:Array[String]):Unit = {

        println(map)

        //Access to the map
        println(map(802))

        //Print the keys or the value
        println(map.keys)
        println(map.values)

        //is Empty
        println(map.isEmpty)

        map.keys.foreach { key =>
            println("Key " + key + " Value :" + map(key))
        }

        val result =map.contains(800)
        println(result)

        println(map ++ map2) 

        val map3 = map + (800 -> "Mimi")
        println(map3)
        

    }

}