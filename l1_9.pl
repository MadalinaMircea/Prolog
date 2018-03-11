%insertN(L-list,N-pos,E-elem,R-result)
%(i,i,i,o)
insertN([],_,_,[]).
insertN([H|T],1,E,[E,H|T]).
insertN([H|T],N,E,[H|RT]):-
    N>1,
    N1 is N-1,
    insertN(T,N1,E,RT).
