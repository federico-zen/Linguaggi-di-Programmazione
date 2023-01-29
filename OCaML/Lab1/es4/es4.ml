(*
Let's write a function (or a pool of functions) that given a quite large text (over than 2000 words) counts how frequent each word occurs in the text.

The text is read from a file (look at the pervasive module in the manual) and it is a real text with punctuation (i.e., commas, semicolons, ...) that should be counted.

Note that words with different case should be considered the same.   
*)


type occour= string*int;;



let read_file_to_lst filename = 
  let ch = open_in filename in
  let s = really_input_string ch (in_channel_length ch) in
  close_in ch;
  String.split_on_char ' ' (String.map (fun c-> if c = '.' || c = ',' || c = ';' then ' ' else c) s)
;;



let rec string_of_occors_list lst=

  match lst with
  | [] -> ""
  | (x,y)::tl->  x ^" : "^(string_of_int y) ^ " \n" ^ (string_of_occors_list tl)

;;

let rec add_elements el = 
  function
  | [] -> (el,1)::[]
  | (e,c) ::tl -> 
    if e = el then 
      (e,c+1)::  tl
    else
      (e,c):: add_elements el tl
;;


let create_occ_list text : occour list = 
  
  let rec create acc =
    function
    | [] -> acc
    | h::tl ->  create (add_elements h acc) tl  
  in create [] text
  
;;

