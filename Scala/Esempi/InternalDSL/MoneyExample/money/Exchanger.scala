package money



case class Exchanger(rates:Rates){

    def rate(from:Currency,to:Currency):Rate=
        if(from == to) 1 
        else
            rates(Conversion(from,to))
}
