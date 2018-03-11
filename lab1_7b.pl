%getIntegers(M-number,N-number,R-result)
%getIntegers flow model (i,i,o)
getIntegers(M,N,[M|RT]):-
    M=<N,
    M1 is M+1,
    getIntegers(M1,N,RT).
getIntegers(M,N,[]):-
    M>N,!.
