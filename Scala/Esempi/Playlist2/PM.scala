object PM{
    def main(args:Array[String]):Unit= {
        var age = 20

        age match{
            case 20 => println("Twenty");
            case 6 => println("Six");
            //Default
            case _ => println("Other than 20");


        }

        age = 50

        val res =  age match{
            case 20 => "Twenty";
            case 6 => "Six";
            //Default
            case _ => "Other than 20";
        }

        println(res)
        
        var i = 4
        i match {
            case 1 | 3 | 5 | 7 | 9 => println("Odd") 
            case 2 | 4 | 6 | 8 | 10 => println("Even")
        }


    }


}