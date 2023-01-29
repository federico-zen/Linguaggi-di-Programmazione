# 🐫Esercizi OCaML🐫
Esercizi di OCaML assegnati a Lezione o presi da alcuni video

## 🐫 Fonti Esercizi🐫
Esercizi Presi dal Web : <br>
 👉 [Playlist1](https://www.youtube.com/playlist?list=PLWCdSeDHytbJyzzbzAkGCTPMEMhmTjton) <br>
 👉 [Sito OCaML](https://ocaml.org/problems) <br>


## 💡Tips💡
Compilare Moduli:
```ocaml
(*Interfaccia.mli*)
module type Interfaccia = sig
    ...
end

(*Implementazione.ml*)
module  Implementazione = struct
    ...
end
```
Compilare prima l'interfaccia
```
ocamlc -c Interfaccia.mli
```

Poi Compilare l'implementazione
```
ocamlc -c Implementazione.ml
```

Se c'è un main , bisogna fare il "linking"
```
ocamlc -o main Implementazione.cmo main.ml
```

