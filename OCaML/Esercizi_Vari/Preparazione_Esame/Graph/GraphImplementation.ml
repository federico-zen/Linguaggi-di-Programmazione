module  GraphImpl : GraphInterface.GraphInt = struct

 type 'a graph = Graph of ('a list) * (('a * 'a) list );;

  exception TheGraphIsEmpty
  exception TheNodeIsNotInGraph

  let empty () = Graph ([],[])

  let is_empty  = function
  | Graph(nodes , _) -> (nodes = [])

  let rec is_in_list ?(res = false) x = function
  | [] -> res
  | h::tl ->  is_in_list ~res:(res || h=x) x tl 

  let node_is_in_graph n = function
  | Graph (nodes,_) -> is_in_list n nodes

  let rec add_in_list ?(res=[]) x = function
  |[] -> List.rev (x::res)
  | h::tl when (h=x) -> List.rev_append tl (h::res)
  | h::tl -> add_in_list ~res: (h::res) x tl

  let add_node n = function
  | Graph ([],[]) -> Graph ([n],[])
  | Graph(node,arcs) -> Graph ((add_in_list n node),arcs) 


  let add_arc s d = function
  | Graph (nodes,arcs) -> Graph( (add_in_list s(add_in_list d nodes)), (add_in_list (s,d) arcs))

  let adjacents n = 
    let adjacents n l = List.map snd (List.filter (fun x -> ((fst x )=n)) l)
  in function
    Graph (_,arcs) -> adjacents n arcs
end;;