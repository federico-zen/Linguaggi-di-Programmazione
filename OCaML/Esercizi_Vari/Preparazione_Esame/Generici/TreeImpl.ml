module Tree:TreeInterface.Tree  = struct

  type 'a tree = Empty
  | Tree of 'a * 'a tree * 'a tree

  let empty() = Empty
  

  let rec add el = function
  | Empty -> Tree(el,Empty,Empty)
  | Tree (n,l,r) -> begin
      if el > n then
        Tree(n,l,(add el r))
      else 
        Tree(n,(add el l),r)
    end


  let rec size = function
  | Empty -> 0
  | Tree (_,l,r) -> 1+(size l)+ (size r)

  let rec to_string t f = 
    match t with
    | Empty -> ""
    | Tree (n,l,r) -> begin
      " "^(f n) ^" "^(to_string l f) ^" "^ (to_string r f)

    end

  let  to_pretty_string t f = 
    let rec aux  lv =function
      | Empty-> ""
      | Tree (n,l,r)-> begin
        let rec level acc lv  =
          match  lv with
          | 0 -> acc^"*"
          | n -> level (acc^"  ") (lv-1)
        in
        (level "" lv)^ (f n) ^"\n"^(aux (lv+1) l ) ^ (aux (lv+1) r )

      end
    in
    aux  0 t
  ;;
    


  let tree_from_lst list = 
    let rec aux acc = function
    | [] -> acc
    | x::tl -> aux (add x acc ) tl
    in aux (empty()) list 

end