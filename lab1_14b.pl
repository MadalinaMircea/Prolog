%getNth(L-list,I-counter,N-number,R-result)
%getNth flow model (i,i,i,o)
getNth([],_,_,-1).
getNth([H|_],N,N,H).
getNth([_|T],I,N,R):-
    I=\=N,
    I1 is I+1,
    getNth(T,I1,N,R).
getNth(L,N,R):-
    getNth(L,1,N,R).
