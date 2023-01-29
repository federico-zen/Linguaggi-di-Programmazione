-module(client).
-export([store/2,lookup/1,kill_server/0]).

store(Key,Value)->
    rpc({store,Key,Value}).

lookup(Key)->
    rpc({lookup,Key}).

kill_server()->
    rpc({die}).

rpc(Msg)->
    {server,'server@zenPC'}! {self(),Msg},
    receive
        {response,Response} -> Response

    end.