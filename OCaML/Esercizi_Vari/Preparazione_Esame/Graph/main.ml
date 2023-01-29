open DFS;;
module Graph = GraphImplementation.GraphImpl ;;
open Graph;;
open AuxFuncGraph;;

let g1 = arcs_to_graph [(1,2);(1,3);(4,1);(5,4);(3,2);(2,5);(5,3);(5,6);(5,7);(6,7);(6,3);(6,4)] ;;
