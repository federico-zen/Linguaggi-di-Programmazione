-module(avg).
-export([avg/1]).

avg(L)->
    sum(L) / length(L).


%L = [{"Gianni",10},{"Adam",4},{"Giovanni",8}].
sum([])->
    0;
sum([{_,Score}|TL])->
    Score + sum(TL).
