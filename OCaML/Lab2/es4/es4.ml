(*
   
Goldbach's conjecture is one of the oldest unsolved problems in number theory and in all of mathematics. It states:

Every even integer greater than 2 is a Goldbach number, i.e., a number that can be expressed as the sum of two odd primes.

Expressing a given even number as a sum of two primes is called a Goldbach partition of the number. For example,

04 = 2 +  2           6 = 3 +  3           8 = 3 +  5

10 = 7 +  3          12 = 5 +  7          14 = 3 + 11

16 = 5 + 11          18 = 7 + 11          20 = 7 + 13

Write the following functions:

    goldbach(n) that returns a Goldbach partition for n
    goldbach_list(n,m) that returns a list of Goldbach partitions for the even numbers in the range (n,m).
*)

(* Funzione che genera una lista di interi , nel range [n,m] estremi compresi*)
let range n m = 
  let rec gen_list acc el finish =
    match el with
    | x when x >  finish -> List.rev acc 
    | x ->  gen_list (x::acc) (el+1) finish

  in 
    (* Se il range ha estremi invertiti richiamo , richiamo la fiunzione invertendoli*)
    if n > m then 
      gen_list [] m n
    else 
      gen_list [] n m
;;

let is_prime n = 
    let rec checkZero x d = match d with
      | 1 -> true    
      | _ -> (x mod d <> 0) && checkZero x (d-1)
    in match n with
      | 0 | 1 -> false
      | _ -> checkZero n (n-1) 
  
;;

(*Funzione che restituisce in numeri primi di una data lista*)
let  primes_lists lst =
  
  List.filter is_prime lst

;;


let goldbach n =
  let prime = List.rev(primes_lists (range 1 n))
  in
  List.find (fun x-> is_prime (snd x)) (List.map (fun x -> (x,n-x))prime)

  
;;

let goldbach_list n m =
  let filtered_lst = 
    List.filter (fun x-> ((x mod 2) = 0 ) && x >2) (range n m)
  in 
  List.map goldbach filtered_lst
;;



