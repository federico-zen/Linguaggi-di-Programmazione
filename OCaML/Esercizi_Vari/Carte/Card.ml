  
  type card = Card of regular 
              | Joker 
    and regular = {seme: seme ; nome : nome_carta }
    and seme = Quadri | Picche | Fiori | Cuori
    and nome_carta =  Numero of int 
      | Re
      | Donna
      | Jack
      | Asso
    
  ;;
  

    let evaluate = function
    | Joker -> 11.
    | Card {nome = Asso} -> 1.
    | Card {nome = Re} -> 10.
    | Card {nome = Donna} -> 9.
    | Card {nome = Jack} -> 8.
    | Card {nome = Numero n} -> float_of_int n ;;

  let string_of_nome = function
  | Jack-> "J"
  |Donna -> "Q"
  |Re -> "K"
  |Asso -> "A"
  |Numero n -> string_of_int n
  ;;
  let string_of_seme =function
  | Quadri -> "♦"
  | Picche -> "♠"
  | Fiori ->"♣"
  | Cuori ->"♥"
  ;;
  let string_of_card = function
  | Joker -> "Joker"
  | Card {seme = seme ; nome= n } -> begin
     (string_of_nome n)^(string_of_seme seme) 
  end

