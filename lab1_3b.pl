%removeAtom(L-list,A-atom,RL-resulted list)
%removeAtom flow model (i,i,o)
removeAtom([],_,[]).
removeAtom([H|T],A,RL):-
    H=:=A,
    removeAtom(T,A,RL).
removeAtom([H|T],A,[H|RT]):-
    H=\=A,
    removeAtom(T,A,RT).

%getMax(L-list,R-result)
%getMax flow model (i,o)
getMax([H],H).
getMax([H|T],R1):-
    getMax(T,R1),
    R1>H.
getMax([H|T],H):-
    getMax(T,R1),
    R1=<H.

%removeMax(L-list,M-max number,RL-resulted list)
%removeMax flow model (i,o)

removeMax([],_,[]).
removeMax([M|T],M,RL):-
    removeMax(T,M,RL).
removeMax([H|T],M,[H|RT]):-
    H=\=M,
    removeMax(T,M,RT).

removeMax(L,RL):-
    getMax(L,M),
    removeMax(L,M,RL).

