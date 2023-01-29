class Gruop[T](override val set :Set[T] , val identity : T , val operation:(T,T)=>T)  extends Monoid[T]( set , identity  , operation) {

     override def toString(): String = {
        import java.lang.StringBuilder

        val sb = new StringBuilder()

        sb.append("GROUP\n")
        
        sb.append("SET = "+set+"\n")
        sb.append("Identity = "+identity+"\n")
        sb.append("Operation = "+ operation.toString()+"\n")
        sb.append("CHECK : "+this.checkMonoid()+"\n")
        sb.toString()

    }
}