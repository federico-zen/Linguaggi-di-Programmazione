object LazyEvaluation{

    class Strict{

        val e = {
            print("Strict ") 
            9    
        }

    }

    class LazyEval{

        lazy val l = {
            print("Lazy ") 
            9    
        }

    }


    def method1(n:Int):Unit ={
        print("Method 1 ")
        println(n)

    }
    //This Method is call byname paramether
    def method2(n: =>Int):Unit ={
        print("Method 2 ")
        println(n)

    }


    def main(args:Array[String]):Unit={

        val y = 9 //evaluated
        lazy val x = 10 //unevaluated decause is Lazy , it will be assigned when x is used

        val z = new Strict
        val w = new LazyEval

        println(z.e)
        println(w.l)

        val add = (a:Int ,b:Int) => {
            println("Add ")
            a+b
        }


        method1(add(5,6))
        method2(add(5,6))

    }

}