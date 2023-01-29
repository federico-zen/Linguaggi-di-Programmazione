import scala.util.parsing.combinator._
import scala.util.matching.Regex
import scala.math._
import scala.collection.mutable.HashMap

class Calculator extends JavaTokenParsers {
    private val memory = new Memory()

    def expr:Parser[Double] = (variable ~ ("=" ~> expr) ^^ { 
                                case x ~ v => memory.setVariable(x,v)
                                println(memory.toString)
                                v
                            }  
                            |  term ~ dualOp ~ expr ^^ {
                                case n ~ op ~ n2  => 
                                    op match {
                                        case "+" => n+n2
                                        case "-" => n-n2
                                        case "*" => n*n2
                                        case "/" => n/n2
                                        case "^" => pow(n,n2)
                                    }
                                }
                               | term 
                            )      
                                   
                                
    def variable = ("[ABCDEFGHILMNOPQRSTUVZ]".r) 
    
    
    def term:Parser[Double] =(  value
                | singleOp
                | variable ^^ {variableName => memory.getValue(variableName) }
                | "(" ~> expr <~ ")"
                
    )
                 

    def singleOp:Parser[Double] = (("sin"|"cos"|"sqrt") ~ term) ^^ { case op ~ number =>
            op match {
                case "sin" => sin(number)
                case "cos" => cos(number)
                case "sqrt"=> sqrt(number)
            }        
    }

    def value:Parser[Double] = wholeNumber^^{_.toDouble}

    def dualOp = """[\+\-\*\/\^]""".r

    def eol = "\n" | "\r\n"
}

object Calculator{
    def main(args:Array[String]) : Unit  = {
        val fileList = List("input1.txt")
        val c = new Calculator

        fileList.foreach {
            filename => 
                val file = scala.io.Source.fromFile(filename).getLines()
                file.foreach( line => 
                    c.parseAll(c.expr,line)match{
                        case c.Success(r,_) => println("Risultato: "+r)
                        case x => println(x)
                    } 
                )

        } 

    }

}
