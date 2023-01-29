object Main {
    def main(args:Array[String]) : Unit = {
        val m = new Matrix(5,2,List(0,1,2,3,4,5,6,7,8,9))
        val m2 = new Matrix(5,2,List(0,1,2,3,4,5,6,7,8,9).reverse)

        println("m\n"+ m)
         println("m2\n"+ m2)

        println("Equals m1 == m2?:\n"+ m.equals(m2))
        println("Copy m in m2:\n" + m.copy(m2))

        val res = m+m2
        println("Plus: m+m2:\n"+ res)

        println("Transpose of m:\n" +m.transpose())
        
    }
}
