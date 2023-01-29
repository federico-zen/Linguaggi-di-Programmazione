-module(client).
-export([start/0,run/0]).


start()->
    echo:start(), %Start Server
    io:format("Starting Client~n"),
    spawn_link(client,run,[]).


run() -> 
    register(client,self()),
    link(whereis(echo_server)),
    whereis(echo_server)! {self(),"Hello from Client"},
    whereis(echo_server)!stop
.

