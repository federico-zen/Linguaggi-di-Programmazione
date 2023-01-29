-module(factorial).
-export([factorial/1]).

%head(Arg1,.....,Argn) [when Guard1; ... ;GuardN]-> Body.
%head(Arg1,.....,Argn) [when Guard1, ... ,GuardN]-> Body. %le guardie devono essere tutte true

factorial(N) when N < 2 -> 1;
factorial(N)-> N * factorial(N-1).

%8.29 video 14