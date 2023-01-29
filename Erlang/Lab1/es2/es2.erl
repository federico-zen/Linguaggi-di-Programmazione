-module(es2).
-export([evaluate/1,parse/1,is_balanced/1]).

evaluate({num, N})-> N;
evaluate({plus,A,B}) -> evaluate(A)+evaluate(B);
evaluate({minus,A,B}) -> evaluate(A)-evaluate(B);
evaluate({mul,A,B}) -> evaluate(A)*evaluate(B);
evaluate({divide,A,B}) -> evaluate(A) / evaluate(B);
evaluate({inv,A}) -> 0-evaluate(A).



%Prende l'espressione e la trasforma in notazione polacca
parse(Exp)-> parse(Exp,[]).

%caso Dello spazio
parse([$ |TL],Acc) -> parse(TL,Acc);
%caso cui è finita l'espressione 
parse([],[H|_]) -> H;
%caso operatori
parse([$+|TL],[A,B|Acc])-> parse(TL,[{plus,B,A}|Acc]);
parse([$-|TL],[A,B|Acc])-> parse(TL,[{minus,B,A}|Acc]);
parse([$*|TL],[A,B|Acc])-> parse(TL,[{mul,B,A}|Acc]);
parse([$/|TL],[A,B|Acc])-> parse(TL,[{divide,B,A}|Acc]);
parse([$~|TL],[A|Acc])-> parse(TL,[{inv,A}|Acc]);
%Caso numero
parse([A|TL],Acc)-> parse(TL,[{num,list_to_integer([A])}|Acc]).

%funzione che vede se l' espressione è bilanciata
is_balanced(Exp) -> is_balanced(Exp,[]).
is_balanced([],[])-> true;
is_balanced([],[_])-> false;
is_balanced([41|_],[])  -> false;
is_balanced([40|T],Acc) -> is_balanced(T,["("|Acc]);
is_balanced([41|T],[_|Acc]) -> is_balanced(T,Acc).


%(2+3)*4 -> 2 3 + 4 * 
%TODO

%convert_to_polish(Exp) -> convert_to_polish(Exp,[],[]).


