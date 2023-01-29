type intlist =  (* Tipo ricorsivo*)
  |Nil
  |Cons of int*intlist
;;

let rec lenght_intlist = function 
  | Nil -> 0
  | Cons(h,t) -> 1+ lenght_intlist t
;;

type stringlist =  
  |Nil
  |Cons of string*stringlist
;;

(* Dopo aver definito stringlist , bisogna ricreare le funzioni , ma possiamo astrarre il codice , bisogna parametrizzare il tipo della lista*)
type 'a mylist =
  |Nil
  |Cons of 'a * 'a mylist
;;

let rec lenght = function
  |Nil->0
  |Cons(h,t) -> 1+ lenght t
;;
 