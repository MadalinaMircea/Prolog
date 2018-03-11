sublist([],[]).
sublist([H|T],[H|TR]):-
    sublist(T,TR).
sublist([_|T],RT):-
    sublist(T,RT).

main(L,R):-
    findall(RP,ascending(L,0,RP),R).
