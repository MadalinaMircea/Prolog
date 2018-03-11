%removeElem(L-list,E-element,RL-resulted list)
%removeElem flow model (i,i,o)
removeElem([],_,[]).
removeElem([H|T],E,[H|RT]):-
    H=\=E,
    removeElem(T,E,RT).
removeElem([E|T],E,RL):-
    removeElem(T,E,RL).

%areEqual(L1-first set, L2-second set)
%areEqual flow model (i,i)
areEqual([],[]).
areEqual([H|T],L2):-
    length([H|T],N1),
    length(L2,N2),
    N1=:=N2,
    removeElem(L2,H,RL),
    areEqual(T,RL).
