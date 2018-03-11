%frequency(L-list,A-atom,F-frequency)
%frequency flow model (i,i,o)
frequency([],_,0).
frequency([H|T],H,F):-
    frequency(T,H,F1),
    F is F1+1.
frequency([H|T],E,F):-
    H=\=E,
    frequency(T,E,F).

%removeAll(L-list,A-atom,R-resulted list)
%removeAll flow model (i,i,o)
removeAll([],_,[]).
removeAll([H|T],H,R):-
    removeAll(T,H,R).
removeAll([H|T],E,[H|RT]):-
    H=\=E,
    removeAll(T,E,RT).


%removeRep(L-list,RL-resulted list)
%removeRep flow model (i,o)
removeRep([],[]).
removeRep([H|T],[H|RT]):-
    frequency(T,H,0),
    removeRep(T,RT).
removeRep([H|T],R):-
    frequency(T,H,F),
    F=\=0,
    removeAll(T,H,RT),
    removeRep(RT,R).

%maximum(L-list,M-max)
%maximum flow model (i,o)
maximum([M],M).
maximum([H|T],H):-
    maximum(T,M),
    H>M.
maximum([H|T],M):-
    maximum(T,M),
    H=<M.
%removeMax(L-list,R-Resulted list)
%removeMax flow model (i,o)
removeMax(L,R):-
    maximum(L,M),
    removeAll(L,M,R).
