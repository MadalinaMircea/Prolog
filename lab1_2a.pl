%removeAtom(L-list,A-atom,RL-resulted list)
%removeAtom flow model (i,i,o)
removeAtom([],_,[]).
removeAtom([H|T],A,RL):-
    H=:=A,
    removeAtom(T,A,RL).
removeAtom([H|T],A,[H|RT]):-
    H=\=A,
    removeAtom(T,A,RT).


%getFreq(L-list,A-atom,R-result)
%getFreq flow model (i,i,o)
getFreq([],_,0).
getFreq([A|T],A,R):-
    getFreq(T,A,R1),
    R is R1+1.
getFreq([H|T],A,R):-
    H=\=A,
    getFreq(T,A,R).

%getPairs(L-list,R-result).
%getPairs flow model (i,o)
getPairs([],[]).
getPairs([H|T],[[H,F]|RT]):-
    getFreq([H|T],H,F),
    removeAtom([H|T],H,NL),
    getPairs(NL,RT).
