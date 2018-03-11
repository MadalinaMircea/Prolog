%sum(L-list,S-sum)
%sum flow model (i,o)
sum([],0).
sum([H],H).
sum([H|T],S):-
    sum(T,S1),
    S is S1+H.
%prod(L-list,P-product)
%prod flow model (i,o)
prod([],0).
prod([H],H).
prod([H|T],P):-
    prod(T,P1),
    P is P1*H.
%insertAll(L-list,E-element,R-result)
%insertAll flow model (i,i,o)
insertAll([],E,[E]).
insertAll([H|T],E,[E,H|T]).
insertAll([H|T],E,[H|RT]):-
    insertAll(T,E,RT).
%perm(L-list,R-result)
%perm flow model
perm([],[]).
perm([H|T],R):-
    perm(T,RT),
    insertAll(RT,H,R).
%comb(L-list,K-number,R-result)
%comb flow model (i,i,o)
comb(_,0,[]).
comb([H|T],K,[H|RT]):-
    K>0,
    K1 is K-1,
    comb(T,K1,RT).
comb([_|T],K,RT):-
    K>0,
    comb(T,K,RT).
mainComb(L, K, R):-
    findall(RC, comb(L, K, RC), R).
%arr(L-list,K-number,R-result)
%arr flow model (i,i,o)
arr(L,K,R):-
    comb(L,K,R1),
    perm(R1,R).
mainarr(L,K,R):-
    findall(RP,arr(L,K,RP),R).
onesol(L,K,S,P,R):-
    arr(L,K,R),
    sum(R,S),
    prod(R,P).
main(L,K,S,P,R):-
    findall(RP,onesol(L,K,S,P,RP),R).










