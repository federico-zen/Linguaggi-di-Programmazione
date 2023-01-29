%Write a server that will wait in a receive loop until a message is sent to it. Depending on the message, it should either print its contents and loop again, or terminate. You want to hide the fact that you are dealing with a process, and access its services through a functional interface, which you can call from the shell.

%This functional interface, exported in the echo.erl module, will spawn the process and send messages to it. The function interfaces are shown here:

%   -echo:start() ⇒ ok
%   -echo:print(Term) ⇒ ok
%   -echo:stop() ⇒ ok

%Hint: use the register/2 built-in function, and test your echo server using the process manager.

%Warning: use an internal message protocol to avoid stopping the process when you, for example, call the function echo:print(stop).

%Then write a client to be connected to such a server and link these two processes each other. When the stop function is called, instead of sending the stop message, make the first process terminate abnormally. This should result in the EXIT signal propagating to the other process, causing it to terminate as well.


-module(echo).
-export([start/0,print/1,stop/0,loop/0,stopAb/0]).


start() -> 
    Pid = spawn(echo,loop,[]),
    io:format("Server Starting with Pid(~p)~n",[Pid]),
    register(echo_server,Pid).

loop() ->
   receive
    {Sender,Text} -> io:format("Ricevuto da ~p : ~s ~n",[Sender,Text]);
    stop -> exit(normal);
    stopAb -> io:format("Dying ~p~n",[self()]),exit(kill);
    Generic -> io:format("Formato Messaggio Errato : ~p " , [Generic])
    end,
    loop()
.

print(Message) ->
    whereis(echo_server) ! {self(),Message}.

stop()-> 
    io:format("Stopping Server ..."),
    whereis(echo_server) ! stop.

stopAb()->
    io:format("Stopping Server Abnormaly..."),
    whereis(echo_server) ! stopAb.