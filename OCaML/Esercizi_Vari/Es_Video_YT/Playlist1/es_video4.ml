(* Fondamentals and Inductive Type*)

(* Inductive Type Sono tipi creati dal programmatore*)

type msg = StringMsg of string * int 
        | BoolMsg of bool * int 
        | FloatMsg of float*int
;;

let sample_msg =[
  StringMsg("Hello",0000) ;
  StringMsg("World",1200) ;
  BoolMsg(true,1300);
  FloatMsg(2.42,1330)];;

let msg_log(m: msg) : string = 
  match m with
  | StringMsg (s,ts)-> "Msg at "^string_of_int ts ^ ": "^s 
  | BoolMsg (b,ts) -> "Msg at "^string_of_int ts ^ ": "^ string_of_bool b
  | FloatMsg (f,ts) -> "Msg at "^string_of_int ts ^ ": "^ string_of_float f
;;

let log_messages (msgs : msg list) :string = 
  String.concat "\n" (List.map msg_log msgs)
;;

let print_messages (msgs : msg list) =
  print_endline(log_messages msgs);;