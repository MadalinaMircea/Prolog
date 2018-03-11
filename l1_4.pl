%contains(L-list,E-element)
%(i,i)
contains([E|_],E).
contains([H|T],E):-
    H=\=E,
    contains(T,E).

%difference(L1,L2,R)
%(i,i,o)
difference([],_,[]).
difference([H|T],L2,[H|R]):-
    not(contains(L2,H)),
    print(H),
    difference(T,L2,R).
difference([H|T],L2,R):-
    contains(L2,H),
    difference(T,L2,R).

%addOne(L,R)
%(i,o)
addOne([],[]).
addOne([H|T],[H,1|RT]):-
    mod(H,2)=:=0,
    addOne(T,RT).
addOne([H|T],[H|RT]):-
    mod(H,2)=\=0,
    addOne(T,RT).
