let double x =  x*2;;

let square x = x*x;;

let quad x = 4*x;;

let quad' x = double (double x);;

let quad'' x = x |> double |> double;; (*Uso pipeline*)

let fourth x = x*x*x*x;;

let fourth' x = square(square x);;


(*prende una funzione e un argomento , e la applica 2 volte su x *)
let twice f x = f (f x);; 

(*Prende la funzione double e la passa come parametro*)
let quad''' x = twice double x;; 
let fourth'' x = twice square x;; 

(* Funziona comunque e definisce quad'''' come l'applicazione di twice double*)
let quad''''  = twice double ;;
