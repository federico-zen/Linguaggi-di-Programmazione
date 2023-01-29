package  object money{

    type Amount = BigDecimal
    type Rate = BigDecimal
    type Rates = Map[Conversion,Rate]

    implicit class IntOps(private val x:Int) extends AnyVal {
        def apply(c:Currency) : Money = Money(x,c)
    }

    implicit class DoubleOps(private val x:Double) extends AnyVal {
        def apply(c:Currency) : Money = Money(x,c)
    }

    implicit class BDOps(private val x:BigDecimal) extends AnyVal {
        def apply(c:Currency) : Money = Money(x,c)
    }
    
}