%contains(L-list,E-elem)
%contains flow model (i,i)
contains([H|_],H).
contains([H|T],E):-
    H=\=E,
    contains(T,E).

%intersection(L1-first set, L2-second set, R-resulted list)
%intersection flow model (i,i,o)
intersection([],_,[]).
intersection([H|T],L2,[H|RT]):-
    contains(L2,H),
    intersection(T,L2,RT).
intersection([H|T],L2,R):-
    \+contains(L2,H),
    intersection(T,L2,R).
