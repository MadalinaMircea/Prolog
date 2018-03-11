%contains(L-list,E-element)
%(i,i)
contains([E|_],E).
contains([H|T],E):-
    H=\=E,
    contains(T,E).
%union(L1,L2,R)
%(i,i,o)
union([],L2,L2).
union([H|T],L2,[H|RT]):-
    not(contains(L2,H)),
    union(T,L2,RT).
union([H|T],L2,R):-
    contains(L2,H),
    union(T,L2,R).

%getPairs(E-element,L-list,R-result)
%(i,i,o)
getPairs(_,[],[]).
getPairs(E,[H|T],[[E,H]|RT]):-
    getPairs(E,T,RT).

%getAllPairs(L-list,R-result)
%(i,o)
getAllPairs([],[]).
getAllPairs([H|T],R):-
    getAllPairs(T,RT),
    getPairs(H,T,RH),
    append(RH,RT,R).
