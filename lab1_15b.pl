%getOdds(L-list,RL-resulted list)
%getOdds flow model (i,o)
getOdds([],[],0).
getOdds([H|T],[H|RT],NO):-
    mod(H,2)=\=0,
    getOdds(T,RT,NO1),
    NO is NO1+1.
getOdds([H|T],RL,NO):-
    mod(H,2)=:=0,
    getOdds(T,RL,NO).

%getEvens(L-list,RL-resulted list)
%getEvens flow model (i,o)
getEvens([],[],0).
getEvens([H|T],[H|RT],NE):-
    mod(H,2)=:=0,
    getEvens(T,RT,NE1),
    NE is NE1+1.
getEvens([H|T],RL,NE):-
    mod(H,2)=\=0,
    getEvens(T,RL,NE).


%appendList(L-list,L2-list to append,RL-resulted list)
%appendList flow model (i,i,o)
appendList([],L2,L2).
appendList([H|T],L2,[H|RT]):-
    appendList(T,L2,RT).

%getEvensOdds(L-list,RL-resulted list).
%getEvensOdds flow model (i,o)
getEvensOdds(L,RL,NE,NO):-
    getEvens(L,E,NE),
    getOdds(L,O,NO),
    appendList(E,O,RL).






