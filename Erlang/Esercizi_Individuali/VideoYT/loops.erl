-module(loops).
-export([for/3, fordown/3, range/4]).

%for: 0 ... n
for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I) | for(I + 1, Max, F)].

%-------------------

%fordown : n....0
fordown(Min, Min, F) -> [F(Min)];
fordown(I, Min, F) -> [F(I) | fordown(I - 1, Min, F)].

%-------------------

%range : n ... m , Step è una funzione per incrementare l'indice
range(Max, Max, _, F) -> [F(Max)];
range(I, Max, Step, F) -> [F(I) | range(Step(I), Max, Step, F)].

%-------------------
