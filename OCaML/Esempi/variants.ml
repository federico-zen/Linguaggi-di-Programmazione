type primaty_color = Red | Green| Blue;;

let r = Red;;

type point = float * float;;

type shape = (* dopo of descrivo come è fatto il tipo*)
  |Circle of {center : point ; radius : float}
  |Rectangle of {lower_left : point;upper_right : point}
  |Point of point
  
let c1 = Circle {center=(0.0,0.0);radius = 1.};;
let p1 = (31.,10);;
let r1 = Rectangle {lower_left = (-1.,-1.);upper_right = (1.,1.)}

let avg a b  =

  (a+.b)/.2.

;;

let center s = 
  match s with
  | Circle {center;radius} -> center 
  | Rectangle {lower_left;upper_right} -> 
      let (x_ll , y_ll) = lower_left in 
        let (x_ur , y_ur) = upper_right in
          (avg x_ll x_ur, avg y_ll y_ur)  
  |Point (x,y) -> (x,y)
;;

(* Posso anche fare *)
let center' s = 
  match s with
  | Circle {center;radius} -> center 
  | Rectangle {lower_left =(x_ll , y_ll);upper_right=(x_ur , y_ur)} -> 
          (avg x_ll x_ur, avg y_ll y_ur)  
  |Point p -> p