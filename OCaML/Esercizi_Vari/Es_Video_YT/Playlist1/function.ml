let increment x = x +1;; (* increment è il nome , x è un parametro*)


let increment' (x:float) : float = (* Funzione con argomenti e valore di ritorno tipizzati*)
  x +. 1.;;


let add x y = x+y;;

let add' (x:int)(y:int) : int = x+y;;

let rec fib n = 
  if n <= 1 then n
  else fib(n-1) + fib(n-2) ;;