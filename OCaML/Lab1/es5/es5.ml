(*
Define the following functions/operators on strings:

    1) is_palindrome: string → bool that checks if the string is palindrome, a string is palindrome when the represented sentence can be read the same way in either directions in spite of spaces, punctual and letter cases, e.g., detartrated, "Do geese see God?", "Rise to vote, sir.", ...
    2) operator (-): string → string → string that subtracts the letters in a string from the letters in another string, e.g., "Walter Cazzola"-"abcwxyz" will give "Wlter Col" note that the operator - is case sensitive
    3) anagram : string → string list → boolean that given a dictionary of strings, checks if the input string is an anagram of one or more of the strings in the dictionary
*)


let rec list_to_string lst = 
    match  lst with
    | [] -> ""
    | x :: tl -> x ^ (list_to_string tl)
;;

let string_to_list str =
    let rec str_lst i acc = 
        if i < 0 then 
            acc 
        else 
            str_lst (i-1) ((String.make 1 (str.[i])) :: acc) 
    in
    str_lst ((String.length str)-1) [] 
;;



let ( -- ) str1 str2 = 
    let rec subtract_el lst1 e =
        match lst1 with
        | []-> []
        | x::tl -> if (x = e) then (subtract_el tl e) else x::(subtract_el tl e) 
    in 
    let rec subtract_list lst1 lst2 =
        match lst2 with
        | [] -> lst1
        | x::tl -> subtract_list (subtract_el lst1 x) tl 
    in 
    list_to_string (  subtract_list (string_to_list str1) (string_to_list str2))
;;


let is_palindrome str = 
    (List.rev (string_to_list str)) = (string_to_list str) 
;;

let anagram (str :string) (lst : string list) : bool = 
    let rec reduce acc op = function
    |   [] -> acc
    | h::tl -> reduce (op acc h) op tl
    in 
    let exists p l =
        reduce false (||) (List.map p l)    
    in

    exists (fun x -> x -- str = "" ) lst
;;
