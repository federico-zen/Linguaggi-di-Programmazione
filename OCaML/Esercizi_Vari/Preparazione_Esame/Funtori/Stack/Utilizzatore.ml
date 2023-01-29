module Utilizzatore (MyStack : StackInterface.StackI)  = struct
  
  let is_balance str = 
    let s = MyStack.empty() in try
       String.iter (
         fun c -> 
         match c with
           |'(' -> MyStack.push c s
           |')' -> MyStack.pop s
           |_ -> () 
       ) str;
       MyStack.is_empty s 
   with MyStack.EmptyStack -> false

   
end