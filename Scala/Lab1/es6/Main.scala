object Main {
  
    def main(args:Array[String]):Unit = {
        val g =new  GoldBach
        val inputList= List(4,6,8,10,12,14,16,18,20)
        val inputList2= List((10,20),(20,30),(40,50))

        inputList.foreach{n=>
            val (a,b) = g.goldbach(n)
            println(f"$n = $a + $b")       
        }

        inputList2.foreach{case (x,y)=>
            
            println(f"Rage[$x,$y] => ${g.goldbachList(x,y)}")
            
        }

    }

}
