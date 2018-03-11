%getElem(L=list,I=number,P=number,E=number)
%getElem flow model (i,i,i,o),(i,i,i,i)
getElem([H|T],I,P,E):-
    I=:=P,
    E is H.
getElem([H|T],I,P,E):-
    I=\=P,
    I1 is I+1,
    getElem(T,I1,P,E).
getElemMain(L,P,E):-
    getElem(L,1,P,E).
%swap(L=list,I=number,P1=number,E1=number,P2=number,E2=number,RL=list)
%swap flow model (i,i,i,i,i,i,o),(i,i,i,i,i,i,i)
swap([],_,_,_,_,_,[]).
swap([H|T],I,P1,E1,P2,E2,[RH|RT]):-
    I=\=P1,
    I=\=P2,
    swap(T,I+1,P1,E1,P2,E2,RT),
    RH is H.
swap([H|T],I,P1,E1,P2,E2,[RH|RT]):-
    I=:=P1,
    swap(T,I+1,P1,E1,P2,E2,RT),
    RH is E2.
swap([H|T],I,P1,E1,P2,E2,[RH|RT]):-
    I=:=P2,
    swap(T,I+1,P1,E1,P2,E2,RT),
    RH is E1.
swapMain(L,P1,P2,RL):-
    getElemMain(L,P1,E1),
    getElemMain(L,P2,E2),
    swap(L,1,P1,E1,P2,E2,RL).
