%generate(I-counter,N-number,Last-number,RL-resulted list)
%generate flow model (i,i,i,o)
generate(N,N,_,[0]).
generate(I,N,Last,[0|RT]):-
    I<N-1,
    Last=\=0,
    I1 is I+1,
    generate(I1,N,0,RT).
generate(I,N,Last,[1|RT]):-
    I<N,
    Last=\=1,
    I1 is I+1,
    generate(I1,N,1,RT).
generate(I,N,Last,[-1|RT]):-
    I<N,
    Last=\= -1,
    I1 is I+1,
    generate(I1,N,-1,RT).

main(Nr,RL):-
    N is 2*Nr+1,
    findall(R,generate(1,N,-2,R),RL).

tests():-
    main(0,[[0]]),
    main(2, [[0, 1, 0, 1, 0], [0, 1, 0, -1, 0], [0, 1, -1, 1, 0], [0, -1, 0, 1, 0], [0, -1, 0, -1, 0], [0, -1, 1, -1, 0], [1, 0, 1, -1, 0], [1, 0, -1, 1, 0], [1, -1, 0, 1, 0], [1, -1, 0, -1, 0], [1, -1, 1, -1, 0], [-1, 0, 1, -1, 0], [-1, 0, -1, 1, 0], [-1, 1, 0, 1, 0], [-1, 1, 0, -1, 0], [-1, 1, -1, 1, 0]]),
    main(1,[[0,1,0],[0,-1,0],[1,-1,0],[-1,1,0]]).
