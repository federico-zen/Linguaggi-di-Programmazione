import scala.language.implicitConversions
import scala.collection.mutable.HashMap

object Calculator {
  

    //Memory for Variable
    object VariableMemory {

        private val map = new HashMap[Variable,Term]()

        def setVariable(v:Variable,t:Term) = {
            map.addOne(v,t)
        }

        def getVariable(v:Variable):Term = {
                map.get(v).getOrElse(throw new ArithmeticException)

        }

        override def toString(): String = f"${map.toString()}"


    }

   

    case class  Term(n:Double) {

        def +(n2:Term) = Term(this.n+n2.n)
        def -(n2:Term) = Term(this.n-n2.n)
        def *(n2:Term) = Term(this.n*n2.n)
        def /(n2:Term) = Term(this.n/n2.n)
        def ^(n2:Term) = Term(math.pow(this.n, n2.n))

        override def toString(): String ="Term:"+n 
    }

    case class Variable(s:String) {


        def ==>(t:Term) = {

            VariableMemory.setVariable(this,t)
            t.n
        }

    }



    object Conversions{

        implicit def IntToIntNumber(i:Int) = new Term(i)

        implicit def DoubleToTerm(d:Double) = new Term(d)

        implicit def StringToVariable(s:String) = new Variable(s)

        implicit def VariableToTerm(v:Variable) = VariableMemory.getVariable(v)
        

    }


    def sin(number:Term) = {  new Term(math.sin(number.n)) }
    def cos(number:Term) = {  new Term(math.cos(number.n)) }
    def sqrt(number:Term) = {  new Term(math.sqrt(number.n)) }
    def tan(number:Term) = {  new Term(math.tan(number.n)) }

}