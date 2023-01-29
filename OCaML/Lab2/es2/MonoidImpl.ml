
module BoolMonoid : Monoid.Monoid =struct
  type t = bool
  
  let elements =  List.to_seq [true;false]
  let identity = false

  let add = (||)

end ;;




module IntMonoid (N : sig val n : int end) : Monoid.Monoid with type t = int = struct
  

  type t = int
  
  let rec genList acc i n =
    
    if i > n then 
      List.rev acc
    else
    genList (i :: acc) (i+1) n

  ;;

  let elements =  List.to_seq (genList [] 0 N.n )
  let identity = 1

  let add  a b =  (a + b) mod N.n
end;;

