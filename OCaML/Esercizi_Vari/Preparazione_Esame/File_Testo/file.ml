let read_file filename = 
  let in_channel = open_in filename in 
    let rec read_file acc = 
      let text_line = 
        try
          String.trim (input_line in_channel)
        with
         End_of_file -> "\n"
      in
      if ((String.equal text_line "\n" ) || ( (String.equal text_line ""))) then acc
      else
        read_file(acc ^ " " ^ text_line )
      in read_file ""
;;

let list_of_string str = 
 List.filter (fun x -> not (String.equal x "")) (String.split_on_char ' ' str) 

let list_of_string_to_list_of_int lst = 
  List.map (fun x-> int_of_string x) lst


let x = read_file "testo.txt";;
 
let y = list_of_string x;;


let i = list_of_string_to_list_of_int y;;

