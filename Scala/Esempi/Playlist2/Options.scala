object Options{

    val list = List(1,2,3)
    val map = Map(1->"Tom",2->"Max")
    val opt : Option[Int] = None
    
    def main(args:Array[String]):Unit = {

        println(list.find(_>6)) //none

        println(list.find(_>2).get) //Some(3).get =3
        //If i do get on a None element , i get an Exception to avoid it we can use getOrElse

        println(list.find(_==6).getOrElse("Not Found"))

        println(map.get(1))//Some("Tom")

        println(opt.isEmpty)

    }

}