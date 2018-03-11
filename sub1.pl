%reverse(L-list,R-resulted list)
%(i,o)
myreverse([],[]).
myreverse([H|T],[RH|RT]):-
    is_list(H),
    myreverse(T,RT),
    myreverse(H,RH).
myreverse([H|T],[H|RT]):-
    atomic(H),
    myreverse(T,RT).


%removethree(L-list,K-number,E-element,R-result)
%(i,i,i,o)
removethree([],_,_,[]).
removethree(L,3,_,L).
removethree([H|T],K,E,[H|R]):-
    H=\=E,
    removethree(T,K,E,R).
removethree([E|T],K,E,R):-
    K<3,
    K1 is K+1,
    removethree(T,K1,E,R).

count([], _, 0).
count([H|T], E, R):-
    H =:= E,
    count(T, E, R2),
    R is R2 + 1.
count([H|T], E, R):-
    H =\= E,
    count(T, E, R).

isSet([]).
isSet([H|T]):-
    count(T,H,0),
    isSet(T).

combinari(_,0,[]).
combinari([H|T],K,[H|R]):-
    K>0,
    K1 is K-1,
    combinari(T,K1,R).
combinari([_|T],K,R):-
    K>0,
    combinari(T,K,R).
oneSolution(L,K,R):-
    combinari(L,K,R),
    isSet(R).
main(L,K,R):-
    findall(RP,oneSolution(L,K,RP),R).

contains([E|_],E).
contains([H|T],E):-
    H=\=E,
    contains(T,E).

toSet1([],[]).
toSet1([H|T],[H|RT]):-
    toSet1(T,RT),
    not(contains(RT,H)).
toSet1([H|T],RT):-
    toSet1(T,RT),
    contains(RT,H).

removeAll([],_,[]).
removeAll([H|T],E,[H|R]):-
    H=\=E,
    removeAll(T,E,R).
removeAll([E|T],E,R):-
    removeAll(T,E,R).

toSet2([],[]).
toSet2([H|T],[H|RT]):-
    removeAll(T,H,T2),
    toSet2(T2,RT).

inserare([],E,[E]).
inserare([H|T],E,[E,H|T]).
inserare([H|T],E,[H|RT]):-
    inserare(T,E,RT).

permutari([],[]).
permutari([H|T],R):-
    permutari(T,RP),
    inserare(RP,H,R).

comb(_,0,[]).
comb([H|T],K,[H|RT]):-
    K>0,
    K1 is K-1,
    comb(T,K1,RT).
comb([_|T],K,R):-
    K>0,
    comb(T,K,R).

aranjamente(L,K,R):-
    comb(L,K,RC),
    permutari(RC,R).

prod([],1).
prod([H|T],P):-
    prod(T,P1),
    P is P1*H.

oneSol(_,K,N,_,[]):-
    K>N.
oneSol(L,K,R):-
    combinari(L,K,R).

allSolutions(L,K,[]):-
    length(L,N),
    N<K.
allSolutions(L,K,R):-
    length(L,N),
    K=<N,
    findall(RP,oneSol(L,K,RP),RA),
    K1 is K+2,
    allSolutions(L,K1,RN),
    append(RA,RN,R).

%removeN(L-list,N-number,I-position,P-number,R-result)
%(i,i,i,i,o)
removeN([],_,_,_,[]).
removeN([_|T],N,I,P,R):-
    I=:=N*P,
    I1 is I+1,
    P1 is P*2,
    removeN(T,N,I1,P1,R).
removeN([H|T],N,I,P,[H|RT]):-
    I<N*P,
    I1 is I+1,
    removeN(T,N,I1,P,RT).

