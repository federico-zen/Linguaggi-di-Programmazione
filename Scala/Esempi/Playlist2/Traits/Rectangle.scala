class Rectangle(var width:Double,var height:Double) extends  Polygon with Shape{ 

    override def area:Double=width*height

    override def color: String = "Blue"
    
}