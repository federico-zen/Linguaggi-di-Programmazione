-module(client_lib_chan).
-export([start/0]).

start()-> 
    io:format("[CLIENT] Starterd~n"),
    {ok,MM} = lib_chan:connect("localhost",12345,reverse_string,"1234",nil),

    Test = ["I TOPI NON AVEVANO NIPOTI","","Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam porta lobortis orci. Ut aliquam in dui a rhoncus. Phasellus nulla nulla, pharetra a sollicitudin in, blandit ac eros. Sed porttitor suscipit luctus. Morbi ac risus auctor, imperdiet augue sed, sagittis leo. Nam varius interdum arcu, vitae venenatis metus molestie eget. Donec vitae nisi sit amet quam rutrum blandit vel eget tellus. Maecenas id enim tortor. In vel tempus nulla, pulvinar rhoncus orci."],
    
    lists:foreach(fun(El)-> 
        Response = lib_chan:rpc(MM,{reverse,El}),
        io:format("Response -> ~p~n",[Response]),
        io:format("CHECK : ~p~n",[El == lists:reverse(Response)])
        
    end , Test),

    io:format("Reverse with 20 processes~n"),
    lists:foreach(fun(El)-> 
        Response = lib_chan:rpc(MM,{reverse,El,20}),
        io:format("Response -> ~p~n",[Response]),
        io:format("CHECK : ~p~n",[El == lists:reverse(Response)])
        
    end , Test),

    MM ! close
    .