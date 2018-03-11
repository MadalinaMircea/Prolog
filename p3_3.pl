%nu merge
sum([],0).
sum([H|T],R):-
    sum(T,R1),
    R is R1+H.

oneSol(_,N,N,[]).
oneSol(I,S,N,[I|T]):-
    S+I=<N,
    I1 is I+1,
    S1 is S+I,
    oneSol(I1,S1,N,T).

allSol(N,R):-
    findall(RP,oneSol(1,0,N,RP),R).
