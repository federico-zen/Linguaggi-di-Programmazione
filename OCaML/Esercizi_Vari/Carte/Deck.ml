open Card;;

type deck = card list  ;; 

let generate_deck () = 
  let seme_of_index i = 
    match i with
    | i when i >=0 && i<11 -> Cuori
    | i when i >= 11 && i < 22 -> Quadri
    | i when i >= 22 && i< 33 -> Fiori
    | i -> Picche  
  in
  let nome_of_index i =
    match i with 
    | i when i mod 11 = 8 -> Jack
    | i when i mod 11 = 9 -> Donna
    | i when i mod 11 = 10 -> Re
    | i when i mod 11 = 1 -> Asso
    | i-> Numero (i mod 11)
     
  in
    

    let rec aux i deck = 
    match i with
    | 45 -> List.rev deck
    | index when index mod 11 = 0 -> aux (i+1) ( Joker ::deck)
    | index  ->  aux (i+1) ( Card { seme = (seme_of_index i); nome =(nome_of_index i) } ::deck)
    
    in aux 1 [];;
;;


let print_deck deck = 

  List.iter (fun carta-> 
        match carta with
        | Joker -> Printf.printf "Joker\n"
        | Card {seme = seme ; nome= n } -> Printf.printf "%s%s " (string_of_nome n) (string_of_seme seme)
    ) deck 


;;

let pick_card deck =
    Random.self_init ();
    let index = Random.int (List.length deck) in 
      (List.nth  deck index)
      
;;

let remove_card card deck = 
  List.filter (fun el -> not (el == card)) deck
;;





