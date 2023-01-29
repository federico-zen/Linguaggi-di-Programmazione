```erlang
if
    Guard1 -> 
        Prima Espressione;
    Guard2 -> 
        Seconda Espressione;
    ...

    true -> %Else
        Espressione da valutare se le altre sono false



end.
```

Se non metto il "true" , e nessuna delle guardie viene attivata , allora si avrà un errore.
