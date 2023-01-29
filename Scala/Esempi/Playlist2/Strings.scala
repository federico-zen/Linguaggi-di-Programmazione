object Strings {
    
    val str1 : String = "Hello World"
    val str2 : String = " Maggie"
    val num1 = 75
    val num2 = 100.25

    def main(args:Array[String]):Unit = {
        println(str1)

        println(str1.length())

        println(str1.concat(str2))

         printf("num1 : %d, num2 : %f \n",num1,num2)
        println("num1 : %d, num2 : %f".format(num1,num2))
    }
    
}