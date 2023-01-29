-module(list_comp).
-export([squared_int/1,intersect/2,symmetric_difference/2]).

%squared_int that removes all non-integers from a polymorphic
% list and returns the resulting list of integers squared, e.g., 
% squared_int([1, hello, 100, boo, “boo”, 9]) should return [1, 10000, 81].

%Versione Senza List Comprehensions
%squared_int(L) -> squared_int(L,[]).
%Aux Functions
%squared_int([],ACC) -> lists:reverse(ACC);
%squared_int([H|TL],ACC) when is_integer(H) -> squared_int(TL,[H*H|ACC]);
%squared_int([_|TL],ACC) -> squared_int(TL,ACC). 

squared_int(L)-> [El*El||El<-L, is_integer(El)].


%intersect that given two lists, returns a new list that is the intersection 
%of the two lists (e.g., intersect([1,2,3,4,5], [4,5,6,7,8]) should return [4,5]).
intersect(L,L2) -> [El|| El <-L,lists:member(El,L2)].


%symmetric_difference that given two lists, returns a new list that is the symmetric
%difference of the two lists.
%For example symmetric_difference([1,2,3,4,5], [4,5,6,7,8]) should return [1,2,3,6,7,8].

symmetric_difference(L,L2) ->[El|| El <-L,not(lists:member(El,L2))] ++ [El|| El <-L2,not(lists:member(El,L))] .