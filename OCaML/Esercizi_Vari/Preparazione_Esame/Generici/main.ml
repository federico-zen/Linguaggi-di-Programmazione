module Tree = TreeImpl.Tree;;
module FileMan = File.ManageFile;;


let number_list = 
  let file_content =FileMan.read_file "numeri.txt" in 
    List.map (fun x -> int_of_string x) (FileMan.list_of_string file_content);;

let t = Tree.tree_from_lst number_list;;




Printf.printf "Dimensione Tree : %d\n%s\n"(Tree.size t) (Tree.to_pretty_string t (fun x -> string_of_int x));;


(*Set*)
module Set = SetImpl.Set;;


let s = Set.set_of_lst number_list;;


Printf.printf "Set {%s}\nDimensione Set %d\n" (Set.to_string s (fun x -> string_of_int x)) (Set.card s);;


