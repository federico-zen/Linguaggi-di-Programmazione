%To reverse the order of the characters in a string is quite trivial but when the length of the string grows trivial could means extremely slow.
% To decompose the input string in shorter strings and to join back the inverted strings in order to keep the algorithm working always 
% on a short input is a good idea to fast the process.

%Write a master-slave (see the previous exercise) distributed system where:

%a server process (MasterProcess) provides a service called long_reverse_string() that given a very large string (≥ 1000 characters) 
%returns the reversed string;

%the service long_reversed_string() decomposes the input w into 10 strings w⁰, ..., w⁹ with the following 
%lengths (# represents the operator length of a string, and n=#w%10): #w⁰=...=#wⁿ=#w/10+1 e #wⁿ⁺¹=...=#w⁹=#w/10 and forwards to
% 10 distinct actors (SlaveProcess) to reverse the 10 substrings w⁰, ..., w⁹ (service reverse_string()) and joins the 10 results.

%the client process (ClientProcess) just ask for the service on a given string.

%When done with the exercise try to relax the constraint on the number of substrings from ten to a generic M passed as an 
%input to the long_reversed_string service.

-module(drs_lib_chan).
-export([start/3,long_reverse_string/1,long_reverse_string/2]).

start(MM,_ArgsC,_ArgS)->
    io:format("[MASTER] Process Started! ~n"),
    loop(MM).

loop(MM)->
    receive
    {chan,MM,{reverse,String}} -> 
        io:format("[MASTER] Recived From Client : ~s~n",[String]),
        ReverseString = long_reverse_string(String),
        MM ! {send,ReverseString},
        loop(MM);

    {chan,MM,{reverse,String,M}} -> 
        io:format("[MASTER] Recived From Client : ~s~n",[String]),
        ReverseString = long_reverse_string(String,M),
        MM ! {send,ReverseString},
        loop(MM);

    {chan_closed,MM} -> io:format("[MASTER] Closed Connection with Client !~n"),
     exit(normal)
    end
.

%Generate 10 Actors to compute the reverse
long_reverse_string(String) -> 
    L = generateProcess(10),
    
    Splitted = split_string(String,10),
    
    Zipped =zip_lists(L,Splitted),

    Reverse = lists:map(fun({Pid,S})-> 
        Pid ! {self(),{reverse,S}},
        receive
            {ok,Response}->Response
        end
        
    end ,Zipped),

    lists:concat(lists:reverse(Reverse))
.
%Generate M Actors to compute the reverse
long_reverse_string(String,M) -> 
    L = generateProcess(M),
   
    Splitted = split_string(String,M),
    
    Zipped =zip_lists(L,Splitted),

    Reverse = lists:map(fun({Pid,S})-> 
        Pid ! {self(),{reverse,S}},
        receive
            {ok,Response}->Response
        end
        
    end ,Zipped),

    lists:concat(lists:reverse(Reverse))
.

%Generate M Slaves
generateProcess(M) -> generateProcess(0,M,[]).
generateProcess(M,M,Acc) -> lists:reverse(Acc);
generateProcess(I,M,Acc)-> generateProcess(I+1,M,[spawn_link(fun()-> slave(I) end)|Acc]).

slave(I)->
    io:format("[SLAVE ~p] Ready ~n",[I]),
    receive 
        {Pid,{reverse,String} }->
           io:format("[SLAVE ~p] Recived : ~s ~n",[I,String]),
            Reverse = lists:reverse(String),
            Pid ! {ok,Reverse};
        {_,die} -> io:format("[SLAVE ~p] Dying ~n",[I])
    end.
    
%Function to create a list of tuple represent Pid->String to send the correct messages
zip_lists(L1,L2)-> zip_lists(L1,L2,[]).
zip_lists([],[],Acc)-> lists:reverse(Acc);
zip_lists([H|TL],[H2|TL2],Acc)-> zip_lists(TL,TL2,[{H,H2}|Acc]).

%M n of substrings and is equal to the n of slave process
 split_string(String,M) -> 
    N = length(String) rem M , %n parameter
    L = length(String) div M,  
    io:format("N(~p),L(~p)~n",[N,L]),

    split_string(String,L,N,0,M,[]).


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