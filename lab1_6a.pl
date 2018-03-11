%getFreq(L-list,E-element,R-result)
%getFreq flow model (i,i,o)
getFreq([],_,0).
getFreq([E|T],E,R):-
    getFreq(T,E,R1),
    R is R1+1.
getFreq([H|T],E,R):-
    H=\=E,
    getFreq(T,E,R).

%isSet(L-list).
%isSet flow model (i)
isSet([]).
isSet([H|T]):-
    getFreq(T,H,0),
    isSet(T).
