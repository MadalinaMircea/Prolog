%evenLength(L=list)
%evenLength flow model: (i)
evenLength([]).
evenLength([_,_|T]):-
    evenLength(T).
testEvenLength:-
    evenLength([1,2]),
    evenLength([]),
    evenLength([5,2,12,5]),
    evenLength([65,0,2,4,2,65]),
    \+ evenLength([1]),
    \+ evenLength([1,2,3]),
    \+ evenLength([12,44,23,6,21]).
