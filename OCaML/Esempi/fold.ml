(*Combine ossia combinare gli elementi di una lista*)

let rec combine init op= function (* Chiamate anche Fold*)
| [] ->  init
| h::t -> op h (combine init op t);;

let sum' lst = combine 0 ( + ) lst;; (*Sum*)
let sum' lst = combine "" ( ^ ) lst;; (*Concat*)

(* Fold_right -> li combina da destra a sinistra , applica la funzione agli elementi della lista partendo da destra  
      List.fold_right f [a;b;c] init -> f a(f b (b c init))
   Fold_left Fa la stessa cosa ma partendo da sinitra 
    f (f (f init a) b) c*)

let rec fold_right f lst acc = (* Ricorsiva il coda*)
match lst with
| [] -> acc
| h::t -> f h  (fold_right f acc t)


let rec fold_left f  acc lst =
  match lst with
  | [] -> acc
  | h::t -> fold_left f (f acc h) t
;;