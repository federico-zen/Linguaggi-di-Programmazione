object Tuples{
    //can store different data type , and they are fixed size , they are immutable
    val tuple  = (1,2,"Hello",true)
    val tuple2  = new Tuple3(1,2,"Hello")
    //Up to Tuple22
    val tuple3  = new Tuple2(2,"Hello")

    val tuple4  = new Tuple3(1,"Hello",(2,3))

    def main(args:Array[String]):Unit = {
        println(tuple)
        println(tuple2)

        printf(" %d %d %s %b \n",tuple._1,tuple._2,tuple._3,tuple._4)
        
        tuple.productIterator.foreach {
            i => println(i)

        }

        //Another way to create e tuple
        println( 1 -> "Gin"->true) //-> join two element into a tuple

        
        println(tuple4._3._2)
    }
}