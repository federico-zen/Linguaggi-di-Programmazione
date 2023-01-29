// ****Compile the subclasses first****

//Abstract class is a class that cannot be istantiated. I need to create a subsclass and than instantiate it.

abstract class Polygon{

    //Abstract Method
    def area:Double;

}


object Polygon{

    def main(args:Array[String]):Unit = {

        var rect = new Rectangle(2.0,5.0);
        print("Rectangle :")
        printArea(rect)

        var tria = new Triangle(2.0,5.0);
        print("Triangle :")
        printArea(tria) 


    }

    def printArea(p:Polygon):Unit={
        println(p.area)
    }

}