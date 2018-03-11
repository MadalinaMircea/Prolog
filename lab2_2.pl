%getMin(L-list,M-result)
%getMin flow model (i,o)
getMin([H],H).
getMin([H|T],M):-
    getMin(T,M1),
    M1<H,
    M is M1.
getMin([H|T],H):-
    getMin(T,M1),
    H=<M1.

%removeFirst(L-list,E-element,RL-resulted list)
%removeFirst flow model (i,i,o)
removeFirst([],_,[]).
removeFirst([H|T],E,[H|RT]):-
    H=\=E,
    removeFirst(T,E,RT).
removeFirst([E|T],E,T).

%sortDiff(L-list,RL-resulted list)
%sortDiff flow model (i,o)
sortDiff([],[]).
sortDiff(L,[M|RT]):-
    getMin(L,M),
    removeFirst(L,M,RL),
    sortDiff(RL,RT).

prelucrare([],[]).
prelucrare([H|T],[RH|RT]):-
    is_list(H),
    print(H),
    sortDiff(H,RH),
    prelucrare(T,RT).
prelucrare([H|T],[H|RT]):-
    \+is_list(H),
    prelucrare(T,RT).
