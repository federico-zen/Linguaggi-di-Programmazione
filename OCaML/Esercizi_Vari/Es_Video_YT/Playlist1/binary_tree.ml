type 'a btree = Empty
                | Node of 'a btree * 'a * 'a btree;;

let bt1 : int btree = 
  Node (Node(Empty,2,Empty),
        3 ,
        Node(Empty,
          4,
          Node (Empty,5,Empty)
        )
  )

;;

let bt2 : string btree = 
  Node (Node(Empty,"2",Empty),
        "3" ,
        Node(Empty,
          "4",
          Node (Empty,"5",Empty)
        )
  )
;;

let bt3 : 'a btree = Empty;;


(* Es 1 Scrivre una funzione che somma tutti gli interi di un albero binario di interi*)

let rec sum (tree : int btree) : int = 
  match tree with 
  | Empty -> 0
  | Node (left , v, right) -> v + (sum left) + (sum right)

;;

(*Es 2 : Scrivere una funzione che converte un albero in una lista*)

let rec tree_to_list (tree : 'a btree): 'a list = 
  match tree with 
  | Empty ->  []
  | Node (left , v, right) -> (tree_to_list left) @ (v :: []) @ (tree_to_list right)
;;

(*Es 3 : Tree_Map , come la List.map*)
let rec tree_map (f:'a -> 'b) (tree : 'a btree) : 'b btree = 
  match tree with 
  |Empty -> Empty
  |Node (left , v, right) -> Node( tree_map f left,f v , tree_map f right)
;;

let square_tree (t : 'a btree) : 'b btree = 
  tree_map (fun x -> x*x) t (* Utilizzo * per fare il quadrato , ma * è un operatore di interi quindi Il linguaggio verà 'a come intero*)
;;

(* Es 4 : tree_fold , come List.fold_right o List.fold_left*)

let rec tree_fold (e:'b)(n:'b-> 'a->'b->'b) (t: 'a btree) : 'b =
  match t with
  | Empty -> e
  | Node (left ,v , right) -> n (tree_fold e n left) 
                              v  
                              (tree_fold e n right)
;;

(* Es 5 : Funzione che calcola il prodotto di un btree*)

let product (t : int btree) : int =

  tree_fold 1 (fun left  v  right -> left * v * right) t

;;