(* Esericizo : Data una lista restituirne un altra che conta il n° di occorrenze consecutive di quell'elemento
   
 lista = [4; 4; 4; 4; 4; 4; 5; 5; 3; 5; 5; 5; 8; 9; 9];;
  
  [6;2;1;3;1;2;];;
*)



let gen_list_occ lst = 
    let rec aux  acc count ?(el = (List.hd lst)) = function
    | [] -> List.rev (count::acc)  
    | h::tl when el = h -> aux acc (count +1 ) ~el tl 
    | h::tl ->  aux (count::acc) 1 ~el:(h) tl
  in aux [] 0 lst;;
;;


let print_occurs_list lst  = 
Printf.printf "Elenco Occorrenze : ";
  Printf.printf "[ ";
  List.iter (fun x -> Printf.printf "%d " x ) lst ;
  Printf.printf "] \n";
;;


let lista = [4; 4; 4; 4; 4; 4; 5; 5; 3; 5; 5; 5; 8; 9; 9];;

print_occurs_list (gen_list_occ lista);;


(* Risultato [6;2;1;3;1;2;]*)

type oc =  Occorrenza of int *int;;

let gen_list_occ_adv lst = 
  let rec aux  acc count ?(el = (List.hd lst)) = function
  | [] -> List.rev ((Occorrenza(el,count))::acc)  
  | h::tl when el = h -> aux acc (count +1 ) ~el tl 
  | h::tl ->  aux ((Occorrenza(el,count))::acc) 1 ~el:(h) tl
in aux [] 0 lst;;
;;

let print_occurs_list_adv lst  = 
Printf.printf "(Elemento,Occorrenze): ";
  Printf.printf "[ ";
  List.iter (fun x -> match x with
  | Occorrenza(el,count) -> Printf.printf "(%d,%d) " el count ; ) lst;
  Printf.printf "] \n";
;;

let lista = [4; 4; 4; 4; 4; 4; 5; 5; 3; 5; 5; 5; 8; 9; 9];;

print_occurs_list_adv (gen_list_occ_adv lista);;