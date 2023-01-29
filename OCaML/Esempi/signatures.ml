module type Fact = sig
    
  (*Fact n -> fattoriale di n*)
  val fact : int->int
    

end

module RecursiveFact : Fact = struct

    let rec fact n = 
      if n = 0 then 1 else
        n * fact (n-1)
      

end

(*module NotFact : Fact = struct
  let inc x = x+1
end*) (*Da Errore perchè non rispetta interfaccia*)

module TailRecoursiveFact : Fact= struct
  let rec fact_aux n acc = 
    if n = 0 then acc else
      fact_aux (n-1) (n*acc)
  
  let fact n = 
      fact_aux n 1
end

let x = TailRecoursiveFact.fact 10;; (*Non posso usare TailRecoursiveFact.fact_aux perche è nascosta nel modulo , non è pubblica*)
