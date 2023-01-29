(* Rose Tree*)
 
type 'a rose_tree = Rose of 'a * 'a rose_tree list;;

let t1 : int rose_tree =

  Rose (2,[Rose (1,[Rose (5,[]);Rose(7,[])]); Rose(3,[]);Rose(4,[])])

;;

let rec rt_fold (r: 'a -> 'b list -> 'b) (t : 'a rose_tree) : 'b = 
  match t with
  | Rose (v,list) -> r v (List.map (rt_fold r) list)
;;

let sum (t:int rose_tree) : int = 
  let f (v : 'a) (vs : int list) : int =
    v + (fun xs -> List.fold_right (+) xs 0) vs
  in
  rt_fold f t
  ;;

