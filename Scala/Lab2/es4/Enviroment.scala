import scala.collection.mutable
class Enviroment{
    private val data = new mutable.HashMap[Int,Int].withDefault(_=>0) //Inizializzo hashmap con 0
    private var pointer = 0

    def incrementPointer():Unit = { pointer+= 1}
    
    def decrementPointer():Unit = { pointer-= 1}
    
    def incrementData():Unit = { data(pointer) +=1}
    
    def decrementData():Unit = { data(pointer) -=1}

    def get() :Int = data(pointer)

    def get(address:Int):Int = data(address)

    def put(n:Int) : Unit = {data(pointer) = n}

    override def toString():String ={
        f"$pointer, "+data.toString() //Pointer e la situazione della memoria
    }

}