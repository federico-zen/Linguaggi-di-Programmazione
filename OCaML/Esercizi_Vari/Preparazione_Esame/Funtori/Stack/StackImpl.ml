module StackListImpl : StackInterface.StackI  =  struct

  type  stack = {mutable c : char list}

  exception EmptyStack

  let empty() = { c = [] }

	let push x s = s.c <- x :: s.c

	let pop s =
		match s.c with
			hd::tl -> s.c <- tl 
			| [] -> raise EmptyStack

	let top s =
		match s.c with
			hd::_ -> hd
		| [] -> raise EmptyStack

	
	let to_string s  =
		let rec to_string lst = 
		match lst with
		| [] -> "" 
		| h::tl ->  (Char.escaped h) ^ " " ^ to_string tl 
		in to_string s.c



	let is_empty s = (s.c = [])
  
end


module StackArrayImpl : StackInterface.StackI  =  struct
	type stack = {
	mutable c: char array;
	mutable topi: int }
	   exception EmptyStack

	let empty() = {topi=0; c=Array.make 10 ' '}
	let push x s =
	s.c.(s.topi) <- x; s.topi <- s.topi+1
	let pop s =
	match s.topi with
	0 -> raise EmptyStack
	| _ -> s.topi <- s.topi -1
	let top s =
	match s.topi with
	0 -> raise EmptyStack
	| _ -> s.c.(s.topi)

	let to_string s  =
	let rec aux_to_string i top=
		match i with
		| index when index = top -> ""
		| index -> (Char.escaped (s.c.(index))) ^ " " ^ (aux_to_string (i+1) s.topi) 
		
	in aux_to_string 0 s.topi


	let is_empty s = (s.topi = 0)
	end;;
	



