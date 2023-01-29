/*
    squared_numbers that removes all non-numbers from a polymorphic list and returns the resulting
        list of squared numbers, e.g., squared_numbers(1 :: "hello" :: 100 :: 3.14 :: ('a'::10::Nil)
        :: 'c' :: (5,7,'a') :: Nil) should return List(1, 10000, 9.8596, List(100), (25,49)).
        Note that it recursively applies to substructures.

    intersect that given two generic lists, returns a new list that is the intersection 
        of the two lists (e.g., intersect(List(1,2,3,4,5), List(4,5,6,7,8)) should 
        return List(4,5)).

    symmetric_difference that given two lists, returns a new list that is the
        symmetric difference of the two lists. 
        For example symmetric_difference(List(1,2,3,4,5), List(4,5,6,7,8)) should return 
        List(1,2,3,6,7,8).
*/

class Comprehensions{

    def squared_numbers(lst:List[Any]):List[Any] = {
        //Return the square of the value or None 
        def inspector(e:Any) : Any = {
            e match{
                case i:Int => i*i
                case f:Float => f*f
                case d:Double => d*d
                case x:List[Any] => squared_numbers(x)
                case tuple:Product => squared_numbers(tuple.productIterator.toList)
                //case (a:Int,b:Int,_ ) => (a*a,b*b)
                case _ => None
            }
        }

        //For - Comprehensions
        for (el <- lst if(!inspector(el).equals(None))  ) yield inspector(el)
        
    }

    def intersect(l1:List[Int],l2:List[Int]):List[Int] = {
        for(
            x <- l1 
            if(l2.contains(x)) 
        ) yield x 
    }

    def symmetric_difference(l1:List[Int],l2:List[Int]):List[Int]={

        (for(
            x <- l1 
            if(!l2.contains(x)) 
        ) yield x) ::: (for(
            y <- l2 
            if(!l1.contains(y)) 
        ) yield y )

          
        
    }


}

object  Comprehensions{
    def main(args:Array[String]):Unit ={
        val c = new Comprehensions()
        val list = 1 :: "hello" :: 100 :: 3.14 :: ('a'::10::Nil) :: 'c' :: (5,7,'a') :: Nil         
        
        println(c.squared_numbers(list))
        
        val intersected =c.intersect(List(1,2,3,4,5), List(4,5,6,7,8))
        println(intersected)

        val symmetricDiff = c.symmetric_difference(List(1,2,3,4,5), List(4,5,6,7,8))
        println(symmetricDiff)
    }

}
