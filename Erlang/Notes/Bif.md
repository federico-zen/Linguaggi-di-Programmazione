Bif sono le funzioni Build-In-Functions , sono le funzioni primitive della macchian virtuale Erlang. 

La maggiorparte delle BIF sono scritte nel modulo erlang e sono autoimportate, posso chiamarle senza richiamare il modulo.

```erlang
%Current Date
date().

%Current Time 
time().

%Process ID
self().

%check if is a tuple
is_tuple("123"). %false
is_tuple({1,2,3}). %true

%lenght of list
L=[1,2,3,4].
lenght(L).

```