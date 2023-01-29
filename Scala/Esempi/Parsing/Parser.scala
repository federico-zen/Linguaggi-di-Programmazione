import scala.util.parsing.combinator._


class Parser extends JavaTokenParsers{
	def st = "Hey" ~> "mi" ~> "stampi" ~> "questo?" ~> token ^^{println(_)
    }

	def sm = "Somma" ~> wholeNumber ~("con"~>wholeNumber) ^^{case a~b => 
        //println(a.toInt + b.toInt )
        a.toInt + b.toInt

    }

    def stringa = stringLiteral ^^ {case s => s.toString.substring(1,s.toString.length-1)}

    def token = stringa | decimalNumber  | sm  
}


object Parser {

    def main(args:Array[String]):Unit = {
        
        println("PARSING")
        
        val p = new Parser()
        

        args.foreach { (filename) =>
            val src = scala.io.Source.fromFile(filename)
            val lines = src.mkString

            p.parseAll(p.st,lines)match{
            case p.Success(r,s) => println("ok")
            case x => println("Error",x) 


            }

            
            src.close()

        }
    }

}
