-module(test).
-export([start/0]).

%to work it need 2 node named b and c running on a hostname named zenvm

start()->
    es2:start('b@zenvm',node1),
    es2:start('c@zenvm',node2),
    es2:start('d@zenvm',node3),

    timer:sleep(1000),

    es2:store(node1,key1,"Value1"),
    es2:store(node2,key2,"Value2"),

    timer:sleep(1000),

    io:format("Lookup on node3 for key2 : ~p~n" , [es2:lookup(node3,key2)]),
    io:format("Lookup on node3 for key1 : ~p~n" , [es2:lookup(node3,key1)]),

    timer:sleep(1000),

    es2:stop(node1),
    es2:stop(node2),
    es2:stop(node3)
    .