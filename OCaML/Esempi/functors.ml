module type X = sig
  val x : int
end

module A = struct
  let x = 0
end

module IncX = functor (M : X) -> struct (*Prende un modulo e produce un modulo*)
  let x = M.x+1
end
(*Prende un modulo e restituisce un altro modulo con x+1*)

(*Stessa cosa di prima*)
module IncX (M:X) = struct (*Con i funtori devo per forza specificare il tipo di input del funtore (X) *)
  let x = M.x +1 
end

module B = IncX(A);;
module C = IncX(B);;

A.x;; (* -> 0*)

B.x ;; (*-> 1*)

C.x ;; (*-> 2*)