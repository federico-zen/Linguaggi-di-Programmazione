module type StackI = sig
  
    type  stack

    exception EmptyStack

    (*Restituisce uno Stack Vuoto*)
    val empty : unit -> stack

    (*Inserisco Un elemnto nello stack e restituisco un nuovo stack*)
    val push : char -> stack -> unit

    (*Rimuovo l'elemento in cima allo stack*)
    val pop : stack -> unit

    (*Restituisco l'elemento in cima allo stakc *)
    val top : stack -> char 

    val to_string: stack ->  string

    val  is_empty  : stack -> bool
   
end