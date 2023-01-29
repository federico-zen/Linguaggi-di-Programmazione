/*
Character	Meaning
    >	increment the data pointer (to point to the next cell to the right).
    <	decrement the data pointer (to point to the next cell to the left).
    +	increment (increase by one) the byte at the data pointer.
    -	decrement (decrease by one) the byte at the data pointer.
    .	output a character, the ASCII value of which being the byte at the data pointer.
    ,	accept one byte of input, storing its value in the byte at the data pointer.
    [	if the byte at the data pointer is zero, then instead of moving the instruction pointer forward to the next command, jump it forward to the command after the matching ] command*.
    ]	if the byte at the data pointer is nonzero, then instead of moving the instruction pointer forward to the next command, jump it back to the command after the matching [ command*.


Program ::= StatementList
StatementList ::= Statement { StatementList }
Statement ::= > | < | + | - | . | , | [ StatementList ] | SpuriousStr
SpuriousStr ::= ... a string composed of chars not in the operator set
*/

import scala.util.parsing.combinator._
import scala.util.matching.Regex
import scala.collection.mutable


object BrainfuckInterpreter{
    def exec(program:Program,env:Enviroment) : Unit = {
        def _exec(expressions:List[Command],env: Enviroment):Unit = {
            expressions.foreach {
                case IncrementPointer() => env.incrementPointer()
                case DecrementPointer() => env.decrementPointer()
                case IncrementData() => env.incrementData()
                case DecrementData() => env.decrementData()
                case Loop(innerExpression) => while (env.get() > 0) _exec(innerExpression,env)
                case Print() => print(env.get().toChar) 
                case PrintState() => println(env.toString)
                case Input() => env.put(Console.in.read())
                case _ => throw new java.lang.IllegalArgumentException

            }
        }
        _exec(program.expressions,env)

    } 

}




object BrainfuckParser extends JavaTokenParsers{

    override protected  val whiteSpace:Regex = """[^><\+\-\[\]\.#,]*""".r

    def program : Parser[Program] = rep(command) ^^ { Program }

    def command : Parser[Command] = ("<" | ">" | "+" | "-" | "." | "#" | "," | loop) ^^ {
        case ">" => IncrementPointer()
        case "<" => DecrementPointer()
        case "+" => IncrementData()
        case "-" => DecrementData()
        case "." => Print()
        case "," => Input()
        case "#" => PrintState()
        case Loop(expressions) =>Loop(expressions)  

    }

    def loop : Parser[Loop] = "[" ~> rep(command) <~ "]" ^^ {Loop}



}




object BrainfuckEvaluator{

    def main(args:Array[String]):Unit = {
                
        
        args.foreach { (filename) =>
            val src = scala.io.Source.fromFile(filename)
            val lines = src.mkString

            BrainfuckParser.parseAll(BrainfuckParser.program,lines)match{
                case BrainfuckParser.Success(r,_) => BrainfuckInterpreter.exec(r,new Enviroment)
                case x => println("ERRORS",x.toString) 
            }
            src.close()
        }
    }

}