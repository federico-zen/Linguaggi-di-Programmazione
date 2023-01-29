module type Tree = sig
  
    type 'a tree

    val empty : unit -> 'a tree

    val add : 'a  -> 'a tree -> 'a tree

    val size : 'a tree -> int

    val tree_from_lst : 'a list -> 'a tree

    val to_string : 'a tree -> ('a -> string) -> string

    val to_pretty_string : 'a tree -> ('a -> string) -> string
end