import akka.actor._
import akka.event.Logging
import akka.actor.Stash
import scala.collection.mutable.HashMap

class Master extends Actor with Stash{
    case class ReverseString(s:String)
    

    val log = Logging(context.system, this)
    var slaves:List[ActorRef] =Nil
    
    val response = new HashMap[Int,String]() //To store the slave's respons and the index to sort

    override def preStart() = {
        println("[MASTER] Started !!")
        println("I Will Create 10 Slaves ")
        slaves = generateSlaves(10)
    }
    
    def receive = {
        case ("reverse",s:String) => 
            //println("[MASTER] received : "+s)
            
            //SPLIT STRING : NEED FIXES !!!
            val splitted = splitString(s,(s.length/10)+(s.length%10))
            
            //SEND TO SLAVES
            sendToSlaves(splitted,slaves)

            //RECEIVE  FROM SLAVE AND STORE
        case ("response",s:String,slaveNumber:Int) if (slaves.length-1 == response.size ) => 
    
            response.addOne(slaveNumber,s)
            
            import scala.collection.immutable.ListMap

            val res = ListMap(response.toSeq.sortWith(_._1 > _._1):_*)
            println(response)
            println("[MASTER] The Reverse is : \n"+res.values.mkString)
            
        case ("response",s:String,slaveNumber:Int) => 
            //println(s"[MASTER] Recived from Slave$slaveNumber : $s")
            response.addOne(slaveNumber,s)
            


        case y => println(s"[MASTER] Unknown Message : $y")


    }

    def generateSlaves(n : Int, acc:List[ActorRef] = Nil,i:Int = 0) : List[ActorRef] = {
        i match{
            case `n` => acc.reverse 
            case j => 
                val slave = context.actorOf(Props(classOf[Slave], i+1), "Slave"+(i+1))
                generateSlaves(n,slave::acc,i+1 )
        }
        

    }

    def splitString(xs: String, n: Int): List[String] = {
        if (xs.isEmpty) Nil
        else {
            val (ys, zs) = xs.splitAt(n)
             ys :: splitString(zs, n)
        }
    }

    def  sendToSlaves(splitted:List[String],slaves:List[ActorRef]) : Unit = {

        for(i<-0 to slaves.length-1) {
            i match {
               case m  if(i < splitted.length) => slaves(m) ! ("reverse",splitted(m))
               case m   =>slaves(m) ! ("reverse","")
            }
        }

    }


}
