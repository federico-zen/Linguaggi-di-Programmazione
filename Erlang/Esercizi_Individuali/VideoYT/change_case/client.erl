-module(client).
-export([changecase/3]).

changecase(Server,String,Cmd) ->
    Server ! {self(),{String,Cmd}},

    receive
        {Server,Result} -> 
       io:format("Result: ~p~n" ,[Result])      
       end.

