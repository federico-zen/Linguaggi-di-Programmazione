module type Monoid = sig
  type t
    
  val elements : t Seq.t
  val identity : t

  val add :t-> t->t
end

