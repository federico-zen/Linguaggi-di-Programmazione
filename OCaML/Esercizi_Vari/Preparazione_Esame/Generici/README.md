# 🐫Generici🐫

Con i generici si intendono delle strutture che non definiscono il tipo che conterranno fino a che non viene aggiunto (vedi lista),
esse contengono il tipo 'a ossia any

```ocaml 
    let x = [];;

    >val x : 'a list = []
 ``` 
se a questa lista aggiungo un elemento di tipo int
 ```ocaml
    let x' = 10 ::x;;

    >val x' : int list = [10]
 ```
il tipo di x' diventerà un ```int list ```
    