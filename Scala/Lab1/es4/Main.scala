object Main{

    def main(args:Array[String]):Unit = {
        val booleanMonoid = new  Monoid[Boolean](Set(true,false),false,(a,b) => a||b)
        println(booleanMonoid.toString())

        val integerMonoid = new  Monoid[Int]((List.range(0,10).toSet) ,0,(a,b) => a+b%10)
        println(integerMonoid.toString())

        val integerGruop = new  Gruop[Int]((List.range(0,10).toSet) ,0,(a,b) => a+b%10)
        println(integerGruop.toString())

        val integerRing= new  Ring[Int]((List.range(0,10).toSet) ,0,(a,b) => a+b%10,(a,b)=>(a*b )%10)
        println(integerRing.toString())
    }

}
