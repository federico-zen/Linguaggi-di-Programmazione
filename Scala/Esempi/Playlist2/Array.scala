import Array._
object Array{
    val array:Array[Int] = new Array[Int](10)

    val array2 = new Array[String](10)

    val array3 =  Array(1,2,3,4,5,6);
    def main(args:Array[String]):Unit = {
        array(0) = 20
        println(array(0))
        print("[ ")
        for (x <- array){
            print(x+" ")
        }
        println("]")

        //if i didn't assign the value of the array it is initialized to the default value
        print("[ ")
        for (i <- 0 to (array.length-1)){
            print(array2(i)+" ")
        }
        println("]")

        print("[ ")
        for (i <- 0 to (array3.length-1)){
            print(array3(i)+" ")
        }
        println("]")

        //Concat 2 arrays
        val result = concat(array3,array)
        print("[ ")
        for (i <- 0 to (result.length-1)){
            print(result(i)+" ")
        }
        println("]")

    }
}