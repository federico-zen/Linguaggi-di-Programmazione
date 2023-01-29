# 🐫Funtori🐫

Il funtore permette di Parametrizzare un modulo rispetto ad un altro.
Ad esempio nel file ```Utilizzatore.ml``` definisco un modulo che è parametrizzato rispetto ad uno stack

Quando vorrò utilizzare il modulo come nel ```main.ml``` dovrò instanziarlo passando anche il modulo stack che vorrò utilizzare.

```ocaml
module X = Utilizzatore.X(Stack);;

 ```