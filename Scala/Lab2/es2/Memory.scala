
import scala.collection.mutable.HashMap

case class VariableNotSetException() extends IllegalArgumentException

class Memory(){

    private val map = new HashMap[String,Double]()


    def setVariable(v:String,value:Double) = {
        map.addOne(v,value)
    }

    def getValue(v:String):Double={
        map.get(v).getOrElse(throw  VariableNotSetException())
    }

    override def toString(): String = {

        f"Variabili: ${map.toString()}"
    }


}