%removeAll(L-list,E-element,RL-resulted list)
%removeAll flow model (i,i,o)
removeAll([],_,[]).
removeAll([H|T],E,[H|RT]):-
    H=\=E,
    removeAll(T,E,RT).
removeAll([E|T],E,RL):-
    removeAll(T,E,RL).

%toSet(L-list,RL-resulted list)
%toSet flow model (i,o)
toSet([],[]).
toSet([H|T],[H|RT]):-
    removeAll(T,H,T1),
    toSet(T1,RT).
