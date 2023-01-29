object HelloWorld {
    def main(args: Array[String]):Unit = {
        val name = "mark"
        val age = 20.5

        println(s"$name is $age yo")
        println(f"$name%s is $age%f yo")
        println(raw"Hello \nWorld")
        println("Hello \nWorld")
        

        val x = 20
        var res =""

        if (x ==20){
            //println("It's 20")
            res= "x == 20"
        }else{
            //println("It's not 20")
            res = "x != 20"
        }

        println(res)

        val res2 = if(x==20) "x == 20" else "x != 20"
        println(res2)

        val y = 30

        if (x==20 && y ==30){
            println("x==20 and y ==30")
        }

        if (x==40 || y ==30){
            println("x!=40 or y ==30")
        }

    }
}
