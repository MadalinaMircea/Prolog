%substitute(L-list,E-elem,N-new,R-result).
%(i,i,i,o)
substitute([],_,_,[]).
substitute([E|T],E,N,[N|RT]):-
    substitute(T,E,N,RT).
substitute([H|T],E,N,[H|RT]):-
    H=\=E,
    substitute(T,E,N,RT).
