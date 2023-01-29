-module(test).
-export([test_is_plalindrome/0,test_anagram/0,test_factors/0,test_proper/0]).

test(F,L) -> 
    lists:foreach(
        fun(X)-> io:format("~p : ~p~n",[X,F(X)])end,
        L
    ).

test_is_plalindrome() ->
    test (
        fun  es1:is_palindrome/1, 
        ["i topi non avevano nipoti","anna","AbBa","Non Palindroma"]
).

test_anagram() -> 
    test(
        fun(X) -> es1:anagram(X , ["tar","arc","car"]) end,
        ["rat","vase","rac","nope"]        
).

test_factors() -> 
       test(
   fun  es1:factors/1, 
        [4,10,50,100,7,39,42,66,56]
).


test_proper() -> 
       test(
   fun  es1:is_proper/1, 
        [4,6,7,28,496,8128]
).
