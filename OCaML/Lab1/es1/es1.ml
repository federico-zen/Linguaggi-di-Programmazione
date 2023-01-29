(*Put into a list, called alkaline_earth_metals, the atomic numbers of the six alkaline earth metals: beryllium (4), magnesium (12), calcium (20), strontium (38), barium (56), and radium (88). Then

   1) Write a function that returns the highest atomic number in alkaline_earth_metals.
   2) Write a function that sorts alkaline_earth_metals in ascending order (from the lightest to the heaviest).

Put into a second list, called noble_gases, the noble gases: helium (2), neon (10), argon (18), krypton (36), xenon (54), and radon (86). Then

   3) Write a function (or a group of functions) that merges the two lists and print the result as couples (name, atomic number) sorted in ascending order on the element names.
*) 


let alkaline_earth_metals = ("Beryllium",4)::("Magnesium",12)::("Calcium",20)::("Strontium",38)::("Barium",56)::("Radium",88)::[];;

(* 1)*)
let highest_atomic_number (lst : (string*int) list) : string*int = 
   let maximum x y = 
      if ((snd x ) > (snd y)) then x else y
   in
   match lst with
   | [] -> raise (Invalid_argument "Empty List")
   | e :: rest -> List.fold_left maximum e lst
   

;;

highest_atomic_number alkaline_earth_metals ;;

(*2)*)

let sort_list (lst : (string * int) list) : (string * int) list =

   List.sort (fun x y -> if((snd x) > (snd y)) then 0 else 1) lst
;;

sort_list alkaline_earth_metals;;

(*3)*)
let noble_gases = ("Helium",2)::("Neon",10)::("Argon",18)::("Krypton",36)::("Xenon",54)::("Radon",86)::[];;

let rec merge_lists (lstx : (string * int ) list)( lsty : (string * int ) list) : (string * int ) list = 
   match lstx with
   | [] -> lsty
   | x::[] -> x::lsty
   | x :: rest -> x:: (merge_lists rest lsty)

;;


sort_list (merge_lists alkaline_earth_metals noble_gases);;





