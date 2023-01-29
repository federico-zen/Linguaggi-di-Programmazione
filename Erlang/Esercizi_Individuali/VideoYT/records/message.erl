-module(message).
-include("message.hrl").
-export([print_message/1,update_sender/2,is_message/1]).

print_message(#message{sender=S,receiver = R ,text = T}=M)->
    io:format("Message ~n"),
    io:format("From: ~s~n",[S]),
    io:format("To: ~s~n",[R]),
    io:format("Text: ~s~n",[T]),
    io:format("All: ~p~n",[M]).

update_sender(Sender,#message{}=M)->
    M#message{sender=Sender}.

is_message(X)  when is_record(X,message) -> true;
is_message(_) -> false.