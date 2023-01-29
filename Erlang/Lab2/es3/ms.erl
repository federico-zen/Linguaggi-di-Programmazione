%This problem illustrates a situation where we have a process (the master) which supervises other processes (the slaves). 
%In a real example the slave could, for example, be controlling different hardware units.
% The master's job is to ensure that all the slave processes are alive. If a slave crashes (maybe because of a software fault), 
% the master is to recreate the failed slave.

%Write a module ms with the following interface:

%-start(N) which starts the master and tell it to start N slave processes and registers the master as the registered process master.
%-to_slave(Message, N) which sends a message to the master and tells it to relay the message to slave N; 
%   the slave should exit (and be restarted by the master) if the message is die.
%-the master should detect the fact that a slave process dies, restart it and print a message that it has done so.
%-The slave should print all messages it receives except the message die

-module(ms).
-export([start/1,to_slave/2,stop_server/0]).


start(N)->
    register(master,spawn(fun()-> master_init(N) end)). 

master_init(N)-> 
    io:format("[MASTER] I'm starting with Pid:~p~n" , [self()]),
    io:format("[MASTER] Creating slave's list with ~p slaves ~n",[N]),
    process_flag(trap_exit,true),
    L = create_slave_list(N,0,[]),
    io:format("[MASTER] Slaves Lists -> ~p~n",[L]),
    master_loop(L).

master_loop(L) -> 
    receive
        {Pid,{die,N}} -> 
            io:format("[MASTER] Sending die to Slave ~p~n",[N]),
            %Send Die Message to Slave
            Slave_Pid = lists:nth(N,L),
            Slave_Pid ! {master,die},
            Pid ! {master,ok},
            master_loop(L)
            ;
        {Pid,{Message,N}} -> 
            io:format("[MASTER] Sending ~p to Slave ~p~n",[Message,N]),
            Slave_Pid = lists:nth(N+1,L),
            Slave_Pid ! {master,Message},
            Pid ! {master,ok},
            master_loop(L);
        {_,stop}-> io:format("Server Stopping ~n"),exit(normal);
        {'EXIT',Pid,normal} -> 
            io:format("DIED SLAVE WITH PID ~p~n",[Pid]),
            New_slave_list = replace_slave(Pid,L,0),
             io:format("[MASTER] New Slaves Lists -> ~p~n",[New_slave_list]),
            master_loop(New_slave_list)
    after 10000 ->
        io:format("[MASTER] Waiting...~n"),master_loop(L)
    end
    .

stop_server()-> 
    master ! {self(),stop}
    .

to_slave(Message,N)-> 
    master ! {self(),{Message,N}},
    receive
        Response -> Response
    end
    .

create_slave_list (N,N,Acc)-> lists:reverse(Acc);
create_slave_list(N,I,Acc)-> 
    io:format("[MASTER] Creating Slave N° ~p~n",[I+1]),
    Pid = spawn_link(fun()-> slave_loop(I) end ),
    L = [Pid|Acc],
    create_slave_list(N,I+1,L).


slave_loop(I) -> 
    receive
        {master,die}-> %%io:format("[SLAVE ~p] Dying~n",[I]),
                exit(normal);
        {master,Message}-> io:format("[SLAVE ~p] got message ~p~n",[I,Message]),slave_loop(I)
    end
.
replace_slave(Old,[Old|TL],I) ->  
    Pid = spawn_link(fun()-> slave_loop(I) end ),
     io:format("[MASTER] Create New Slave ~p Process with Pid  -> ~p~n",[I+1,Pid]),
    [Pid|TL] ;
replace_slave(Old,[H|TL],I) -> [H | replace_slave(Old,TL,I+1)].


%slave_atom(I) -> 
%list_to_atom(lists:flatten(io_lib:format("slave~p", [I]))).
