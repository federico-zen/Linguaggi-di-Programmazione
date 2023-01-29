module type Stack = sig
    type 'a stack

    exception EmptyStack

    (*Funzione che restituisce uno stack vuoto*)
    val empty : unit -> 'a stack


    (*Funzione che inserisce un elemento nello stack*)
    val push :  'a stack ->  'a -> 'a stack

    (* funzione che rimuove l'elemeto in cima allo stack e lo rimuove*)
    val pop : 'a stack -> 'a

    (*Funzione che restiuisce l'elemento in cima allo stack senza rimuoverlo*)
    val top : 'a stack -> 'a

    

end