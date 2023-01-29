-module(mm).
-export([start/1]).


start(Name)->
    register(Name,self()),
    group_leader(whereis(user),self()),
    io:format("[~p] Started on ~p with pid ~p~n",[Name,node(),self()]),
    mm_loop(Name).

mm_loop(Name)->
    receive
        {client,{data,Data}} -> io:format("[~p] Received ~p~n",[Name,Data]),
        send_data(Data,Name),
        mm_loop(Name);
        {client,{close}} -> io:format("[~p] Stopping ~n",[Name])

    end
.

send_data(Data,Name) -> send_data(Data,length(Data),1,Name).

send_data([H],Lenght,Lenght,Name)-> 
    rpc(server,'server@zenvm',{data,H,Lenght,Lenght},Name);
     
send_data([H|TL],Lenght,Index,Name) ->
    rpc(server,'server@zenvm',{data,H,Index,Lenght},Name),
    send_data(TL,Lenght,Index+1,Name).


rpc(Process,Node,Msg,MM)->
    {Process,Node} ! {MM,Msg}.