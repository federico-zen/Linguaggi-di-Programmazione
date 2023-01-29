```erlang

Scores = [99,45,12,56,10].

lists:map(fun(X)->X/5 end,Scores).

%Da la stessa cosa della riga sopra
[X/5 || X <- Scores].

S =[{"john",10},{"Adam",11},{"George",20},{"Jerry",15}].

[{Name,Score > 12} || {Name,Score} <- S].


[{"Adam",Score}|| {"Adam",Score} <- S].

```


