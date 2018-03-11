%inserare(L-list,E-element,R-resulted list)
%(i,i,o)
inserare([],E,[E]).
inserare([H|T],E,[E,H|T]).
inserare([H|T],E,[H|R]):-
    inserare(T,E,R).

%permutari(L-list,R-resulted list)
%(i,o)
permutari([],[]).
permutari([H|T],R):-
    permutari(T,RP),
    inserare(RP,H,R).

%combinari(L-list,K-number,R-resulted list)
%combinari (i,i,o)
combinari(_,0,[]).
combinari([H|T],K,[H|RT]):-
    K>0,
    K1 is K-1,
    combinari(T,K1,RT).
combinari([_|T],K,R):-
    K>0,
    combinari(T,K,R).

%aranjamente(L-list,K-number,R-resulted list)
%aranjamente (i,i,o)
aranjamente(L,K,R):-
    combinari(L,K,RC),
    permutari(RC,R).

suma([],C,C).
suma([H|T],C,R):-
    C1 is C+H,
    suma(T,C1,R).

produs([],C,C).
produs([H|T],C,R):-
    C1 is C*H,
    produs(T,C1,R).

oneSolution(L,K,S,P,R):-
    aranjamente(L,K,R),
    suma(R,0,S),
    produs(R,1,P).

allSolutions(L,K,S,P,R):-
    findall(RP,oneSolution(L,K,S,P,RP),R).
