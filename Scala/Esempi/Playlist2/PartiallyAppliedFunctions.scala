import java.util.Date
object PartiallyAppliedFunctions{
    
    def log(date:Date, msg:String) = {
        println("[ "+ date +" ] "+ msg)

    }


    def main(args:Array[String]):Unit = {
        val sum = (a:Int,b:Int,c:Int) => a+b+c


        val f = sum(10,20,_:Int)

        println(f(30))

        val date = new Date
        val newLog = log(date,_:String)

        newLog("MSG 1")
        newLog("MSG 2")
        newLog("MSG 3")
    }



}