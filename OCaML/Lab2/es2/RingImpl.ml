module ZeroRing : Ring.Ring with type t = int = struct
  type t = int
  

  let elements =  List.to_seq ([0] )
  let identity = 0

  let add a b  = 0+0

  let mul a b = 0*0

end;;

module IntRing (N : sig val n : int end) : Ring.Ring   with type t = int = struct
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

  let mul a b = (a*b) mod N.n

end;;