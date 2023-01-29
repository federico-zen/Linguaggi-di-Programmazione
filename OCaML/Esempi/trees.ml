type 'a tree = 
  | Leaf
  | Node of 'a*'a tree *'a tree
;;

let rec size = function
| Leaf -> 0
| Node (x,l,r) -> size l + size r +1
;;

let int_tree = Node (1,Node(2,Leaf,Leaf),Node (3,Leaf,Leaf));;

let string_tree = Node ("HI ",Node("How ",Leaf,Leaf),Node ("Are",Node("You",Leaf,Leaf),Leaf));;

let rec sum = function
  | Leaf -> 0
  | Node (x,l,r) -> x+ sum l + sum r
;;

let rec map f = function
  |Leaf -> Leaf
  | Node (v,l,r) -> Node (f v, map f l,map f r)
;;

let add1 t = map succ t;;

let rec fold acc f = function
| Leaf -> acc
| Node (v,l,r) -> f v (fold acc f l) (fold acc f r) 
;;

let sum_tree t = fold 0 (fun x y z -> x+y+z) t;;