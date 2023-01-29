object PM{
    
    //It's an object , so i don't have to instantiate it to use the methods
    object Math{
        /* 1st way
        def FunctionName(x:Int,y:Int) : Int = {
            body of function
        }*/
        //the value 45 and 15 is the default value
        def add(x:Int=45,y:Int=15) : Int = {
            return x+y
        }
    
    
        //2nd Way
        //Without return keyword
        def subtract(x:Int,y:Int) :Int ={
            x-y
        }

        //3rd way
        def multiply(x:Int,y:Int) :Int = x*y

        //4th way
        def divide(x:Int,y:Int) = x/y

        def square(x:Int) = x*x

        def **(x:Int) = x*x
    }

    def print(x:Int,y:Int):Unit ={
        println(x +" "+y)
    }
    
    def main(args:Array[String]):Unit= {
        println(Math.add(4,1))
        println(Math.subtract(20,15))
        println(Math.multiply(4,5))
        println(Math.divide(20,4))

        //Posso rimuovere il . e la parentesi se la funzione ha un solo argomento
        println(Math square 4 )

        println("Default :"+Math.add())
        println("Default with 1 param :"+Math.add(3))

        print(100,200)

        println(Math ** 6)
        //Anonymous Function
        val addAn = (x:Int,y:Int) => x+y
        println(addAn(100,200))

    }


}