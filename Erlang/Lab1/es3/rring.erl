%Write a program that will create N processes connected in a ring. Once started, these processes will send M number of messages around 
%the ring and then terminate gracefully when they receive a quit message. You can start the ring with the call ring:start(M, N, Message).

%There are two basic strategies to tackling this exercise. The first one is to have a central process that sets up the ring and initiates
% sending the message. The second strategy consists of the new process spawning the next process in the ring. With this strategy, 
% you have to find a method to connect the first process to the second process.

%Try to solve the exercise in both manners. Note, when writing your program, make sure your code has many io:format statements 
%in every loop iteration; this will give you a complete overview of what is happening (or not happening) and should 
%help you solve the exercise.

-module(rring).
-export([start/3,create/3]).

start(M,N,Msg) ->
    
    register(rring_first , spawn(?MODULE,create,[N,1,self()])),
    io:format("[rring_fst] is at ~p~n",[whereis(rring_first)]),
    receive
        ready -> ok
        after 2000 -> exit(timeout)
    end,
    msg_dispatcher(M,1,Msg),
    rring_first!stop,
    ok
.

create(1,Who,Starter)-> 
    Starter ! ready , %sblocco il processo perche ho finito la creazione dell'attore
    io:format("Created [~p] as ~p connected to ~p~n",[self(),Who,rring_first]),
    loop_last(rring_first,Who);

create(N,Who,Starter) -> 
    Next = spawn(?MODULE,create,[N-1 , Who+1,Starter]),
    io:format("Created [~p] as ~p connected to ~p~n",[self(),Who,Next]),
    loop(Next,Who)
.

loop(Next,Who)->
    receive 
        {Msg,N,Pass}=M-> 
            io:format("[~p] Got {~p ~p} for the ~p time ~n ",[Who,Msg,N,Pass]),
            io:format("[~p] is ~p alive? ~p~n",[Who,Next,erlang:is_process_alive(Next)]),
            Next ! {Msg,N,Pass},
            io:format("[~p] send ~p to [~p]~n",[Who,M,Next]),
            loop(Next,Who);
        stop -> 
            io:format("[~p] Got {stop}~n",[Who]),
            Next ! stop,
            io:format("[~p] sent {stop} to [~p]~n",[Who,Next]),
            io:format("#Actor ~p stops ~n",[Who]);
        Other -> io:format("Problema! ~p~n",[Other])
    end
.

loop_last(Next,Who)->
    receive
        {Msg,N,Pass}=M->
            io:format("[~p] Got {~p ~p} for the ~p time [loop_last] ~n ",[Who,Msg,N,Pass]),
            io:format("[~p] is ~p alive? ~p [loop_last] ~n",[Who,Next,erlang:is_process_alive(whereis(Next))]),
            Next ! {Msg,N,Pass+1},
            io:format("[~p] send ~p to [~p] [loop_last] ~n",[Who,M,Next]),
            loop_last(Next,Who);
        stop -> 
            io:format("[~p] Got {stop}[loop_last] ~n",[Who]),
            exit(normal),
            unregister(rring_first),
            io:format("[~p] Unregister [~p] ~n",[Who,rring_first]);
         Other -> io:format("Problema! ~p~n",[Other])
    end
.

msg_dispatcher(M,M,Msg)->
    rring_first ! {Msg,M,1};

msg_dispatcher(M,N,Msg) -> 
    rring_first ! {Msg,N,1},
    msg_dispatcher(M,N+1,Msg)   
.