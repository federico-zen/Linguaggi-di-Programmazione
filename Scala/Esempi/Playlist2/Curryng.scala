object Curryng {
    
   //Curryng : Transform a function with multiple arguments in a function wiht a single argument

    def add(x:Int,y:Int) = x+y

    def add2(x:Int) = (y:Int) => x+y

    //the same as add2
    def add3 (x:Int) (y:Int) = x+y

    def main(args:Array[String]):Unit = {

        //Return a function
        println(add2(30))
        
        //Apply the second function
        println(add2(30)(30))

        val sum40 = add2(40)
        println(sum40(100))

        println(add3(30)(30))

        val sum50 = add3(50)(_)
        println(sum50(100))
    }
    
}