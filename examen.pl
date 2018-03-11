f([],_,0).
f([H|T],V,S):-!,H>V,f(T,V,S1),S is S1*V.
f([_|T],V,S):-f(T,V,S).

addElem([],_,_,_,_,[]).
addElem([H|T],I,Last,N,E,[H,E|R]):-
    I=:=N+Last,
    I1 is I+1,
    N1 is N+1,
    addElem(T,I1,I,N1,E,R).
addElem([H|T],I,Last,N,E,[H|R]):-
    I=\=N+Last,
    I1 is I+1,
    addElem(T,I1,Last,N,E,R).

addElem(L,E,R):-
    addElem(L,1,0,1,E,R).

getSet(I,N,[]):-I>N.
getSet(I,N,[I|T]):-
    I=<N,
    I1 is I+1,
    getSet(I1,N,T).

inserare([],E,[E]).
inserare([H|T],E,[E,H|T]).
inserare([H|T],E,[H|RT]):-
    inserare(T,E,RT).

perm([],[]).
perm([H|T],R):-
    perm(T,RP),
    inserare(RP,H,R).

check([]).
check([E]).
check([H1,H2|T]):-
    H1-H2>=2,
    check([H2|T]).
check([H1,H2|T]):-
    H2-H1>=2,
    check([H2|T]).

oneSolution(L,R):-
    perm(L,R),
    check(R).

allSolutions(N,R):-
    getSet(1,N,L),
    findall(RP,oneSolution(L,RP),R).
