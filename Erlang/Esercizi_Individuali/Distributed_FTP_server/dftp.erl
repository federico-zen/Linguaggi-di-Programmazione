%Exercise to create a simil FTP server with Differnte Actors as Store device, the upload is random on the servers, 
%the find will search on every server to find the one 

-module(dftp).
-export([start/2,stop/0,find/1,upload/2,all/0]).


start(Node,N)->
    spawn(Node,fun()-> server_init(Node,N) end),
    ok.
server_init(Node,N)->
    global:register_name(ftp_server,self()),
    group_leader(whereis(user),self()),
    io:format("[SERVER] Started on Node ~p with Pid ~p~n",[Node,self()]),
    L =generate_ftp_slave(N),
    loop(L).

generate_ftp_slave(N)-> generate_ftp_slave(N,0,[]).
generate_ftp_slave(N,N,Acc)-> lists:reverse(Acc);
generate_ftp_slave(N,I,Acc)-> generate_ftp_slave(N,I+1,[spawn_link(fun()-> ftp_slave(I) end)|Acc]).

loop(L)->
    receive
        {Pid,{upload,Filename,Content}} -> 
            io:format("[SERVER] Saving ~p(~p)~n",[Filename,Content]),
            %Select Random slave and save
            Slave = lists:nth(rand:uniform(length(L)),L),
            Slave ! {upload,Filename,Content},
            Pid ! {ftp_server,ok},
            loop(L)
            ;

        {Pid,{find,Filename}}->
            io:format("[SERVER] Searching For ~p~n",[Filename]),
            %seach on each server processes for Filename ,
            Content = slavesSearch(L,Filename),
            Pid!{ftp_server,{Filename,Content}},
            loop(L)
        ;

        {Pid,{all}}->

            Response = find_all_files(L),
            Pid ! lists:concat([E || E <- Response, E /= []]),
            loop(L)
            ;

        {Pid,{stop}}-> 
            io:format("[SERVER] Stopping~n"),
            Pid ! {stopped},  
            exit(normal)
    end.




rpc(Msg)->
    global:whereis_name(ftp_server)!{self(),Msg},
    receive
        Response->Response
    end
.

stop()->
    rpc({stop}).

find(Filename)-> 
    rpc({find,Filename}).

upload(Filename,Content)->
    rpc({upload,Filename,Content}).

all()->
    rpc({all}).

ftp_slave(I)->
   receive
        {upload,Filename,Content} -> 
            io:format("[SLAVE ~p] Received : ~p(~p)~n",[I,Filename,Content]),
            put(Filename,Content),
            ftp_slave(I);
        {Server,{find,Filename}}->
            io:format("[SLAVE ~p] Received : find(~p)~n",[I,Filename]),
           Response = get(Filename),
           Server ! Response,
            ftp_slave(I);
        {Server,{all}} ->
            io:format("[SLAVE ~p] Received : find(All)~n",[I]),
            Response = get(),
            Server ! Response,
            ftp_slave(I)
    end
.

slavesSearch([Pid|Tl],Filename) -> slavesSearch(Tl,Filename,search(Pid,Filename)).
slavesSearch([],_,undefined)-> not_found;
slavesSearch([],_,Result)-> Result;
slavesSearch([Pid|Tl],Filename,undefined)->slavesSearch(Tl,Filename,search(Pid,Filename));
slavesSearch(_L,_Filename,Result)->Result.


search(Pid,Filename)->
    Pid ! {self(),{find,Filename}},
    receive
        Response -> Response
    end
.

find_all_files(L) ->  find_all_files(L,[]).
find_all_files([],Acc) -> lists:reverse(Acc);
find_all_files([Pid|Tl],Acc) -> 
        Pid ! {self(),{all}},
        receive
            Response -> find_all_files(Tl,[Response|Acc])
        end
    .


