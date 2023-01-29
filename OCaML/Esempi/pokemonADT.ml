type ptype = TNormal | TFire | TWater;;

type peff = ENormal | ENotVery | ESuper;;


let mult_of_eff = 
  function
  | ENormal -> 1.
  | ENotVery -> 0.5
  | ESuper -> 2.
;;

let eff t1 t2 = 
  match t1, t2 with
  | TFire ,TFire| TWater,TWater| TFire ,TWater -> ENotVery
  | TWater ,TFire -> ESuper
  | _->ENormal
;;

type pokemon = {
  name : string ;
  hp : int ;
  ptype : ptype;
}

let charmender = {
  name = "Charmander";
  hp = 39;
  ptype = TFire;

}
