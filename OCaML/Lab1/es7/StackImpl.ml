module Stack : StackInt.Stack   = struct
  
  type 'a stack = {mutable s: 'a list}
	
	exception EmptyStack
	
	let empty() = {s=[]}


	let push st el = {s=el::st.s}
	let pop st =
	match st.s with
	|[] -> raise EmptyStack
	|h::tl -> st.s<-tl; h
	
	
	let top st =
		match st.s with
		|[] -> raise EmptyStack
		|h::tl -> h	
  

end