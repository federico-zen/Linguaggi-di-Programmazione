-module(es1).
-export([is_palindrome/1, anagram/2, factors/1, is_proper/1]).

%Palindrom Function
is_palindrome(S) ->
    %Elimino i caratteri che non mi interessan
    L = string:casefold (lists:filter(fun(X)-> not lists:member(X,[$.,$,, $;,$?,32])end, S)),
    string:equal(lists:reverse(L),L).

%Sort Function
sort(Lst) -> lists:sort(fun(X, Y) -> X < Y end, Lst).

%Anagram Function
anagram("", _) ->
    false;
anagram(_, []) ->
    false;
anagram(Str, Lst) ->
    find_element(sort(Str), lists:map((fun(X) -> sort(X) end), Lst)).

find_element(_, []) -> false;
find_element(El, [H | Tl]) -> (El == H) or (find_element(El, Tl)).

%Factors Function using thunks
factors(N) -> factors(N,[],thunks:primes()).

factors(N,Acc,_) when (N =< 1) -> lists:reverse(Acc);
factors(N,Acc,[N|_]) -> lists:reverse([N|Acc]);
factors(N,Acc,[H|_]=P) when N rem H == 0 -> factors(N div H , [H|Acc],P) ;
factors(N,Acc,[_|Tl]) -> factors(N,Acc,Tl()). %Tl perche e' un thunks


%Proper Function
is_proper(N) -> lists:sum(all_divisor(N)) == N.

%Function For All Divisor
all_divisor(N) -> all_divisor(N, N div 2, []).

%Auxiliar Function (All_divisor)
all_divisor(_, 1, Acc) ->
    [1 | Acc];
all_divisor(N, Div, Acc) when ((N rem Div) == 0) -> all_divisor(N, Div - 1, [Div | Acc]);
all_divisor(N, Div, Acc) ->
    all_divisor(N, Div - 1, Acc).
