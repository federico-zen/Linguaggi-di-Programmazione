L'espressione Case (Simile allo switch in altri linguaggi) viene usata quando per leggibilità o altro non voglio usare la definizione di funzione come pattern matching ma posso fare in questo modo : 
 
```erlang

case Expression of
    Pattern1 [when Guard1] -> Exp to execute;
    Pattern2 [when Guard2] -> Exp to execute
end.

..error se nessuno dei pattern viene matchato
```