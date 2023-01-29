package money

case class Money(amount:Amount,currency:Currency){

    def +(that :Money)(implicit exchanger:Exchanger):Money =  performOp(that,_+_)
    
    def -(that :Money)(implicit exchanger:Exchanger):Money = performOp(that,_-_)

    def * (thatAmount:Amount):Money = Money(thatAmount*amount,currency)
    def / (thatAmount:Amount):Money = Money(thatAmount/amount,currency)

    def to(thatCurrency:Currency)(implicit exchanger:Exchanger):Money = {
        val rate : Rate = exchanger.rate(currency,thatCurrency)
        Money(this.amount*rate,thatCurrency)
    }

    private def performOp(that:Money,op:(Amount,Amount)=>Amount)(implicit exchanger:Exchanger):Money = {
        val rate :Rate = exchanger.rate(that.currency,this.currency)
        Money( op(amount,that.amount*rate),currency)
    }


    override def toString(): String = 
        f"Amount: $amount ,Currency: $currency"

}
/*
    What Makes Scala DSL-Friendly language
    1. Symbols As Methods
    2. Optional dots an parents for 0 or 1 parameters
    3. Implicits
    4. Extensions usin implicits
    5. Function Like sintax for apply methods
*/
