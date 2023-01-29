package payroll
case class  Paycheck (gross:Money,net:Money,deductions : Money){

    def pulsGross(m:Money) = Paycheck(gross+m,net+m,deductions)
    def plusDeductions(m:Money) = Paycheck(gross,net-m,deductions+m)

}

case class Name(first:String,last:String)
case class Employee(name:Name,annualGrossSalary:Money)