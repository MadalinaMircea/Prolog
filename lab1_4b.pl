%addOne(L-list,RL-resulted list)
%addOne flow model (i,o)
addOne([],[]).
addOne([H|T],[H,1|RT]):-
    mod(H,2)=:=0,
    addOne(T,RT).
addOne([H|T],[H|RT]):-
    mod(H,2)=\=0,
    addOne(T,RT).
