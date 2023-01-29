-module(drs).
-export([start/2,long_reverse_string/2,stop/1]).


start(Node,Name)->
    Pid = spawn(Node,fun()-> server_init(Node,Name) end),
    io:format("Process Server Spawned ~p~n",[Pid]),
    ok.

server_init(Node,Name)->
    group_leader(whereis(user),self()),
    global:register_name(Name,self()),
    io:format("[SERVER] Started on ~p and registesed as -> ~p~n",[Node,Name]),
    loop()
    .

loop()->
    receive
        {Pid,{reverse,String}} ->
            io:format("[SERVER] Recived this: ~p~n",[String]),
            
            %TODO
            %Master Slave Computation of reverse
            Reverse = reverse_string(String),
            Pid ! {response,Reverse},
            loop();
        {Pid,stop}->
            io:format("[SERVER] Stopping~n"),
            Pid ! {stopped},
            exit(normal)
    end.

rpc(Server,Msg)->
    global:whereis_name(Server) !{self(),Msg},
    receive
        Response->Response
    end.


long_reverse_string(Server,String) ->
    rpc(Server,{reverse,String})
.

stop(Server)->
     rpc(Server,stop).



reverse_string(String)->
    L = generate_process(10),

    Splitted = split_string(String,10),

    Zipped = zip_lists(L,Splitted),

    %invio la stringa al processo 
    lists:foreach(fun({Pid,S})->
        Pid ! {self(),{reverse,S}}
    end,Zipped),

    Results = loop_receive(10),
    

    lists:concat(lists:map(fun({_,Res})-> Res end,Results))
.


generate_process(N)-> generate_process(N,0,[]).
generate_process(N,N,Acc)-> lists:reverse(Acc);
generate_process(N,I,Acc)-> generate_process(N,I+1,[spawn(fun()-> slave(I) end)|Acc]).

slave(I)->

    receive
        {Pid,{reverse,[]}}->
            io:format("[SLAVE ~p] Received : Empty~n",[I]), 
            Pid! {process,I,response,[]}
            ;

        {Pid,{reverse,String}}->
            io:format("[SLAVE ~p] Received : ~p~n",[I,String]), 
            Pid! {process,I,response,lists:reverse(String)}
    end 
.

loop_receive(N)-> loop_receive(N,0,[]).
loop_receive(N,N,Acc)-> lists:sort(fun({I,_},{J,_})-> J < I end,Acc);
loop_receive(N,I,Acc)-> 
    receive
        {process,Index,response,Reverse}-> loop_receive(N,I+1,[{Index,Reverse}|Acc])
    end
    .

%M n of substrings and is equal to the n of slave process
 split_string(String,M) -> 
    N = length(String) rem M , %n parameter
    L = length(String) div M,  
    split_string(String,L,N,0,M,[])
.


split_string([],_,_,M,M,Acc)-> lists:reverse(Acc);
split_string([],L,N,Index,M,Acc)-> split_string([],L,N,Index+1,M,[[]|Acc]);
split_string(String,L,N,Index,M,Acc) when Index =< N -> 
    Slice1 = string:slice(String,L+1),
    Slice2 = string:slice(String,0,L+1),
    split_string(Slice1,L,N,Index+1,M,[Slice2|Acc])
    ;
split_string(String,L,N,Index,M,Acc) -> 
    Slice1 = string:slice(String,L+1),
    Slice2 = string:slice(String,0,L+1),
    split_string(Slice1,L,N,Index+1,M,[Slice2|Acc])
    . 

zip_lists(L1,L2)-> zip_lists(L1,L2,[]).
zip_lists([],[],Acc)-> lists:reverse(Acc);
zip_lists([H|TL],[H2|TL2],Acc)-> zip_lists(TL,TL2,[{H,H2}|Acc]).