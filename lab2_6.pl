%product(L-list,D-digit,C-carry,P-product list)
%product flow model (i,i,i,o)
product([],_,_,[]).
product([H|T],D,C,[PH|PT]):-
    product(T,D,C,P1),
    P is H*P1+C,
    P>10,
    PH is mod(P,10),
    C1 is P/10,

