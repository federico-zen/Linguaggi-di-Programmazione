-module(range).
-export([range/1,range_seq/1]).

%Devono essere tutte true 
range(N) when is_integer(N), N> 10 , N< 100 ->
     io:format("~w is in range ~n",[N]);
range(N) -> 
    io:format("~w is not in range ~n",[N]).


%Guard Sequence (Almeno una guardia deve essere true)
range_seq(N) when is_integer(N); N> 10 ; N< 100->
    io:format("~w is in range ~n",[N]);
range_seq(N) -> 
    io:format("~w is not in range ~n",[N]).

%Questa funzione non puo essere usata nelle guardie, posso usare solo le Bif
%is_A(X) -> 
%   X == "A".

