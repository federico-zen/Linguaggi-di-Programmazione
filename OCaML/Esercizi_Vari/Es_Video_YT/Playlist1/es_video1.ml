(*Esercizio 1
  Funzione che prende r e calcola l'area del cerchio   

*)

let area(r:float):float = r*.r*.3.14 ;;


(*Esercizio 2
  funzione che prende n e un float x e restituisce x^n    
*)

let rec power(n:int)(x:float) : float = 
  if n ==0 then 1.0 else
  x *. power(n-1) x ;; 

let square (x:float) = power 2 x;;

(* Esercizio 3
    gcd che computa il gratest common divisor di due integer positivi
*)

(* 12 8 the gcd = 4*)

let gcd (x:int)(y:int) : int = 
  let min =  if x <y then x else y 
in
let rec dec m = 
  if x mod m ==0 && y mod m == 0
    then m
else dec (m-1)
in
dec min;;  

;;
