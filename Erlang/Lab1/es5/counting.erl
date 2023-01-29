-module(counting).
-export([start/0,loop/0,service1/0,service2/0,tot/0]).


start() -> 
    io:format("Server Starting~n"),
    register(counting_server,spawn(?MODULE,loop,[]))
.



update_entry(Key)->
    put(Key,get_value(Key)+1)
.

get_value(Key)->
    case get(Key) of
        undefined -> 0;
        Value-> Value
    end

.

all_count()-> [{service1,get_value(service1)},{service2,get_value(service2)},{tot,get_value(tot)}].
   
loop()->
    receive
        {Pid,service1}-> update_entry(service1),
                    Pid ! {counting_server,ok};
        {Pid,service2}->update_entry(service2),
                    Pid ! {counting_server,ok};
        {Pid,tot}->
            update_entry(tot),
            Pid ! {counting_server,all_count()}
    end,
    loop()
.

rpc(Service) ->
    counting_server ! {self(),Service},
    receive
        {counting_server, Reply} -> Reply
end.


service1()->
    rpc(service1).

service2()->
    rpc(service2).

tot()->
    rpc(tot).