module type Set = sig
  
    type 'a set

    val empty : unit -> 'a set

    val add : 'a -> 'a set -> 'a set

    val remove : 'a -> 'a set -> 'a set

    val card : 'a set -> int

    val set_of_lst : 'a list -> 'a set

    val to_string : 'a set ->('a -> string) -> string

end