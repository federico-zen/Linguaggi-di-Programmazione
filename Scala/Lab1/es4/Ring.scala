class Ring[T](override val set :Set[T] , override val identity : T ,override val operation:(T,T)=>T,val mul : (T,T)=>T)  extends Gruop[T]( set , identity  , operation) {
     
     override def toString(): String = {
        import java.lang.StringBuilder

        val sb = new StringBuilder()

        sb.append("RING\n")
        
        sb.append("SET = "+set+"\n")
        sb.append("Identity = "+identity+"\n")
        sb.append("Add = "+ operation.toString()+"\n")
        sb.append("Mul = "+ mul.toString()+"\n")
        sb.append("CHECK : "+this.checkMonoid()+"\n")
        sb.toString()

    }
}
