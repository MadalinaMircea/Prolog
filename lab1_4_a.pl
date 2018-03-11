%contains(L-list,E-element)
%contains flow model (i,i)
contains([H|T],E):-
    E=\=H,
    contains(T,E).
contains([E|_],E).

%setDif(L1-first set,L2-second set,RL-resulted list)
%setDif flow model (i,i,o)
setDif([],_,[]).
setDif([H1|T1],R2,RL):-
    contains(R2,H1),
    setDif(T1,R2,RL).
setDif([H1|T1],R2,[H1|RT]):-
    \+contains(R2,H1),
    setDif(T1,R2,RT).
