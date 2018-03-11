%removeThree(L-list,K-number,E-element,RL-resulted list)
%removeThree flow model (i,i,o)
removeThree([],_,_,[]).
removeThree([H|T],K,E,[H|RT]):-
    H=\=E,
    removeThree(T,K,E,RT).
removeThree([E|T],K,E,RL):-
    K>0,
    removeThree(T,K-1,E,RL).
removeThree([E|T],K,E,[E|RT]):-
    K=:=0,
    removeThree(T,K,E,RT).
removeThree(L,E,RL):-
    removeThree(L,3,E,RL).
