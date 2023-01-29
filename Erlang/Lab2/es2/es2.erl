%Design a distributed version of an associative store in which values are associated with tags. 
%It is possible to store a tag/value pair, and to look up the value(s) associated with a tag.
% One example for this is an address book for email, in which email addresses (values) are associated with nicknames (tags).

%Replicate the store across two nodes on the same host, send lookups to one of the 
%nodes (chosen either at random or alternately), and send updates to both.

%Reimplement your system with the store nodes on other hosts (from each other and from the frontend).
% What do you have to be careful about when you do this?

%How could you reimplement the system to include three or four store nodes?

%Design a system to test your answer to this exercise. This should generate random store and lookup requests.



-module(es2).
-export([start/2,store/3,lookup/2,stop/1]).

start(Node,Process_Name)->
    
    Pid = spawn(Node,fun()-> server_init(Node,Process_Name) end),
    io:format("Process Server Spawned ~p~n",[Pid]),
    ok.

server_init(Node,Name)-> 
    global:register_name(Name,self()), 
    group_leader(whereis(user),self()),% usato per l'output remoto
    io:format("[SERVER] Server Started on  ~p and registered as ~p with Pid ~p ~n",[node(),Name,self()]), loop(Node,Name).

loop(Node,Name)->
    receive
        {From,{lookup,Key}}=M-> 
            io:format("[SERVER on ~p] : Recived ~p~n",[Node,M]),
            From ! {Name,{response,get(Key)}}, 
            loop(Node,Name);

         {From,{store,Key,Value} }=M->
            io:format("[SERVER on ~p] : Recived ~p~n",[Node,M]),
            put(Key,Value),
            io:format("[SERVER on ~p] : Registered Names to Update ~p ~n",[Node,global:registered_names()]),
            updateAll(Key,Value),
            From! {Name,ok},
            loop(Node,Name);

        {update,Key,Value}->
             io:format("[SERVER on ~p] : Recived Update  ~n",[Node]),
            put(Key,Value),
            loop(Node,Name);

        {From,{stop}}-> 
            io:format("[SERVER on ~p] : Stopping...~n",[Node]),
            From ! {Name,stopped},
            exit(normal)
    end
    .

rpc(Server,Msg)->
    global:whereis_name(Server) ! {self(),Msg}, 
    receive
        Response -> Response
    end.


lookup(Server,Key)->
    rpc(Server,{lookup,Key}).

store(Server,Key,Value)->
    rpc(Server,{store,Key,Value}).

stop(Server)->
    rpc(Server,{stop}).

updateAll(Key,Value)->
    lists:foreach(fun(Name)-> 
         global:whereis_name(Name) ! {update,Key,Value}
        end, global:registered_names()).