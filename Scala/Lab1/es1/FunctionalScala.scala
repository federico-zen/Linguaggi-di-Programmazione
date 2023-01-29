
class FunctionalScala{
   //Soluzione Prof
   val  is_palidrome = (str:String) => {
      val filtered = str.filterNot(x => List(',','.',';',':',' ','?').contains(x)).toLowerCase()
      filtered.equals(filtered.reverse)
   }

   val is_anagram = (str:String,dict:List[String]) => {
      dict.map(x => x.toSeq.sorted.unwrap)
      .filter(x => x.equals(str.toSeq.sorted.unwrap))
      .lengthIs > 1
   } 

   
   def factors(number:BigInt,start:BigInt = 2,list:List[BigInt]=Nil):List[BigInt] = {
      LazyList.iterate(start)(i=> i+1)
      .takeWhile(n => n <= number)
      .find(n => number % n ==0)
      .map(n => factors(number/n,n, list.appended(n)))
      .getOrElse(list)

   }

   def is_proper(n:Int):Boolean ={
      ((1 until n).collect{case x if n % x ==0 => x}).sum == n

   }


}


object FunctionalScala{
   def main(args : Array[String]):Unit = {

      val fs = new FunctionalScala()

      List("Anna","Do geese see God?","Rise to vote,Sir")
         .map(x => f"[is_palindrome] $x :- ${fs.is_palidrome(x)}\n").foreach(print(_))
   
      val dict = List("tar","rat","arc","car","elbow","below","cat","act","inch","chin")
      
      List("rat","cat","elbow")
         .map(x => f"[is_anagram] $x :- ${fs.is_anagram(x,dict)}\n").foreach(print(_))
   

      List(25,400,1000,29231,42,32,523,7)
         .map(x => f"[factors] $x :- ${fs.factors(x)}\n").foreach(print(_))
      
      List(28,6,7,100,496)
         .map(x => f"[is_proper] $x :- ${fs.is_proper(x)}\n").foreach(print(_))
   

   }
}
