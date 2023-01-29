-module(slave).
-export([init/0]).

init()->
    io:format("[SLAVE] I'm Alive~n"),
    slave_loop(1,undefined).
init(N) -> 
    slave_loop(N,undefined).

slave_loop(SlaveLenght,Next)->
    receive
        {store,Key,Value,Lenght} when Lenght == SlaveLenght -> 
            io:format("[SLAVE ~p] Recived store(~p,~p)~n",[SlaveLenght,Key,Value]),
            put(Key,Value),
            io:format("Dictionaty -> ~p~n",[get()]),
            whereis(server) ! {slave,ok},
            slave_loop(SlaveLenght,Next);
        {store,Key,Value,Lenght} when Next == undefined ,Lenght /= SlaveLenght ->
            io:format("[SLAVE ~p] Spawn and Forward~n",[SlaveLenght]),
            NewSlave = spawn_link(fun() -> init(SlaveLenght+1) end ),
            NewSlave ! {store,Key,Value,Lenght},
            slave_loop(SlaveLenght,NewSlave);
        
        {store,Key,Value,Lenght} ->
            io:format("[SLAVE ~p] Forward~n",[SlaveLenght]),
            Next ! {store,Key,Value,Lenght},
            slave_loop(SlaveLenght,Next);
        
        {lookup,Key,Lenght} when Lenght == SlaveLenght ->
            io:format("[SLAVE ~p] Recived lookup(~p)~n",[SlaveLenght,Key]),
            whereis(server) ! {slave,get(Key)},
          slave_loop(SlaveLenght,Next);
        
        {lookup,Key,Lenght} when Lenght /= SlaveLenght, Next == undefined ->
             io:format("[SLAVE ~p] Not Found lookup(~p)~n",[SlaveLenght,Key]),
             whereis(server) ! {slave,undefined},
             slave_loop(SlaveLenght,Next);
        
        {lookup,Key,Lenght} -> 
            io:format("[SLAVE ~p] Forward ~n",[SlaveLenght]),
            Next ! {lookup,Key,Lenght},
            slave_loop(SlaveLenght,Next);

        {die} when Next /= undefined -> 
              io:format("[SLAVE ~p] Dying and Forward ~n",[SlaveLenght]),
               Next ! {die};

        {die} ->
             io:format("[SLAVE ~p] Dying .. ~n",[SlaveLenght])
        
    end.
