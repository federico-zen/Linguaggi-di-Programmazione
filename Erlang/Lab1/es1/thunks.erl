%Generatore
-module(thunks).
-export([from/1,first/1,is_prime/1,primes/0]).

from(K) -> [K | fun() -> from(K + 1) end].

%Dobbiamo Reimplementare le funzioni perche la struttura dati sottostante e' differente
filter(_,[]) -> [];
filter(P,[H|Tl]) -> 
    case P(H) of
        true ->  [H | fun()-> filter(P,Tl()) end]; %Tl() perche devo andare avanti e generare l'elemento eseguendo la coda
        false ->  filter(P,Tl())
    end.

sift(P,L) -> 
    filter(fun(N) -> N rem P  /= 0  end , L).

sieve([H|Tl]) -> [H| fun()->sieve(sift(H,Tl())) end ].

primes() -> sieve(from(2)).

is_prime(N) -> is_prime(N,primes()).

is_prime(N,[N|_]) -> true;
is_prime(N,[M|Tl]) when(M < N)-> is_prime(N,Tl());
is_prime(_,_) -> false. 

first(N) -> first(N,primes()).
first(0,_) -> [];
first(N,[X|P]) -> [X|first(N-1,P())].

