module type QueueSig = sig
  type 'a queue

  val empty : 'a queue

  val enqueue : 'a -> 'a queue -> 'a queue

  val peek : 'a queue-> 'a option

  val dequeue : 'a queue -> 'a queue option

end;;


module ListQueueImpl = struct
    type 'a queue = 'a list

    let empty = []
    
  let enqueue x q = 
    q @ [x]

  let peek = function
  | [] -> None
  | x :: _ -> Some x

  let dequeue = function
  | [] -> None
  | _ :: q -> Some q

end

module TwoListQueueImpl = struct
  
  type 'a queue ={
    front : 'a list;
    back : 'a list;

  }
  let empty = {
    front = [];
    back = [];
  }
    
  let enqueue x = function
  | {front = [] } -> {front = [x];back=[]}
  | q -> {q with back = x:: q.back}  


  let peek = function
    | {front = []} -> None
    | {front = x :: _} -> Some x

  
  let dequeue = function
    | {front = []} -> None
    | {front = _ ::[] ; back} -> Some {front = List.rev back ; back=[]}
    | {front = _ ::t ; back} -> Some {front = t;back}

end

(*let q : int list = 
  ListQueue.(empty |> enqueue 42 |> dequeue |> enqueue 43);; (*Errore perche sto usando le options*)
  *)


  (*Option.map*)
  let (>>|) opt f = 
    match opt with
    | None -> None
    |Some x -> Some (f x)

    (*Come se fosse il Reverse di Map chiamato anceh Option.bind*)
  let (>>=) opt f = 
  match opt with
  | None -> None
  |Some x -> f x

  let q : int list option = 
    let open ListQueueImpl in
      empty 
      |> enqueue 42 
      |> dequeue
       >>| enqueue 43
        >>= dequeue 
  ;; 



    
    module ListQueue : QueueSig = ListQueueImpl
    module TwoListQueue : QueueSig = TwoListQueueImpl