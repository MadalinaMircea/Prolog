%removeNth(L-list,I-counter,N-number,RL-resulted list)
%removeNth flow model (i,i,i,o)
removeNth([],_,_,[]).
removeNth([_|T],N,N,RL):-
    I is N+1,
    removeNth(T,I,N,RL).
removeNth([H|T],I,N,[H|RT]):-
    I=\=N,
    I1 is I+1,
    removeNth(T,I1,N,RT).
removeNth(L,N,RL):-
    removeNth(L,1,N,RL).
