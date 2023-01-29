class GoldBach {
  
    def goldbach (n:Int):(Int,Int)= {
        val primeList = genPrimeList(n)
        //println(primeList)
        (for (i <- primeList ; j <- primeList   ;if (i + j == n)) yield (i,j))(0)

    }

    def goldbachList (n:Int,m:Int)= {
        val l = List.range(n,m+1).toList.filter(x => x%2 ==0)
        val y = for(x<- l ) yield goldbach(x)
        
        y
    }

    def genPrimeList(n:Int):List[Int] = {
        List.range(2,n).toList.filter(p => isPrime(p))        
    }

    def isPrime(p:Int):Boolean= {
        def inner(n:Int,d:Int) : Boolean = {
            d match{
                case `n` => true
                case d if(n%d == 0)  => false 
                case _ => inner(n,d+1)
        
            }
        }
        inner(p,2)
        
        
    }


}



