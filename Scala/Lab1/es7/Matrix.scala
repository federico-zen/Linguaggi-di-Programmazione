//Missing : Multiplication , Norm

class Matrix( val row : Int ,  val col:Int) {

    //Aux Costructor
    def this(row:Int,col:Int,values:List[Int])={
        this(row,col)
        
        values.length match {
            case x if (x == (col*row) ) => 
                for(i <- 0 to row -1) {
                    for (j <-0 to col-1) {
                        matrix(i)(j) = values(j + ((i*col)))
                    } 
                }
            
            case _ => throw new IllegalArgumentException
        }

    }

    //Internal Rappresentation
    private val matrix:Array[Array[Int]] = Array.ofDim[Int](row,col)
    
    def copy(than:Matrix) : Matrix = {

        (than.row,than.col) match{
            case (this.row,this.col) =>
                for(i <- 0 to this.row -1) {
                        for (j <-0 to this.col-1) {
                            than.matrix(i)(j) = this.matrix(i)(j)
                        }    
                    }
                than
            case _ => throw new IllegalArgumentException

        }

    }

    def +(than:Matrix):Matrix = {
        (than.row,than.col) match{
            
            case (this.row,this.col) =>
                var ris = new Matrix(this.row,this.col)
                for(i <- 0 to this.row -1) {
                        for (j <-0 to this.col-1) {
                            ris.matrix(i)(j)=than.matrix(i)(j) + this.matrix(i)(j)
                        }    
                    }
                ris
            case _ => throw new IllegalArgumentException

        }
    }



    override def equals(x: Any): Boolean = {
        x match {
            case m : Matrix=>
                var result = true
                if(m.col ==this.col && m.row == this.row){
                    for(i <- 0 to this.row -1) {
                        for (j <-0 to this.col-1) {
                            if(this.matrix(i)(j) != m.matrix(i)(j) ) {
                              result = false
                            }
                        }    
                    }
                    
                }else{
                    result = false
                }

                result

            case _ => false
        }
    }


    def transpose():Matrix ={
        var ris = new Matrix(this.col,this.row)
        for(i <- 0 to this.row -1) {
            for (j <-0 to this.col-1) {
                ris.matrix(j)(i) = this.matrix(i)(j)
            }    
        }

        ris


    }



    override def toString(): String = {
        
        val sb = new StringBuilder
        
        for (i <- 0 to row-1 ) {
            sb.append("|")
            for (j<-0 to col-1){
               sb.append(f" ${matrix(i)(j)} ")
            }
            sb.append("|")
            sb.append("\n")
        }
       
        sb.toString

    }

}
