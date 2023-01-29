-module(test).
-export([test_square/0, test_intersect/0, test_difference/0]).

test(F, L) ->
    lists:foreach(
        fun(X) -> io:format("~p : ~p~n", [X, F(X)]) end,
        L
    ).

test_square() ->
    test(
        fun list_comp:squared_int/1,
        [[1, hello, 100, boo, "boo", 9]]
    ).
test_intersect() ->
    test(
        fun(X) -> list_comp:intersect(X, [4, 5, 6, 7, 8]) end,
        [[1, 2, 3, 4, 5], [4], [4, 5, 6, 7, 8]]
    ).

test_difference() ->
    test(
        fun(X) -> list_comp:symmetric_difference(X, [4, 5, 6, 7, 8]) end,
        [[1, 2, 3, 4, 5], [4], [4, 5, 6, 7, 8]]
    ).
