%interclasare(L1-first list, L2-second list, RL-resulted list).
%interclasare flow model (i,i,o)
interclasare([],[],[]).
interclasare([],[H|T],[H|RT]):-
    interclasare([],T,RT).
interclasare([H|T],[],[H|RT]):-
    interclasare(T,[],RT).
interclasare([H1|T1],[H2|T2],[H1|RT]):-
    H1<H2,
    interclasare(T1,[H2|T2],RT).
interclasare([H1|T1],[H2|T2],[H2|RT]):-
    H1>=H2,
    interclasare([H1|T1],T2,RT).

tests():-
    interclasare([1,2,3,5,7],[2,4,6,8],[1,2,2,3,4,5,6,7,8]),
    interclasare([1,2,3,4,5],[1,2,3,4,5],[1,1,2,2,3,3,4,4,5,5]),
    interclasare([1,2,3,4,5],[6,7,8],[1,2,3,4,5,6,7,8]),
    interclasare([1,2,3,4],[2,3,4,5,6],[1,2,2,3,3,4,4,5,6]).
