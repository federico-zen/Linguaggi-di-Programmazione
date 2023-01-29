-module(cring).
-export([start/3,init/3,r_process_start/0]).
%versione con attore "master" che gestisce l'anello con la lista di processi.


start(N,M,Message)->
    io:format("Preparing the Master process to start!~n"),
    Pid = spawn(?MODULE,init,[N,M,Message]),
    register(master,Pid),
    io:format("Process Master ~p registered as 'master' ~n",[Pid]).


init(N,M,Message) -> 
    %create List of Process Pid
    L = create_list([],N),
    io:format("~p~n",[L]),
    %Send messages in the ring
    loop(M,Message,L),
    %stop the ring
    send_message_to_lst(L,stop)
.


loop(1,Message,L)-> send_message_to_lst(L,Message),messages_sent;
loop(M,Message,L) ->
    send_message_to_lst(L,Message),
    loop(M-1 , Message,L)
.


create_list([]=L,N) -> 
    create_list([spawn(?MODULE,r_process_start,[])|L],N-1);  
create_list(L,0) -> 
    lists:reverse(L);
create_list(L,N) ->
    create_list([spawn(?MODULE,r_process_start,[])|L],N-1).

r_process_start()-> io:format("I'm the new ring process with pid : ~p~n",[self()]),
    r_process().

r_process() -> 
   
    receive
        {From,Message} -> io:format("~p receive from ~p : ~p ~n",[self(),From,Message]),r_process();
        quit ->
            io:format("~p Stopping because recived a stop message ~n",[self()]), 
            exit(normal) 
    end
.
send_message_to_lst([Pid],Msg)-> 
    io:format("MASTER : ~p : Sending ~p To : ~p~n",[self(),Pid,Msg]),
    Pid ! {self(),Msg} ;
send_message_to_lst([Pid|TL],Msg)->
    io:format("MASTER : ~p : Sending ~p To : ~p~n",[self(),Pid,Msg]),
    Pid ! {self(),Msg} ,
    send_message_to_lst(TL,Msg).




