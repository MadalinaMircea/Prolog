%myMultiply(L=list,K=number,RL=list)
%myMultiply flow model: (i,i,o),(i,i,i)
myMultiply([],_,[]).
myMultiply([H|T],K,[HR|TR]):-HR is H*K,
    myMultiply(T,K,TR).
