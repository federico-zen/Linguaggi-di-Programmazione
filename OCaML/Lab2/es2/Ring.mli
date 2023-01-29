module type Ring = sig
    include Monoid.Monoid
    val mul : t->t->t
end