(* Signatura del Gurppo*)
module type Group = sig
    include Monoid.Monoid
    val inv : t->t 
    
end