-module(fib).
-export([fibonacci/1]).


fibonacci(0) -> 0;
fibonacci(1) -> 1;
fibonacci(N) -> 
    fibonacci(N-1) + fibonacci(N-2).

