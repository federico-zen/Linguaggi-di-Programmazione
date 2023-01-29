(*Write a function last : 'a list -> 'a option that returns the last element of a list*)
let rec tail_list lst = 
  match lst with 
  |[] -> raise (Invalid_argument "Lista Vuota")
  | x :: [] -> x
  | x :: rest -> tail_list rest
;;

(* Find the last but one (last and penultimate) elements of a list. *)
let rec last_two lst =
  match lst with
  | [] -> raise (Invalid_argument " Empty")
  | [x;y] -> (x,y)
  | _ :: t -> last_two t

;;

(*Find the N'th element of a list.*)
let rec element_k k =
  function 
    [] ->raise (Invalid_argument "Error")
    | x::rest ->if k = 0 then x else element_k (k-1) rest
  ;;
  
(* Find the number of elements of a list. *)
let rec list_length lst = 
  match  lst with 
  [] -> 0
  | x ::rest -> 1 + list_length rest
;;

(*Reverse a list*)
let rec reverse lst = 
  let rec reverse acc  = function
  [] -> acc
  | h::tl -> reverse(h::acc) tl 
in reverse [] lst
;;

(*Find out whether a list is a palindrome.*)
let is_plaindrome lst = 
    if (lst = (reverse lst)) then true else false
;;

(*Flatten a nested list structure.*)
(* 
flatten [One "a"; Many [One "b"; Many [One "c" ;One "d"]; One "e"]];;
- : string list = ["a"; "b"; "c"; "d"; "e"] 
*)

type 'a node =
| One of 'a 
| Many of 'a node list;;

let flatten lst = 
  let rec flatten acc lst = 
    match lst with
    |[] -> acc
    | One  x :: t->  flatten( x::acc) t 
    | Many l :: t -> flatten (flatten acc l )t 
  in
 List.rev(  flatten [] lst)
;;

(*Eliminate consecutive duplicates of list elements.*)
(* 
  # compress ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"];;
- : string list = ["a"; "b"; "c"; "a"; "d"; "e"]   
*)

let rec compress lst = 
  match lst with
  | a::b::rest -> if  a = b then compress (a::rest) else a::compress (b::rest)
  | x -> x

;;

(* Pack consecutive duplicates of list elements into sublists. *)
(*
  pack ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "d"; "e"; "e"; "e"; "e"];;
  - : string list list = [["a"; "a"; "a"; "a"]; ["b"]; ["c"; "c"]; ["a"; "a"]; ["d"; "d"];["e"; "e"; "e"; "e"]]
*)

let pack lst = 
  let rec pack_in current_sl acc = function
  |[] -> []
  | [x] -> (x::current_sl)::acc
  | a::b::rest -> 
      if a = b then 
        pack_in  (a::current_sl) (acc) (b::rest)
    else
      pack_in [] ((a::current_sl)::acc) (b::rest)
    in
  List.rev(pack_in  [] [] lst);;


(* Run-length encoding*)
(*# encode ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"];;
- : (int * string) list = [(4, "a"); (1, "b"); (2, "c"); (2, "a"); (1, "d"); (4, "e")] *)
let encode lst = 
  let  rec encode_inside count acc = function
  | []->[]
  | [x] -> (count+1,x):: acc
  | a::b::rest -> 
    if a = b then
      encode_inside (count+1) acc (b::rest)
    else 
      encode_inside 0 ((count+1,a)::acc) (b::rest)
  in
  List.rev(encode_inside 0 [] lst)
;;

(*Modified run-length encoding*)
(*
   type 'a rle =
  | One of 'a
  | Many of int * 'a

  # encode ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"];;
- : string rle list =
[Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d";
 Many (4, "e")]
*)


(*Decode a run-length encoded list*)
(* #  decode [Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d"; Many (4, "e")];;
- : string list =
["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"] *)

(*Run-length encoding of a list (direct solution)*)
(*
  Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem 
  "Pack consecutive duplicates of list elements into sublists", but only count them. 
  As in problem "Modified run-length encoding", simplify the result list by replacing the singleton lists (1 X) by X.   

  # encode ["a";"a";"a";"a";"b";"c";"c";"a";"a";"d";"e";"e";"e";"e"];;
  - : string rle list =
  [Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d";
  Many (4, "e")]
*)

(*Duplicate the elements of a list*)
(*
   # duplicate ["a"; "b"; "c"; "c"; "d"];;
- : string list = ["a"; "a"; "b"; "b"; "c"; "c"; "c"; "c"; "d"; "d"]
*)

let duplicate lst =
  let rec inside = function
  | [] -> []
  | a::rest -> a::a:: inside rest 
in
  inside lst
;;

(* Replicate the elements of a list a given number of times *)
(*
  # replicate ["a"; "b"; "c"] 3;;
  - : string list = ["a"; "a"; "a"; "b"; "b"; "b"; "c"; "c"; "c"] 
*)

let replicate lst n = 

    let rec sub counter sub_list element = 
      if counter = 0 then sub_list else sub (counter-1) (element :: sub_list) element 
    in
      let rec build_list  acc = function
      | [] ->acc
      | a::rest -> build_list ((sub n [] a)::acc) rest 
    in
    List.rev(build_list [] lst);;
  
    
(*Drop every N'th element from a list*)
(*# drop ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 3;;
- : string list = ["a"; "b"; "d"; "e"; "g"; "h"; "j"]
 *)

let drop lst n= 

  let rec drop_inside counter =function
  | []->[]
  | a::rest -> 
      if counter == n then 
        drop_inside 1 rest
    else
      a :: drop_inside (counter+1) (rest)
  in
  drop_inside 1 lst

;;

(* Split a list into two parts; the length of the first part is given *)
(*
# split ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 3;;
- : string list * string list =
(["a"; "b"; "c"], ["d"; "e"; "f"; "g"; "h"; "i"; "j"])
# split ["a"; "b"; "c"; "d"] 5;;
- : string list * string list = (["a"; "b"; "c"; "d"], [])   
*)

let split lists n =
  let rec split acc k = 
  match acc with 
  | (x,[]) -> (x,[])
  |(l,h::tl) -> 
      if k = n then
        (List.rev (h::l),(tl))
      else 
      split ((h::l),tl) (k+1)
  in
  split ([],lists) 1 ;
;;

(* Extract a slice from a list *)

(*# slice ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 2 6;;
- : string list = ["c"; "d"; "e"; "f"; "g"] 
*)

let slice list i j = 

  let rec slice_out acc k = function
    | [] -> acc
    | h :: tl -> 
      if(k >= i && k <= j  ) then 
        slice_out (h::acc) (k+1) tl
      else
        slice_out (acc) (k+1) tl
  in 
  List.rev (slice_out [] 0 list)
;;


(*Rotate a list N places to the left*)
(* # rotate ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3;;
- : string list = ["d"; "e"; "f"; "g"; "h"; "a"; "b"; "c"]
*)


(*Remove the K'th element from a list*)
(* # remove_at 1 ["a"; "b"; "c"; "d"];;
- : string list = ["a"; "c"; "d"]*)
let rec remove k  lst = 
  match lst with
  | [] -> []
  | h::tl-> 
      if k=0 then
        tl
      else
        h::remove (k-1) tl



(*Insert an element at a given position into a list*)
(*# insert_at "alfa" 1 ["a"; "b"; "c"; "d"];;
- : string list = ["a"; "alfa"; "b"; "c"; "d"]*)
let insert_at item pos lst = 
  let rec insert item pos =function
  | []-> [item]
  | h::tl -> 
    if pos = 0 then
      item::h::tl 
    else
      h::insert item (pos-1) tl
    in insert item pos lst
;;

(* Create a list containing all integers within a given range*)
(*
   # range 4 9;;
- : int list = [4; 5; 6; 7; 8; 9]*)

let range i j = 
  let rec generate_int_list acc k = 
    if (i <= k) then
      generate_int_list (k :: acc) (k-1) 
    else
      acc
  in
  generate_int_list [] j 
;;

(*Extract a given number of randomly selected elements from a list*)
(*rand_select ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"] 3;;
- : string list = ["g"; "d"; "a"]*)


let rand_select list n =


;;




(*Lotto: Draw N different random numbers from the set 1..M*)
(*# lotto_select 6 49;;
- : int list = [20; 28; 45; 16; 24; 38]*)



(*Generate a random permutation of the elements of a list*)
(*
   # permutation ["a"; "b"; "c"; "d"; "e"; "f"];;
- : string list = ["c"; "d"; "f"; "e"; "b"; "a"]
*)


(*Generate the combinations of K distinct objects chosen from the N elements of a list*)
(*# extract 2 ["a"; "b"; "c"; "d"];;
- : string list list =
[["a"; "b"]; ["a"; "c"]; ["a"; "d"]; ["b"; "c"]; ["b"; "d"]; ["c"; "d"]]*)



(*Group the elements of a set into disjoint subsets*)
(*
  # group ["a"; "b"; "c"; "d"] [2; 1];;
- : string list list list =
[[["a"; "b"]; ["c"]]; [["a"; "c"]; ["b"]]; [["b"; "c"]; ["a"]];
 [["a"; "b"]; ["d"]]; [["a"; "c"]; ["d"]]; [["b"; "c"]; ["d"]];
 [["a"; "d"]; ["b"]]; [["b"; "d"]; ["a"]]; [["a"; "d"]; ["c"]];
 [["b"; "d"]; ["c"]]; [["c"; "d"]; ["a"]]; [["c"; "d"]; ["b"]]] 
*)


(*Sorting a list of lists according to length of sublists*)
(*
   # length_sort [["a"; "b"; "c"]; ["d"; "e"]; ["f"; "g"; "h"]; ["d"; "e"];
             ["i"; "j"; "k"; "l"]; ["m"; "n"]; ["o"]];;
- : string list list =
[["o"]; ["d"; "e"]; ["d"; "e"]; ["m"; "n"]; ["a"; "b"; "c"]; ["f"; "g"; "h"];
 ["i"; "j"; "k"; "l"]]
# frequency_sort [["a"; "b"; "c"]; ["d"; "e"]; ["f"; "g"; "h"]; ["d"; "e"];
                ["i"; "j"; "k"; "l"]; ["m"; "n"]; ["o"]];;
- : string list list =
[["i"; "j"; "k"; "l"]; ["o"]; ["a"; "b"; "c"]; ["f"; "g"; "h"]; ["d"; "e"];
 ["d"; "e"]; ["m"; "n"]]
*)