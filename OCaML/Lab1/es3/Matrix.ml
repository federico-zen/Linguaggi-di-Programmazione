(*
  Write the matrix datatype with the following operations:

    1)A function zeroes to construct a matrix of size n×m filled with zeros.
    2)A function identity to construct the identity matrix (the one with all 0s but the 1s on the diagonal) of given size.
    3)A function init to construct a square matrix of a given size n filled with the first n×n integers.
    4)A function transpose that transposes a generic matrix independently of its size and content.
    5)The basics operators + and * that adds and multiplies two matrices non necessarily squared.
   
*)

module  Matrix =
  struct 
    type matrix  = (int list) list 

  let zeroes (n : int ) (m : int) : matrix =
    List.init n (fun i -> List.init m (fun j -> 0));; (* List.init n° elementi (funzione per ogni elemento )*)
  
  let identity (n:int)  : matrix =
    List.init n (fun i -> List.init n (fun j -> if i = j then 1 else 0));;
   
  let init  (n :int) : matrix =
    List.init n (fun i -> List.init n (fun j -> i*n+j+1 ));;
  
  let transpose (m : matrix) : matrix =
    List.init (List.length (List.hd m)) (fun i -> List.init (List.length m) (fun  j -> List.nth  (List.nth  m j) i )) ;;
  

  (*
  Soluzione Prof
    (*https://stackoverflow.com/questions/29607384/tranpose-a-list-list-in-ocaml*)

    let rec transpose (m:matrix) : matrix=
      match m with
      | [] -> []
      |  []::xss -> transpose xss
      | (x::xs) ::xss -> (x :: List.map List.hd xss) :: transpose (xs :: List.map List.tl xss)
    ;;
  *)

  (* funzione usata per vedere se due matrici sono sommabili tra di loro*)
  let summable (m : matrix) (m2 : matrix) : bool = 
    
    if((List.length m = List.length m2) && (List.length (List.hd m) = List.length (List.hd m2))) then true else false
  ;;
(* funzione usata per vedere se due matrici sono moltiplicabili tra di loro*)
  let multiplicable (m : matrix) (m2 : matrix) : bool =
    if ((List.length m) = (List.length (List.hd m2))) then true else false
  ;;

  let (+) (m : matrix) (m2 : matrix): matrix=
    if (summable m m2) then
      List.map2 (fun x y -> List.map2 (fun a b -> a+b) x y ) m m2
    else
      raise (Invalid_argument "Non Sommabile")
  ;;

  (*
   (* Somma prodotto dei due vettori*)
  let s_prod xs ys = 
    let rec dot_prod res xs ys =
      match xs,ys  with
      | x::xs , y::ys -> (dot_prod(res + x *y) xs ys)
      | _,_ -> res
    in 
    dot_prod 0 xs ys;;

 
  let ( * ) (m : matrix) (m2 : matrix) : matrix = (* DA RIVEDERE*)
  if (multiplicable m m2) then
    
    let rec mat_prod arows brows =
      let cols = transpose brows in 
        List.map( fun row -> List.map (s_prod row) cols) arows
    in mat_prod m m2

  else
    raise (Invalid_argument "Non Moltiplicabile")
  ;;
*)

let ( * ) (m : matrix) (m2 : matrix) : matrix = init 4;;

    



end;;