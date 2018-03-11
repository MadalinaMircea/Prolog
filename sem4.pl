%inserare(L-list, E-number, LR-resulted list)
%inserare flow model (i,i,o)
inserare([],E,[E]).
inserare([H|T],E,[E,H|T]).
inserare([H|T],E,[H|RT]):-inserare(T,E,RT).

%permutari(L-list,LR-resulted list)
%permutari flow model (i,o)
permutari([],[]).
permutari([H|T],PR):-
    permutari(T,PR1),
    inserare(PR1,H,PR).

mainPermutari(L,R2):-findall(RP,permutari(L,RP),R2).

%combinari(L-list,K-number,RL-resulted list)
%combinari flow model (i,i,o)
combinari(_,0,[]).
combinari([H|T],K,[H|TR]):-
    K>0,
    combinari(T,K-1,TR).
combinari([_|T],K,L):-
    K>0,
    combinari(T,K,L).

mainCombinari(L,K,R):-
    findall(RC,combinari(L,K,RC),R).

%aranjamente(L-list,K-number,R-list)
%aranjamente flow model (i,i,o)
aranjamente(L,K,R):-
    combinari(L,K,RC),
    permutari(RC,R).

suma([],S,S).
suma([H|T],SC,S):-suma(T,SC+H,S).

produs([],P,P).
produs([H|T],PC,P):-produs(T,PC*H,P).

oneSolution(L,K,S,P,R):-
    aranjamente(L,K,R1),
    suma(R1,0,S),
    produs(R1,1,P),
    append([],R1,R).
allSolutions(L,K,S,P,RAll):-
    findall(ROS,oneSolution(L,K,S,P,ROS),RAll).
