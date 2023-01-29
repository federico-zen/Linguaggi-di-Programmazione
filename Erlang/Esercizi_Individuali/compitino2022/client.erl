-module(client).
-export([start/0,close/0,do_reverse/1]).


start()->
    io:format("[CLIENT] Started with pid  ~p~n",[self()]),
    register(client,self()),

    Server = spawn('server@zenvm',server,start,[]),
    io:format("[CLIENT] Starting server with pid  ~p~n",[Server]),

    MM1 = spawn('mm1@zenvm',mm,start,[mm1]),
    io:format("[CLIENT] Starting MM1 with pid  ~p~n",[MM1]),

    MM2 = spawn('mm2@zenvm',mm,start,[mm2]),
    io:format("[CLIENT] Starting MM2 with pid  ~p~n",[MM2]),


    ok
.

close() -> 

    rpc('server@zenvm',server,{close}),
    rpc('mm1@zenvm',mm1,{close}),
    rpc('mm2@zenvm',mm2,{close}),

    unregister(client),
    closed
.

do_reverse(Data)->
    {Slice1,Slice2}=split_data(Data,length(Data)),
    io:format("SLICES ~p ~p ~n",[Slice1,Slice2]),
    rpc('mm1@zenvm',mm1,{data,Slice1}),
    rpc('mm2@zenvm',mm2,{data,Slice2})
.

split_data(Data,Lenght) -> lists:split(Lenght div 2 , Data).

rpc(Node,Process,Msg)->
    {Process,Node} ! {client,Msg}.


