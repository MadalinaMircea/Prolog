%removeElem(L-list,E-element,RL-resulted list)
%removeElem flow model (i,i,o)
removeElem([],_,[]).
removeElem([E|T],E,RL):-
    removeElem(T,E,RL).
removeElem([H|T],E,[H|RT]):-
    H=\=E,
    removeElem(T,E,RT).

%union(L1-first set, L2-second set,RL-result)
%union flow model (i,i,o)
union([],L2,L2).
union(L1,[],L1).
union([H|T],L2,[H|RT]):-
    removeElem(L2,H,R2),
    union(T,R2,RT).
