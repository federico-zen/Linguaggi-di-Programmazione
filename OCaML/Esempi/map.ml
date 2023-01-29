let rec add1 = function
  |[] ->[]
  | h::tl -> (h+1) :: add1 tl
;;
  let rec concat3110 = function
  |[] ->[]
  | h::tl -> (h^"3110") :: concat3110 tl
;;
  (* Le due funzioni sono strutturalemtne uguali*)

  let rec transform f = function (*è l'implementazione della List.map*)
    |[] -> []
    | h::tl -> (f h) :: transform f tl
;;

let add1' lst  = transform (fun x -> x+1) lst;;

let concat3110' lst  = transform (fun x -> x^"3110") lst;;


let string_list_of_int_list lst = transform string_of_int lst ;;
