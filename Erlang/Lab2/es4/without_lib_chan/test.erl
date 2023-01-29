-module(test).
-export([start/1]).

start(Node)->
    drs:start(Node,server),
    timer:sleep(1000),

    Test = ["I TOPI NON AVEVANO NIPOTI","ABCDEFGHILMNOPQRSTUVZ","Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam porta lobortis orci. Ut aliquam in dui a rhoncus. Phasellus nulla nulla, pharetra a sollicitudin in, blandit ac eros. Sed porttitor suscipit luctus. Morbi ac risus auctor, imperdiet augue sed, sagittis leo. Nam varius interdum arcu, vitae venenatis metus molestie eget. Donec vitae nisi sit amet quam rutrum blandit vel eget tellus. Maecenas id enim tortor. In vel tempus nulla, pulvinar rhoncus orci."],
    
    lists:foreach(fun(El)->
        {response,Reverse} = drs:long_reverse_string(server,El),
        %io:format("Reverse: ~s~n",[Reverse]),
        io:format("CHECK: ~p~n",[Reverse == lists:reverse(El)])

    end,Test),

   
    drs:stop(server),

    ok
.

    

    