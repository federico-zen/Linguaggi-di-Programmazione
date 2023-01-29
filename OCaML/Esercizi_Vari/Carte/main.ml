open Deck;;
open Card;;


exception Stop of {punteggio : float};; (*Il giocatore non vuole più carte*)
exception Lose of {punteggio : float};; (*Il giocatore ha superato il 21*)
exception Win;; (* Il giocatore è arrivato a 21*)
exception UnknowCommand;; 
exception InvalidValueOfJocker;;
exception ExitWithZero;;


let choose_winner opponent player =
  Printf.printf "\n\nIl tuo punteggio e' %.0f , Mentre il punteggio del Banco e' %.0f\n" player opponent; 
  if (player = opponent ) || ((opponent > player)&& opponent <= 21.) then
     raise (Lose {punteggio = player})
  else if (player > opponent) || (opponent > 21.) then
    raise Win

;;


let rec opponent_loop deck somma_player somma_opponent =
   Printf.printf "Punteggio Banco %.0f\n" somma_opponent ;
      match somma_opponent with
      | 21. -> somma_opponent
      | score_o when (score_o >= 17.) -> score_o
      | score_o when ((score_o <21.) && (score_o >= somma_player) )-> somma_opponent
      | score_o  -> begin 
          let card = pick_card deck in 
          Printf.printf "Carta uscita %s \n" (string_of_card card);
          opponent_loop (remove_card  card deck) somma_player (score_o +. (evaluate card))
        end  
;;


let game_loop () = 
let rec game deck somma_player  = 
  try
    match somma_player with
    | 21. -> raise Win
    | x when x >21. -> raise (Lose {punteggio=somma_player})
    | x -> begin
      Printf.printf "Il tuo punteggio e' %.0f cosa vuoi fare ? ('+' per chiedere carta o '-' per fermarti )\n"  (somma_player) ;
      let a = read_line() in 
        match  a with 
        | "+" -> begin
          let card = pick_card deck in 
          match card with
          | Joker -> begin
              Printf.printf "Inserisci un valore per il Joker da 1 a 10\n" ;
              let x = read_float() in 
                match x with
                | x when (x >= 1. || x < 10.) -> game deck (somma_player+.x)
                | x -> raise InvalidValueOfJocker
            end
          | _ -> Printf.printf "Carta uscita %s \n" (string_of_card card);
          game (remove_card card deck) (somma_player +. (evaluate card)) 
        end
        | "-" ->
          if somma_player = 0. then raise ExitWithZero;  
          raise (Stop {punteggio = somma_player})
        | x -> raise UnknowCommand 
      end

  with 
      Stop {punteggio = score_player}-> begin 
          
          Printf.printf "Ti sei Fermato a %.0f \n" score_player;
          Printf.printf "_____________________\n";
          Printf.printf "Ora Gioca il Banco \n";
          let somma_opponent = opponent_loop deck score_player 0. in
            
            choose_winner somma_opponent score_player;
            
        end
      | Lose {punteggio = score} -> Printf.printf "Hai Perso!! :(\nCon punteggio %.0f\n" score; 
      | Win -> Printf.printf "Hai Vinto!! :)\n";
      | UnknowCommand ->begin  
                      Printf.printf "Comando sconosciuto, Resetto la partita \n";
                      game (generate_deck()) 0.
                    end 
      | InvalidValueOfJocker -> begin  
                      Printf.printf "Errore Valore Joker , Resetto la Partita \n";
                      game (generate_deck()) 0.
      end 
      |ExitWithZero -> Printf.printf "Uscita con punteggio 0\n";
in game (generate_deck()) 0.
;;


(* GAME START*)
game_loop()





(*  OLD MAIN Per Provare le funzioni

let deck = generate_deck();;

Printf.printf "Mazzo  : \n";;
print_deck (deck);;


Printf.printf "Carta Estratta :";;
let extracted_card = pick_card deck ;;
Printf.printf "%s \n" (string_of_card (extracted_card));;



print_deck (remove_card extracted_card deck);;
*)

