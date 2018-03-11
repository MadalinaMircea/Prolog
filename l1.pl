%a(L-list, I-position, N-position, E-element)
%a flow model (i,i,o)
a([],_,_,[]).
a([H|_],N,N,H).
a([_|T],I,N,E):-
    I<N,
    I1 is I+1,
    a(T,I1,N,E).
a(_,I,N,[]):-
    I>N.

%l1b(L-list, Last-last position, I-position, V-value, R-resulted list)
%l1b flow model (i,i,o)
l1b([],_,_,_,[]).
l1b([H|T],_,1,V,[H,V|RT]):-
    l1b(T,1,2,V,RT).
l1b([H|T],Last,I,V,[H,V|RT]):-
    I=:=Last*2,
    I1 is I+1,
    l1b(T,I,I1,V,RT).
l1b([H|T],Last,I,V,[H|RT]):-
    I=\=Last*2,
    I1 is I+1,
    l1b(T,Last,I1,V,RT).
