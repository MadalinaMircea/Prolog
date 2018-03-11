%alternate(L-list,I-counter,S-sum)
%alternate flow model (i,i,o)
alternate([],_,0).
alternate([H|T],I,S):-
    mod(I,2)=\=0,
    I1 is I+1,
    alternate(T,I1,S1),
    S is S1+H.
alternate([H|T],I,S):-
    mod(I,2)=:=0,
    I1 is I+1,
    alternate(T,I1,S1),
    S is S1-H.
alternate(L,S):-
    alternate(L,1,S).
