import scala.util.parsing.combinator._



class ArithmeticParser extends JavaTokenParsers{

    override def skipWhitespace = false

    def operation =  line ~ opt(rep(line)) ~ lastLine ^^ {
        case f~other~last => 
            def evaluateList(lst:List[Any]) : Int = {
                lst match {
                    //case _ => println("ok");1
                    case(x:Int) :: Nil => x 
                    case (x:Int)::(y:String)::(z:Int) :: tl =>
                         y match {
                            case "+" => evaluateList((x+z)::tl)
                            case "-" => evaluateList((x-z)::tl)
                            case "*" => evaluateList((x*z)::tl)
                            case "/" => evaluateList((x/z)::tl)
                         }
                    case _ => throw new IllegalArgumentException()


                }

            }
            evaluateList(List(f,other.get.flatten,last).flatten) 

            
    }

    def line = spaces ~> term ~ (space ~> operator <~ endLine) ^^ {
        case n ~ op => List(n,op)
    }

    def lastLine = spaces ~>term <~ space <~"=" <~ endLine ^^ {case a => List(a)}


    def term = decimalNumber ^^ (_.toInt)

    def spaces = opt(rep(space))
    def space = " "

    def endLine = "\n" |"\r\n"

    def operator = "+" | "-" | "*" | "/"
}

object Arithmetic{

    def main(args:Array[String]) : Unit = {
        val p= new ArithmeticParser()
        val fileList = List("input1.txt","input2.txt","input3.txt") 
        fileList.foreach {(filename) =>
        println("Test from: " + filename)
        val file = scala.io.Source.fromFile(filename)
        val str = file.mkString
        val split = str.split("\n")
        val max = split.maxBy(_.length)
    
        format(str,max)

        p.parseAll(p.operation,str) match {
            case p.Success(r,_) => 
                for(i<-1 to (max.length-2 - r.toString().length )) { print(" ")}
                println(r)
            case x =>println(x)  

        }
        println()
        }

    }

    def format(str:String,max:String) :Unit = {
        print(str)
        for(i<-1 to max.length )  { print("-")}
        println()
    }

}