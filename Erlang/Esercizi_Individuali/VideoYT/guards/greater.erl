-module(greater).
-export([is_sum_greater/2]).

is_sum_greater(X,Y) when X+Y > 50 -> 
    true;
is_sum_greater(X,Y )-> false.

