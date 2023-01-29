(*Estrai i valori da option , se è vuoto restituisce il default*)
let get_val default o = 
  match o with
  | None -> default
  | Some x -> x
;;

let rec list_max (lst : 'a list ) : 'a option =
  match lst with
  | [] -> None
  | h::t -> begin (*begin - end sono come delle parentesi*)
    match list_max t with (*Faccio cosi perche la funzione restituisce un options e devo fare pattern matching*)
            | None -> Some h  
            | Some m -> Some (max h m)
  end
;;