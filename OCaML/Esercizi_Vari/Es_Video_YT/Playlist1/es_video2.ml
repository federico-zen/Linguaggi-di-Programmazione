[];; (** Empty List*)

"Hello" :: "World" :: [];; (* Lista Stringhe *)

("Gianni",654) :: ("John",432) :: [];; (* Lista Tuple*)

let int_list = [2;3;4];;
let int_list = 1::int_list;;

(* Pattern Matching *)


(* Es 1: Funziione che restituisce true se tutti gli elementi di una lista sono true*)

let rec all_true (lst : bool list) : bool =
  match lst with
  | [] -> true
  | x ::[]  -> if x == true  then true else false
  | x :: rest -> x && all_true rest
;;

(* ES 2 : Funzione even2ways che vede se la lista contiene solo nuemri pari and ha numero pari di elemetni*)

let even x = x mod 2= 0;;

let rec even2ways (lst : int list ): bool = 
  match lst with
  | [] -> true
  | x::[] -> false (* Perche è un solo elemento*)
  | x1::x2::rest -> even x1 && even x2 && even2ways rest 
;;

(* Es 3 is_empty : Write a function that returns true if the list is empty and false otherwise *)

let is_empty (lst : 'a list) : bool = 
    match lst with
    |[] -> true
    | _ -> false
;;


(* Exception*)
(* Es 4 restituire il primo elemento della lista*)

let head (lst : 'a list) : 'a =
  match lst with 
  | x :: rest-> x (* Posso scrivere anche x::_ perche non mi serve rest*)
  | [] -> raise (Invalid_argument "head") 
;;

(*-------------------------*)
(*Es 1 Scrivere una funzione che fa la somma di tutti gli elementi di una lista*)

let rec add(lst : int list) (acc:int) :int = (*Mia soluzione*)
  match lst with 
  | [] -> 0
  | x::rest -> acc+x + add(rest)(acc)
;;

let rec  sum (lst : int list ):int = (*Soluzione del tizio su YT (narlock)*)
  match lst with
  |[] -> 0
  | x::rest -> x + sum rest
;;

(*Es 2 scrivere una funzione che trova il piu piccolo della lista*)

let rec min (lst :'a list) : 'a =
  match lst with 
  | [] -> raise (Invalid_argument "minimum -> []")
  | x::[] -> x
  | x:: rest -> if (x < min rest) then x else min rest
;;   

(* Es 3 Function che appende 2 list into one*)

let rec append (xs : 'a list) (ys: 'a list) : 'a list =

  match xs with
  | [] -> ys
  | x::[] -> x :: ys
  | x :: rest -> x :: (append rest ys)
;;

(* Es 4 Scrivere una funzione che dice se un valore è nella lista o no*)


let rec find (lst : 'a list)(e : 'a) : bool =
  match lst with
  | [] -> false
  | x :: rest -> x == e || find rest e
;;

(* Es 5 Scrivere una funzione che usa la string concat (^) e aggiungere un ! alla fine di ogni stringa in una list*)

let rec esclamativo (lst : string list) : string list = 
  match lst with
  |[] -> []
  | x ::[] -> (x^"!") ::[]
  | x:: rest -> (x^"!") :: esclamativo rest
;;

(*Es 6  Srivere una funzione che computa la lunghezza di una stringa data in input . Restituisce una tupla  con str e lunghezza*)

let rec lenght_of_pairs(lst : string list ) : (string * int) list= 

  match lst with
  | [] -> []
  | x::[] -> (x,(String.length x)) :: [] (* Potrei non metterlo perche è coperto dalla riga sotto*)
  | x:: rest -> (x,(String.length x)) :: lenght_of_pairs rest

;;

(* Es 7 Scrivere una funzione che prende una lista di coppie e la scompatta in una coppia di liste*)

let rec unzip (lst : ('a * 'b) list) : ('a list * 'b list)= 
  match lst with
  | [] -> ([],[])
  | (x,y):: [] -> (x::[],y::[]) 
  | (x,y):: rest -> (x::(fst (unzip rest)),y::(snd (unzip rest)))


;;


