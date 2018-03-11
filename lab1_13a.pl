%getFreq(L-list,E-element,F-result)
%getFreq flow model (i,i,o)
getFreq([],_,0).
getFreq([H|T],E,F):-
    H=\=E,
    getFreq(T,E,F).
getFreq([E|T],E,F):-
    getFreq(T,E,F1),
    F is F1+1.

%toSet(L-list,RL-resulted list)
%toSet flow model (i,o)
toSet([],[]).
toSet([H|T],[H|RT]):-
    getFreq(T,H,0),
    toSet(T,RT).
toSet([H|T],RL):-
    getFreq(T,H,F),
    F>0,
    toSet(T,RL).
