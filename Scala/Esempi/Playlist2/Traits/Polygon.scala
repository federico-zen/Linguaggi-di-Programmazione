// ****Compile the subclasses first****

//Abstract class is a class that cannot be istantiated. I need to create a subsclass and than instantiate it.

//I can extends only 1 class , cannot do extends C1,C2

//Interface describe a set of methods and propreties that class have to implements

//Traits are partialli implemented intefaces

trait Shape{//At least one method must be abstract

    def color:String;

}

abstract class Polygon{

    //Abstract Method
    def area:Double;

}


object Polygon{

    def main(args:Array[String]):Unit = {

        var rect = new Rectangle(2.0,5.0);
        print("Rectangle :")
        printArea(rect)
        println(rect.color)

        var tria = new Triangle(2.0,5.0);
        print("Triangle :")
        printArea(tria)
          println(tria.color)


    }

    def printArea(p:Polygon):Unit={
        println(p.area)
    }

    

}