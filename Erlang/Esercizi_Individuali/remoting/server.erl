-module(server).
-export([start/2,create/1,quit/1,msg/2]).

start(Node,Label) -> 
    spawn(Node,?MODULE,create,[Label]).

create(L)->
    group_leader(whereis(user),self()),
    global:register_name(L,self()),
    io:format("Server Started Here ~n "),
    loop()
.

loop() -> 
    receive
        {From,Msg}-> io:format("MSG  from : ~p -> ~p~n",[From,Msg]), loop();
        quit -> io:format("Esco!~n"), exit(normal);
        Other -> io:format("Ho Ricevuto ~p~n",[Other])
    end
.

quit(L) ->
    global:whereis_name(L) ! quit.

msg(L,M) -> global:whereis_name(L) ! {self(),M}.
