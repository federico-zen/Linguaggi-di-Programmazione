import scala.collection.immutable.StringOps

class KWIC{

    val irrilevant = List("the","for","of","to","but","over","about")

    def calculateKwic(titles : Iterator[String]) ={
        titles
            .zipWithIndex
            .map(
                {case (title,index) => explode_title(title,index) }
            )
            .flatten
            .toList
            .sortWith((t1,t2) => t1.substring(39) < t2.substring(39))
    }

    def explode_title(title:String, index:Int) ={
        
        val title_words = title.split(" ")

        (0 to title_words.size-1)
            .filter(pos => !irrilevant.contains(title_words(pos).toLowerCase))
            .map(pos => title_words.splitAt(pos))
            .map(
                {case (l,r) =>(l.mkString(" ") , r.mkString(" "))})
            .map({case (l,r) => f"${index+1}%4d ${l.substring(Math.max(l.length(),33)-33)}%33s ${r.substring(0,Math.min(r.length(),40))}%-40s" }) //fstring per formattare le stringhe
    }



}

object KWIC{

    def main(args:Array[String]):Unit = {
        println("KWIC INDEXING")

        val kwic = new KWIC()
        args.foreach { (filename) =>
            val titles = scala.io.Source.fromFile(filename).getLines()
            val kwic_index = kwic.calculateKwic(titles)
            kwic_index.foreach(println)
        }


    }

}

