import payroll.api._
//import payroll.api.DeductionsCalculator._
import payroll._
import payroll.Type2Money._
import  scala.language.postfixOps


/*object MainWithoutDLS {

    def main(args:Array[String]):Unit = {

        val buck = Employee(Name("Buck","Trends"),Money(80000))
        val jane = Employee(Name("Jane","Doe"),Money(90000))

        List(buck,jane).foreach{
            employee=> 
                val biweeklyGross = employee.annualGrossSalary / 26

                val deductions = federalIncomeTax(employee,biweeklyGross) + 
                            stateIncomeTax(employee,biweeklyGross) +
                            insurancePremiums(employee,biweeklyGross)+
                            retirementFundContributions(employee,biweeklyGross)
                
                val check = Paycheck(biweeklyGross,biweeklyGross-deductions,deductions)

                print(f"${employee.name.first} ${employee.name.last}: ${check}\n" )
        }


    }

}*/

import payroll.dsl._
import payroll.dsl.rules._

object MainWithDLS {

    def main(args:Array[String]):Unit = {

        val payrollCalculator = rules { employee => 
            employee salary_for 2.weeks minus_deductions_for { gross =>
                federalIncomeTax            is (25.0 percent_of gross)
                stateIncomeTax              is (5.0 percent_of gross)
                insurancePremiums           are (500.0 in gross.currency)
                retirementFundContributions are (10.0 percent_of gross)

            }    
        }


        val buck = Employee(Name("Buck","Trends"),Money(80000))
        val jane = Employee(Name("Jane","Doe"),Money(90000))

        List(buck,jane).foreach{
            employee=> 
                val check = payrollCalculator(employee)
                print(f"${employee.name.first} ${employee.name.last}: ${check}\n" )
        }


    }

}
