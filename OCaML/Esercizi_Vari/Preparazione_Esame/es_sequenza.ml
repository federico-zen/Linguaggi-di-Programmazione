(*
"dato una lista di interi, una sequenza è data da numeri consecutivi nella lista e si chiude con uno o più zeri. Restituire una lista con le somme delle sequenze"

Tipo per [1, 2, 3, 0, 4, 5, 0, 0, 6, 0] deve restituire [6, 9, 6]
   
*)

let seq lst =
  let rec sum_seq acc sum = function
  | [] -> acc 
  | x :: tl ->  begin
    if x = 0  then match sum with
    | 0 ->  sum_seq (acc) 0 tl 
    | y -> sum_seq (sum ::acc) 0 tl 
      
    else
      sum_seq acc (sum+x) tl
    end

  in sum_seq [] 0 lst
;; 

let x = [1;2;3;0;4;5;0;0;6;0];;

seq x ;;