%getFreq(L-list,A-atom,R-result)
%getFreq flow model (i,i,o)
getFreq([],_,0).
getFreq([A|T],A,R):-
    getFreq(T,A,R1),
    R is R1+1.
getFreq([H|T],A,R):-
    H=\=A,
    getFreq(T,A,R).

%removeAtom(L-list,A-atom,RL-resulted list)
%removeAtom flow model (i,i,o)
removeAtom([],_,[]).
removeAtom([H|T],A,RL):-
    H=:=A,
    removeAtom(T,A,RL).
removeAtom([H|T],A,[H|RT]):-
    H=\=A,
    removeAtom(T,A,RT).

%removeRep(L-list,RL-resulted list)
%removeRep flow model
removeRep([],[]).
removeRep([H|T],RL):-
    getFreq(T,H,F),
    F>0,
    removeAtom([H|T],H,R),
    removeRep(R,RL).
removeRep([H|T],[H|RT]):-
    getFreq(T,H,0),
    removeRep(T,RT).
