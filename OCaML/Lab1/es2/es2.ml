(*Beyond the well-known Celsius and Fahrenheit, there are other six temperature scales: Kelvin, Rankine, Delisle, Newton, Réaumur, and Rømer (Look at:

  http://en.wikipedia.org/wiki/Comparison_of_temperature_scales

to read about them).

    1) Write a function that given a pure number returns a conversion table for it among any of the 8 scales.
    2) Write a function that given a temperature in a specified scale returns a list of all the corresponding temperatures in the other scales, note that the scale must be specified.

Hint. Define a proper datatype for the temperature.*)

(*Soluzione del prof*)

type t_unit = Celsius | Fahrenheit | Kelvin |Rankine |Delisle|Newton|Reaumur|Romer;;

type temperature = {value : float ;tu : t_unit};;

let cons = [Celsius ; Fahrenheit ;Kelvin ;Rankine ;Delisle;Newton;Reaumur;Romer ];;

let any2c t : temperature = 
  match t.tu with 
  |Celsius -> t
  |Fahrenheit -> {value = (t.value -.32.) *. 5. /. 9.; tu = Celsius} 
  |Kelvin -> {value = (t.value -.273.15); tu = Celsius} 
  |Rankine -> {value = (t.value -. 491.67) *. 5. /. 9.; tu = Celsius} 
  |Delisle ->{ value =  100. -. t.value *. 2. /. 3.; tu = Celsius} 
  |Newton -> {value = t.value *. 100. /. 33.; tu = Celsius} 
  |Reaumur -> {value = t.value *. 5. /. 4.; tu = Celsius} 
  |Romer -> {value = (t.value -. 7.5) *. 40. /. 21.; tu = Celsius} 

;;

let  c2any t u = 
  match u with
  |Celsius -> t
  |Fahrenheit -> {value = t.value *. 9. /. 5. +. 32.;tu = u} 
  |Kelvin -> {value = t.value +. 273.15; tu = u}
  |Rankine -> {value = t.value *. 5. /. 9. +. 491.67; tu = u}
  |Delisle ->{ value =  (100. -. t.value )*. 3. /. 2.; tu = u}
  |Newton -> {value = t.value *.  33. /.100.; tu = u} 
  |Reaumur -> {value = t.value *. 4. /. 5.; tu = u}
  |Romer -> {value = t.value *. 21. /. 40. +.7.5; tu = u}
;;

let p_temp ppf t = 
  match t.tu with
  |Celsius -> Format.fprintf ppf "%6.1f°C" t.value
  |Fahrenheit -> Format.fprintf ppf "%6.1f°F" t.value
  |Kelvin -> Format.fprintf ppf "%6.1f°G" t.value
  |Rankine -> Format.fprintf ppf "%6.1f°R" t.value
  |Delisle ->Format.fprintf ppf "%6.1f°De" t.value
  |Newton -> Format.fprintf ppf "%6.1f°N" t.value
  |Reaumur -> Format.fprintf ppf "%6.1f°Re" t.value
  |Romer -> Format.fprintf ppf "%6.1f°Ro" t.value
;; 

let rec p_temp_list ppf = 
  function 
    [] -> Format.fprintf ppf "]\n"
    | hd :: [] -> Format.fprintf ppf "%a ]\n" p_temp hd
    | hd :: tl ->Format.fprintf ppf "%a, " p_temp hd ; p_temp_list ppf tl
;;

let rec p_temp_table ppf = 
  function 
  []  -> Format.fprintf ppf "]\n"
  |hd :: [] -> Format.fprintf ppf "%a ]\n" p_temp_list hd
  | hd :: tl ->Format.fprintf ppf "%a, " p_temp_list hd ; p_temp_table ppf tl
  ;;

let others t = 
  let rec others c res = 
    function
      []                                -> List.rev res
      | a_unit :: tl when a_unit = t.tu -> others c res tl
      | a_unit :: tl                    -> others c ((c2any c a_unit)::res) tl
  in others (any2c t) [] cons
;;

(*Format.printf "%a :- [ %a" p_temp {value = 42. ; tu = Fahrenheit} p_temp_list (others {value = 42. ; tu = Fahrenheit})
;; *)

(*---------------------------------------------------*)

(* Mia Soluzione*)

