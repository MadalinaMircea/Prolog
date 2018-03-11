generate(N,N,_,[0]).
generate(I,N,_,[0|RT]):-
    I=:=1,
    I1 is I+1,
    generate(I1,N,0,RT).
generate(I,N,Last,[0|RT]):-
    mod(I,2)=\=1,
    I<N-1,
    Last=\=0,
    I1 is I+1,
    generate(I1,N,0,RT).
generate(I,N,Last,[1|RT]):-
    I>1,
    I<N,
    Last=\=1,
    I1 is I+1,
    generate(I1,N,1,RT).
generate(I,N,Last,[-1|RT]):-
    I>1,
    I<N,
    Last=\= -1,
    I1 is I+1,
    generate(I1,N,-1,RT).

main(N,RL):-findall(R,generate(1,N,-2,R),RL).
