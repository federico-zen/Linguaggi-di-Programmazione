
//A closures is a function Which use one or more variables declared outside the function
object Closures{

    var number = 20 //unpure closures beause is var
                    //if it is val , is pure , because i cannot change the value

    val add = (x:Int) => x+number

    def main(args:Array[String]):Unit = {

        println(add(40))
        number = 100
        println(add(20))
    }
}