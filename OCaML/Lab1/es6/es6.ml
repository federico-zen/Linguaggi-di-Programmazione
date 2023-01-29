(*
sin(x) can be approximate by the Taylor's series:

Similarly you can approximate all the trigonometric and transcendent functions (look at:

http://en.wikipedia.org/wiki/Taylor_series).

Let's write a module to implement sin x n by using the Taylor's series (where n is the level of approximation, i.e., 1 only one item, 2 two items, 3 three items and so on). Do the same with cosine, tangent, logarithm and so on.

Let's compare your functions with those implemented in the pervasive module at the growing of the approximation level.   
*)


module Trig :Trigonometria.Trigonometria = TrigonometriaImpl.TrigonometriaImpl;;
open Trig;;

let main() =
  let x = 1.5 in
    let n = 2 in
      print_string ("Il valore è : ");
      print_string ("Sin x " ^ string_of_float  (Trig.sen x n)^"\n") ;
      print_string ("Cos x " ^ string_of_float  (Trig.cosen x n)^"\n") ;
      print_string ("Ln x " ^ string_of_float  (Trig.logarithm x n)^"\n") ;
      print_string ("Tan x " ^ string_of_float  (Trig.tang x n)^"\n") ;

;;



main() ;;