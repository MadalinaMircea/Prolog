%insertPos(L-list,E-element,P-position,I-counter,RL-resulted list)
%insertPos flow model (i,i,i,i,o)
insertPos([],E,P,P,[E]).
insertPos([],_,P,I,[]):-
    P=\=I.
insertPos([H|T],E,P,P,[E,H|RT]):-
    P1 is P+1,
    insertPos(T,E,P,P1,RT).
insertPos([H|T],E,P,I,[H|RT]):-
    P=\=I,
    I1 is I+1,
    insertPos(T,E,P,I1,RT).

insertPos(L,E,P,RL):-
    insertPos(L,E,P,1,RL).

