
//Extending App we hinerith the main method
object ObjectOrientation extends App {
  
    //Class
    class Animal {
        //fields
        val age :Int = 0

        //Methods
        def eat() = println("Eating")
    }

    //Instance
    val anAnimal = new Animal

    //Inheritance
    class Dog(val name:String) extends Animal//Costructor definition
    //to make name "public" i need to add val

    val aDog = new Dog("Gino")

    //sub_type polymorphic

    val aDeclaredAnimal : Animal = new Dog("Hachi")
    aDeclaredAnimal.eat() //the most derived method is called at runtime

    //abstract Class
    //not all fields or methods has to have the implementation

    abstract class WalkingAnimal{
        protected val hasLegs = true //by default public, i can restrict it using priate or protected 
        def walk() : Unit
    }

    trait Philosopher {
        def ?!(thought: String) : Unit
    }

    //Interface = ultime abstract type
    trait Carnivore{
        def eat(animal:Animal):Unit
    }

    class Crocodile extends Animal with Carnivore with Philosopher{
        override def eat(animal:Animal): Unit = println("Eating you , animal")         
    
        override def ?!(thought: String): Unit = println(s"I was thinking: $thought")
    }

    val aCroc = new Crocodile
    aCroc.eat(aDog)
    //the same as 
    aCroc eat aDog //written in infix notation, available only for one argument methods
    aCroc ?! "What the hell is going on?!"

    //Oprator in Scala are Methods
    val n = 1 + 2
    val n1 = 1.+(2) //Stessa cosa

    //Anonymous classes
    //i can declare classes with the provide implementation 
    val dinosaur = new Carnivore{
        def eat(animal: Animal): Unit = println("I am a dinosaur so i can eat everythings")
    }

    //Singleton Object
    //Only instance 
    object MySingleton{

        val mySpecialValue = 12345
        def mySpecialMethod():Int = 12345
        
        def apply(x:Int):Int = x+1
    }
    
    MySingleton.mySpecialMethod()
    MySingleton.apply(65) //is the same as
    MySingleton(65) //Auto call to apply method
    
    object Animal{ //companions  - companion objects same name of existing class
        //companions can access each others private fields or methods
        //singleton and instances of animal , are differents
        val canLiveIndefinirely = false
    }

    val animalsCanLiveForever = Animal.canLiveIndefinirely //Access like static fields/methods in java

    //Case Classes : Lightweight structure
    //The compile create equals and hascode , Serialization , Apply
    case class Person(name:String,age:Int)
    
    //I can cotruct without the keyword new
    val bob = Person("Bob",54) //Person.apply("Bob",54)

    //Exceptions
    //They are special object 
    try {
        //code that cha throw an exception
        val x : String = null
        x.length()
    }catch{
        case e:Exception => "Some Faulty Error Message"
    }finally{
        //Executed at the end
    }

    //Generics

    abstract class MyList[T]{ //I can use the T in the definition of methods
        def head : T
        def tail : MyList[T]

    }

    //using generic with a concrete type
    val aList:List[Int] = List(1,2,3)
    val first = aList.head
    val rest = aList.tail

    /*
    Benefits :
        1) Works nice in ditributed/multithread enviroment
        2) Helps make sense of code
    */

    //Scala il closest to the OO ideal 
        //All the code and methods are in class or objects

}
