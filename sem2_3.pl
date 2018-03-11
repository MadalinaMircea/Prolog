%addEnd(L=list,E=number,RL=list)
%addEnd flow model: (i,i,o),(i,i,i)
addEnd([],E,[E]).
addEnd([H|T],E,[HR|TR]):-HR is H,
    addEnd(T,E,TR).
