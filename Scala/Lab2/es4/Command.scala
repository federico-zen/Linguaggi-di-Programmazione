sealed trait Command //Exhaustive checking , all the members are in this file
case class  IncrementPointer() extends Command
case class  DecrementPointer() extends Command
case class  IncrementData() extends Command
case class  DecrementData() extends Command
case class  Print() extends Command
case class  Input() extends Command
case class  PrintState() extends Command
case class  Loop(expressions : List[Command]) extends Command
case class  Program(expressions : List[Command]) extends Command