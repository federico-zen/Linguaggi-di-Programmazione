-module(greetings).
-export([greet/2,greet_guards/3]).

greet(Name, Language) ->
    case Language of 
        polish -> io:format("Witaj,~s~n",[Name]);
        english -> io:format("Hello,~s~n",[Name]);
        italian -> io:format("Ciao,~s~n",[Name])
    end.


greet_guards(Name, Language,Age) ->
    case Language of 
        polish when Age < 18 -> io:format("Witaj,~s~n",[Name]);
        polish  -> io:format("Witaj, Panie ~s~n",[Name]);
        english when Age < 18 -> io:format("Hello,~s~n",[Name]);
        english  -> io:format("Hello, Mr. ~s~n",[Name]);
        italian when Age < 18 -> io:format("Ciao,~s~n",[Name]);
        italian -> io:format("Buongiorno, Sig. ~s~n",[Name])
    end.



