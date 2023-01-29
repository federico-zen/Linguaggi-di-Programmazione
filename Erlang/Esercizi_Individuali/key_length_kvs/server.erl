-module(server).
-export([start/0]).


start()->
    register(server,spawn(fun()-> server_init() end )),
    ok.

server_init()->
    group_leader(whereis(user),self()),
    io:format("[SERVER] I'm Starting Up !!....~n"),
    process_flag(trap_exit,true),
    register(first_slave,spawn_link(slave,init,[])),
    server_loop().

server_loop()-> 
    receive
        {From,{store,Key,Value}}-> 
            whereis(first_slave) ! {store,Key,Value,length(atom_to_list(Key))},
            receive
                {slave,R} -> From ! {response,R}
            end,
            server_loop();

        {From,{lookup,Key}}-> 
           whereis(first_slave) ! {lookup,Key,length(atom_to_list(Key))},
            receive
                {slave,R} -> From ! {response,R}
            end,
            server_loop();
        {From,{die}} ->   
            whereis(first_slave) ! {die},
            From ! {response,dead}

    end
    .

