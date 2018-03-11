%altSum(L-list,I-pos,S-sum)
%(i,o)
altSum([],_,0).
altSum([H|T],I,S):-
    I1 is I+1,
    altSum(T,I1,S1),
    mod(I,2)=:=0,
    S is S1-H.
altSum([H|T],I,S):-
    I1 is I+1,
    altSum(T,I1,S1),
    mod(I,2)=\=0,
    S is S1+H.
