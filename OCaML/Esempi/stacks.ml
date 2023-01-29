
module type StackSig = sig
  type 'a stack

  val empty : 'a stack

  val push : 'a -> 'a stack -> 'a stack

  val peek : 'a stack -> 'a

  val pop : 'a stack -> 'a stack

end


module ListStack : StackSig = struct
  type 'a stack ='a list
;;

let empty = [];;

let push x s = x::s;;

let peek = function
  | [] -> failwith "Empty Stack"
  | x::tl -> x
;;

let pop = function
  | [] -> failwith "Empty Stack"
  |x::tl->tl
;; 

end;;

module MyStack : StackSig = struct
  type 'a stack =
    |Empty
    |Entry of 'a * 'a stack
;;

let empty = Empty;;

let push x s = Entry (x,s);;

let peek = function
| Empty -> failwith "Empty Stack"
| Entry (x,s)-> x
;;

let pop = function
|Empty-> failwith "Empty Stack"
|Entry (x,s)->s
;; 

end;;

let x = ListStack.peek (ListStack.push 42 ListStack.empty);;

(* Posso scriverlo anche come*)

let y = ListStack.(peek (push 42 empty));;

(*oppure*)

let w = 
    let open ListStack in (*Open Locale*)
      empty |> push 42|> peek
;;

open ListStack (*open Globale , ma bisogna stare attenti perche puo  avere shadowing dei nomi *)
let v = empty |> push 42|> peek;;