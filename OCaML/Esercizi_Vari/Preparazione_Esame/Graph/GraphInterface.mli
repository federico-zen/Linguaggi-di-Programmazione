module type GraphInt = sig
  
  type 'a graph
  val empty : unit -> 'a graph

  val add_node : 'a -> 'a graph -> 'a graph

  val add_arc : 'a -> 'a -> 'a graph -> 'a graph

  val adjacents : 'a -> 'a graph -> 'a list

  val node_is_in_graph : 'a -> 'a graph -> bool

  val is_empty : 'a graph -> bool

  exception TheGraphIsEmpty
  exception TheNodeIsNotInGraph

end