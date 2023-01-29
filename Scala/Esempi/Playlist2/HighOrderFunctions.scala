object HighOrderFunctions{
    
    //Hihj Order Fucntion
    def math(x:Double,y:Double,z:Double, f:(Double,Double) => Double) : Double = {
       f(f(x,y),z)
    }

    def main(args:Array[String]):Unit = {

        var result = math(50,5,10,(x,y)=>x+y)
        println(result)

        result = math(10,10,10,_+_)
        println(result)
        
    }
    
}