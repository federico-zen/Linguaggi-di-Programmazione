// ****Compile the subclasses first****
class Polygon{

    def area:Double=0.0; //default value


}


object Polygon{

    def main(args:Array[String]):Unit = {

        var poly = new Polygon;
        print("Poly :")
        printArea(poly)

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