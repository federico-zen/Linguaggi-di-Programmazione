-module(test).
-export([test/0]).



test() ->
    counting:start(),

    counting:service1(),
    counting:service1(),
    counting:service1(),

    counting:service2(),
    counting:service2(),

    List = counting:tot(),

    io:format("Lista Servizi con Conteggio : ~n"),
    lists:foreach(
        fun({Service,N}) -> io:format("Servizio ~p : ~p~n", [Service, N]) end,
        List
    ).


