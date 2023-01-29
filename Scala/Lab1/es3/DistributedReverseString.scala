import akka.actor._
import akka.event.Logging
import language.postfixOps
import scala.concurrent.duration._

//https://doc.akka.io/docs/akka/current/actors.html
object DistributedReverseString{

    def main(args:Array[String]):Unit = {
        println("[MAIN] : Started !!")

        val system =  ActorSystem("MySystem")
        val master = system.actorOf(Props[Master], name = "Master")

       //Send a lorem ipsum
        master ! ("reverse","Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse rhoncus sapien mauris, vitae porttitor tortor porttitor nec. Donec ac urna consequat, cursus sapien eu, molestie massa. Integer faucibus nisi vel finibus interdum. Nulla dignissim at felis et consectetur. Vivamus a ligula eros. Nulla facilisi. Quisque imperdiet turpis est, eu aliquam.")
        

    }

}