%sublist(L=list,I=number,Start=number,Stop=number,RL=list)
%sublist flow model (i,i,i,i,o),(i,i,i,i,i)
sublist([],_,_,_,[]).
sublist([H|T],I,Start,Stop,[RH|RT]):-
    I>=Start,
    I=<Stop,
    sublist(T,I+1,Start,Stop,RT),
    RH is H.
sublist([H|T],I,Start,Stop,RL):-
    I=<Start,
    sublist(T,I+1,Start,Stop,RL).
sublist([H|T],I,Start,Stop,RL):-
    I>=Stop,
    sublist(T,I+1,Start,Stop,RL).
sublist(L,Start,Stop,RL):-
    sublist(L,1,Start,Stop,RL).
