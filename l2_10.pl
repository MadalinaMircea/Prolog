%prime(N, D)
%(i)
prime(2,_).
prime(N,D):-
    D>N/2.
prime(N,D):-
    D=<N/2,
    mod(N,D)=\=0,
    D1 is D+1,
    prime(N,D1).
prime(N):-
    N>1,
    prime(N,2).

