(*High order function sono delle funzioni che prendono come argomento delle funzioni e restituiscono il risultato usando quella funzione*)

(*List.map ;; (** Prende una funzione e restituisce una lista*)


# List.filter;; (*Resituisce gli elementi che soddisfano l'espressione*)

#List.fold_left ;; (* Fold sono usate quando si usa un accumulatore , per tenere traccia quando si scorre*)
*)
(* 
  
Map es 1: 
   Srivere una funzione che usa ^ per aggiungere un ! alla fine di ogni stringa di una lista (senza ricorsione) *)

let concat_exlam (s:string) : string =
  s^"!";;

let exited (lst : string list) : string list = 

  List.map concat_exlam lst
;;

(* Map es 2 :
  Scrivere una funzione che mette in capitalizza ogni stringa di una lista 
  usando String.capitalize_ascii   
*)

let cap (lst : string list) : string list =
  List.map String.capitalize_ascii  lst 
;;



(* Map es 3 : Scrivere una funzione che fa il quadrato i ogni elemetno*)

let square_list (lst : int list) : int list =
  List.map (fun x -> x*x) lst 
;;

(* Filter es 1 : Scrivere una funzione che restituisce solo gli intereri odd in una lista*)


let odd_list (lst : int list ) : int list = 

  List.filter (fun x -> if x mod 2 == 1 then true else false) lst
;;

(* FIlter es 2 : Scrivre una funzione che restituisce le stringhe capitalizzate di una lista*)

let check_cap (str : string) : bool =
  if String.get  str 0 = Char.uppercase_ascii (String.get str 0) then true else false 
;;

let filter_cap_string (lst : string list ) : string list =

  List.filter check_cap lst

;;

(* Fold analizza ricorsivamente la struttura e recombina il risultato di chiamare ricorsive per costruire un risultato e restituirlo*)

(* Fold es 1 : Funzione che somma tutti i valori di una lista*)

let add (x:int) (y:int) : int = x+y ;;

let suml (lst : int list ): int =
  List.fold_left( + ) 0 lst (* + è l'operatore o posso definire una funzione add*)
;;

(* 
  # fold_left (+) 0 [1;2;3];;
  = fold left (+) (0+1) [2;3]
  =fold_left (+) ((0+1)+2) [3]
  = fold_left (+) (((0+1)+2)+3) []   
  = (((0+1)+2)+3)
  =6

  *)

  let sumr (lst : int list ): int =
    List.fold_right( + )  lst 0  (*con fold right devo invertire la lista e l' accumulatore*)
  ;;

  (* Fold Es 2 : Scrivere una funzione senza ricorsione che prende una lista e restituisce la linghezza*)


let f (lenght_sofar:int) (x : 'a) =
  lenght_sofar +1
;;

let length (lst : 'a list) : int = 
  List.fold_left (f) 0 lst
;;
  
(*Fold Es 3 Restituisce la somma dei numeri in posizione pari*)

let sum_event (lst:int list):int  = 
  let func (sum,position)(element) = 
    if position mod 2 == 0 then
      (sum + element,position+1)
    else (sum,position+1)
  in

 match  List.fold_left func (0,0) lst with
 | (sum,position) -> sum

;;

(* ---------------------*)
(* Minuto 40.21*)
(* Es 1 : pruduct f la funzione deve moltiplicare tutti i numeri in un lista di float*)

let mult (x:float) (y : float):float = x *. y;;

let productf (lst : float list) : float =
  List.fold_left mult 1.0 lst
;;

(*Es 2 : Find the smallest element in a list*)

let minimum (lst : 'a list) : 'a = 
  let f min_sofar element = 
    if element > min_sofar 
      then min_sofar
   else element
  in
  match lst with
  |[] -> raise (Invalid_argument "minimun")
  | e :: rest -> List.fold_left (f) (e) lst
;;

(* Es 3 Funzione che aggiunge una stringa di input alla fine di ognis tringa della lista*)

let suffix (lst : string list) (s:string) : string list = 

  List.map (fun x -> x^s) lst


;;