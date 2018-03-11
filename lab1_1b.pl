%addElem(L-list,I-counter,V-element,RL-resulted list)
%addElem flow model (i,i,i,o)
addElem([],_,_,_,[]).
addElem([H|T],I,P,V,[H,V|RT]):-
    I=:=2**P,
    addElem(T,I+1,P+1,V,RT).
addElem([H|T],I,P,V,[H|RT]):-
    I=\=2**P,
    addElem(T,I+1,P,V,RT).
mainAddElem(L,V,RL):-
    addElem(L,1,0,V,RL).
