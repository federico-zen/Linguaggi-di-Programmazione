-module(even).
-export([even/1]).

even(X) when X rem 2 == 0 -> 
    true;
even(_) -> false.