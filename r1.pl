combinari(_,0,[]).
combinari([H|T],K,[H|RT]):-
    K>0,
    K1 is K-1,
    combinari(T,K1,RT).
combinari([_|T],K,R):-
    K>0,
    combinari(T,K,R).

suma([],0).
suma([H|T],R):-
    suma(T,R1),
    R is R1+H.

oneSolution(L,K,S,R):-
    combinari(L,K,R),
    suma(R,S).

allSolution(L,K,_,[]):-
    length(L,N),
    N<K.

allSolution(L,K,S,R):-
    length(L,N),
    K=<N,
    findall(RP,oneSolution(L,K,S,RP),RC),
    K1 is K+1,
    allSolution(L,K1,S,RA),
    append(RC,RA,R).

prime(_,2):-!.

prime(D,N):-
    D>N/2,!.
prime(D,N):-
    D=<N/2,
    mod(N,D)=\=0,
    prime(D+1,N).
