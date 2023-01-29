#use "es4.ml";;

let main () = 

  let list =  create_occ_list (read_file_to_lst "text.txt") in
    let str = string_of_occors_list list in
      print_endline str
;;


main();;