module Graph = GraphImplementation.GraphImpl ;;
open Graph;;
open AuxFuncGraph;;

let dfs g v = 
  let rec dfs g v g' = function
  | [] -> g'
  | hd :: tl when (node_is_in_graph hd g') -> dfs g v g' tl
  | hd :: tl ->dfs g v (add_arc v hd (dfs g hd (add_node hd g') (adjacents hd g))) tl
  in
  if (is_empty g) 
    then  raise TheGraphIsEmpty
  else if not (node_is_in_graph v g ) then raise TheNodeIsNotInGraph
    else graph_to_tree (dfs g v (add_node v (empty())) (adjacents v g)) v 