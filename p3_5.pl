%oneSolution(I-number,N-number,M-number,Last-number,R-result)
oneSolution(_,0,_,_,[]).
oneSolution(I,N,M,Last,R):-
    I<N,
    abs(I-Last)<M,
    I1 is I+1,
    write(I),
    oneSolution(I1,N,M,Last,R).
oneSolution(I,N,M,Last,[I|RT]):-
    I<N,
    abs(I-Last)>=M,
    I1 is I+1,
    N1 is N-I,
    write(I),
    oneSolution(I1,N1,M,I,RT).
allSolutions(N,M,R):-
    Last is 0-M,
    findall(RP,oneSolution(1,N,M,Last,RP),R).
