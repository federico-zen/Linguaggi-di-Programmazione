module Calculator (Stack : StackInt.Stack)   = struct

  type exp = string list

  exception BadExpressionFormat
  exception UnknownOperand

 let is_operand op = 
  match op with
  | "+"->  true
  | "-" -> true
  | "/" -> true
  | "*" -> true
  | "**" -> true
  | _ -> false
 ;;
  let rec pow n e = 
    match e with
    | 0 ->1
    | 1 -> n
    | x -> n * (pow n (e-1))
  ;;

  

  let exp_of_string str = 
    let  rec exp_of_string expression  = function 
    (*TODO: Aggiungere il caso in cui ho ( op ) + ( op )*)
    | []-> List.rev expression
    | space :: tl when ( String.equal ""  space ) || (String.equal " " space )-> exp_of_string (expression) tl
    | p :: tl when ( String.equal ")"  p ) || (String.equal "(" p)-> exp_of_string (expression) tl
    | h::h2::tl when (is_operand h && h2 = "" ) || (is_operand h && is_operand h2) || (not( is_operand h) && not (is_operand h2)) -> raise BadExpressionFormat
    | h::h2::tl when is_operand h-> exp_of_string (h::h2::expression) tl
    | h :: tl -> exp_of_string (h::expression) tl
    in exp_of_string  [] (String.split_on_char ' ' str) 

  let evaluate exp = 
      let rec eval stack = function
      | [] -> Stack.pop stack
      | h::tl when (is_operand h) ->  begin 
        match h with
        | "+" -> eval ( Stack.push stack (Stack.pop stack + Stack.pop stack) ) tl
        | "-" -> eval ( Stack.push stack (Stack.pop stack - Stack.pop stack) ) tl
        | "*" -> eval ( Stack.push stack (Stack.pop stack * Stack.pop stack) ) tl
        | "/" -> eval ( Stack.push stack (Stack.pop stack / Stack.pop stack) ) tl
        | "**" -> eval (Stack.push stack (pow (Stack.pop stack) (Stack.pop stack))) tl
        | _ -> raise UnknownOperand
        end
      | h::tl -> eval (Stack.push stack  (int_of_string h)) tl


      in eval (Stack.empty()) exp

     

end
