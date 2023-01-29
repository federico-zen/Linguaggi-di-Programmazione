package payroll
import java.math._
import scala.language.implicitConversions

object Type2Money{
    implicit def bigDecimal2Money  (b:BigDecimal) = Money(b)
    implicit def double2Money  (d:Double) = Money(d)
    implicit def long2Money  (l:Long) = Money(l)
    implicit def Int2Money  (i:Int) = Money(i)
}

class Money(val amount: BigDecimal) {
    def + (m: Money) = Money(amount.add(m.amount))

    def - (m: Money) = Money(amount.subtract(m.amount))

    def * (m: Money) = Money(amount.multiply(m.amount))

    def / (m: Money) = Money(amount.divide(m.amount, Money.scale, Money.roundingMode))

    def < (m: Money) = amount.compareTo(m.amount) < 0

    def <= (m: Money) = amount.compareTo(m.amount) <= 0

    def > (m: Money) = amount.compareTo(m.amount) > 0

    def >= (m: Money) = amount.compareTo(m.amount) >= 0

    override def hashCode = amount.hashCode * 31

    override def toString = String.format("$%.2f", double2Double(amount.doubleValue))

    override def equals (o: Any) = o match {
        case m: Money => amount equals m.amount
        case _ => false
    }

}

object Money {
    def apply(amount: BigDecimal) = new Money(amount)

    def apply(amount: Double) = new Money(scaled(new BigDecimal(amount)))

    def apply(amount: Long) = new Money(scaled(new BigDecimal(amount)))

    def apply(amount: Int) = new Money(scaled(new BigDecimal(amount)))

    def unapply(m: Money) = Some(m.amount)
        protected def scaled(d: BigDecimal) = d.setScale(scale, roundingMode)

    val scale = 4; 
    val roundingMode = RoundingMode.HALF_UP
    val context = new MathContext(scale, roundingMode)
}
