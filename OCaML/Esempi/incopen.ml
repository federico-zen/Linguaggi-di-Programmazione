module M = struct
  let x = 0
end

module N = struct
include M (*Include tutte le definizioni del modulo*)
  let y = x+1
end


module O = struct
  open M (*Lo rendiamo disponibile dentro il modulo senza renderlo pubblico all'esternoS*)
  let y = x+1
end