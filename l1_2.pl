%removeAll(L-list,A-atom,R-resulted list)
%removeAll flow model (i,i,o)
removeAll([],_,[]).
removeAll([H|T],H,R):-
    removeAll(T,H,R).
removeAll([H|T],E,[H|RT]):-
    H=\=E,
    removeAll(T,E,RT).

%frequency(L-list,A-atom,F-frequency)
%frequency flow model (i,i,o)
frequency([],_,0).
frequency([H|T],H,F):-
    frequency(T,H,F1),
    F is F1+1.
frequency([H|T],E,F):-
    H=\=E,
    frequency(T,E,F).

%freqPairs(L-list,R-result)
%freqPairs flow model (i,o)
freqPairs([],[]).
freqPairs([H|T],[[H,F]|RT]):-
    frequency([H|T],H,F),
    removeAll(T,H,R),
    freqPairs(R,RT).
