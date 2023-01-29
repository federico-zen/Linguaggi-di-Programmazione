type 'a stack ='a list


let empty = [];;

let push x s = x::s;;

let peek = function
  | [] -> failwith "Empty Stack"
  | x::tl -> x


let pop = function
  | [] -> failwith "Empty Stack"
  |x::tl->tl
