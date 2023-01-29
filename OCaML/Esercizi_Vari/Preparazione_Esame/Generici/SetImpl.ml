module Set : SetInterface.Set = struct 
  type 'a set = 'a list


  let empty()= []

  let add el s = if (List.exists (fun y -> y = el) s) then s else el::s

  let remove el s = 
    List.filter (fun x -> x != el) s

  let card s = List.length s

  let rec to_string s f = 
    match  s with
    | [] -> ""
    | h ::tl -> begin
     " "^ (f h) ^ " "^ (to_string tl f)
    end

    let set_of_lst lst =
      let rec aux acc = function
      | [] -> List.rev acc
      | x::tl -> aux (add x acc) tl
    in aux (empty()) (List.sort (fun x y -> if x > y then 1 else 0) lst)



  


end