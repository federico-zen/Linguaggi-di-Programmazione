let rec filter p = function
| [] -> []
| h::tl -> if p h then h::(filter p tl) else filter p tl
;;

let even lst = filter (fun x-> x mod 2 = 0) lst;;

let rec filter_aux p acc = function
| [] -> List.rev acc
| h::tl -> 
  filter_aux p (if p h then h::acc else acc) tl
;;

let rec filter p lst = filter_aux p [] lst;;