(*Implementazione Con lista*)
module StackListFunctor=Utilizzatore.Utilizzatore(StackImpl.StackListImpl) ;;

Printf.printf "Implementazione Con Lista\n";;
Printf.printf "%s\n" (string_of_bool(StackListFunctor.is_balance "(x+3)((3*4)-3))"));; (*False*)
Printf.printf "%s\n" (string_of_bool (StackListFunctor.is_balance "((x+3)((3*4)-3))") );; (*true*)


(*Implementazione Con Array*)
module StackArrayFunctor=Utilizzatore.Utilizzatore(StackImpl.StackListImpl) ;;

Printf.printf "Implementazione Con Array\n";;
Printf.printf "%s\n" (string_of_bool(StackArrayFunctor.is_balance "(x+3)((3*4)-3))"));; (*False*)
Printf.printf "%s\n" (string_of_bool (StackArrayFunctor.is_balance "((x+3)((3*4)-3))") );; (*true*)