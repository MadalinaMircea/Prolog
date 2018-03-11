comb(_,0,[]).
comb([H|T],K,[H|RT]):-
K>0,
K1 is K-1,
comb(T,K1,RT).
comb([_|T],K,R):-
K>0,
comb(T,K,R).

freq([],_,0).
freq([H|T],E,F):-
freq(T,E,F1),
H=\=E,
F is F1.
freq([H|T],H,F):-
freq(T,H,F1),
F is F1+1.
%isSet(L,Pr)
%isSet flow model (i)
isSet([]).
isSet([H|T]):-
freq(T,H,0),
isSet(T).

oneSol(L,K,R):-
comb(L,K,R),
isSet(R).

main(L,K,R):-
findall(RP,oneSol(L,K,RP),R).
