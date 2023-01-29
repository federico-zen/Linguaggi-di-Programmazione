-module(test).
-export([test_parse/0,test_evaluate/0]).

test(F,L) -> 
    lists:foreach(
        fun(X)-> io:format("~p : ~p~n",[X,F(X)])end,
        L
    ).

test_parse() ->
    test (
        fun  es2:parse/1, 
        ["5 6 + 3 +"]
    ). 

test_evaluate()->
     test (
        fun  es2:evaluate/1, 
        [{plus,{plus,{num,5},{num,6}},{num,3}}]
    ). 

