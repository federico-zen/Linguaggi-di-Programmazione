import scala.language.implicitConversions

object Conversions {
    implicit def intToMeters  (i:Int) = Meter(i)
    implicit def doubleToMeters  (d:Double) = Meter(d)
    implicit def longToMeters  (l:Long) = Meter(l)
   
}



class Meter(val m:Int){
    def +(than:Meter) = {
         Meter(this.m + than.m)

    }

     

    override def toString(): String = {

        f"Meter($m)"
    }
}

object Meter {
    def apply(n: Int) = new Meter(n)
    
    def apply(n: Double) = new Meter(n.toInt)
    
    def apply(n: Long) = new Meter(n.toInt)

    def unapply(m: Meter) = Some(m.m)   
}
