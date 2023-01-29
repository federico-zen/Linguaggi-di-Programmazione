module Graph = GraphImplementation.GraphImpl ;;
open Graph

(*Definizione del Tipo Albero*)
type 'a tree = Leaf of 'a 
| Tree of ('a * 'a tree list) (*Un abero puo avere piu di 2 sottoalberi*)


(*Funzioni utilizzate per la popolazione del grafo*)
let arcs_to_graph arcs =
  let rec arcs_to_graph g = function
  | [] -> g
  | (s,d) :: tl -> arcs_to_graph (add_arc s d g) tl
  in arcs_to_graph (empty()) arcs
;;

let graph_to_tree g root =  (*Estrae l'albero partendo da root*)
 let rec make_tree n = function
 | [] -> Leaf (n)
 | adj_to_n -> Tree (n,(make_forest adj_to_n))
 and make_forest  = function
 | [] -> []
 | hd::tl ->  (make_tree hd (adjacents hd g))::(make_forest tl)
in make_tree root (adjacents root g)
;;
