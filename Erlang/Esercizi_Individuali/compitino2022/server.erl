-module(server).
-export([start/0]).


start()->
     group_leader(whereis(user),self()),
     io:format("[SERVER] Starting with pid ~p~n",[self()]),
     register(server,self()),
     server_loop({[],[]},false,false)
    .

server_loop({L1,L2}=Lists,StatusL1,StatusL2)->
    io:format("[SERVER] STATUS : ~p ~p ~p ~p~n",[L1,L2,StatusL1,StatusL2]),
    receive
        {mm1,{data,H,Lenght,Lenght}} when StatusL2->
            io:format("[SERVER] Received from ~p : #~p (~p of ~p) ~n",[mm1,H,Lenght,Lenght]),
            print_response(updateLists(Lists,H,mm1)),
            server_loop({[],[]},false,false);

        {mm2,{data,H,Lenght,Lenght}} when StatusL1->
            io:format("[SERVER] Received from ~p : #~p (~p of ~p) ~n",[mm2,H,Lenght,Lenght]),
            print_response(updateLists(Lists,H,mm2)),
            server_loop({[],[]},false,false);

        {mm1,{data,H,Lenght,Lenght}}->
            io:format("[SERVER] Received from ~p : #~p (~p of ~p) ~n",[mm1,H,Lenght,Lenght]),
            server_loop(updateLists({L1,L2},H,mm1),true,StatusL2);
        {mm2,{data,H,Lenght,Lenght}} ->
            io:format("[SERVER] Received from ~p : #~p (~p of ~p) ~n",[mm2,H,Lenght,Lenght]),
            print_response(updateLists(Lists,H,mm2)),
            server_loop(updateLists({L1,L2},H,mm2),StatusL1,true);

        {MM,{data,H,Index,Lenght}} -> 
            io:format("[SERVER] Received from ~p : #~p (~p of ~p) ~n",[MM,H,Index,Lenght]),
            server_loop(updateLists({L1,L2},H,MM),StatusL1,StatusL2);
        {_,{close}} -> io:format("[SERVER] Stopping")
    end.

updateLists({L1,L2},H,mm1)->{[H|L1],L2};
updateLists({L1,L2},H,mm2)->{L1,[H|L2]}.


print_response({L1,L2})->
    io:format("L1 = ~p , L2 = ~p ~n",[L1,L2]),
    Reverse =lists:append(L2,L1),
    io:format("The reverse of ~p is ~p ~n",[lists:reverse(Reverse),Reverse])
    .