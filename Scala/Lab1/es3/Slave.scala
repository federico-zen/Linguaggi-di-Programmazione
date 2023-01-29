import akka.actor._
import akka.event.Logging


class Slave(i:Int) extends Actor{
    
    val log = Logging(context.system, this)
    
    override def preStart() = {
        //println(s"[SLAVE $i] Started !!")
        //println(s"[SLAVE $i] I'm Waiting for the string to reverse ")
        
    }
    
    def receive = {

        case ("reverse",x:String) => 
            println(s"[SLAVE $i] Recived")
            val reverse = x.reverse
            sender() ! ("response",reverse,i)


        case y => println(s"[SALVE $i] unknown : $y")


    }


}
