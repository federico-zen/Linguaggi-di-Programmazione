
class Monoid[T](val set :Set[T] , identity : T , operation:(T,T)=>T){
    
    override def toString(): String = {
        import java.lang.StringBuilder

        val sb = new StringBuilder()

        sb.append("MONOID\n")
        
        sb.append("SET = "+set+"\n")
        sb.append("Identity = "+identity+"\n")
        sb.append("Operation = "+ operation.toString()+"\n")
        sb.append("CHECK : "+this.checkMonoid()+"\n")
        sb.toString()

    }
    
    def checkMonoid():Boolean ={

        set.foreach((el) => 
            
            if(operation(el,identity) != el ) return false
        )
        return true
    }
}


