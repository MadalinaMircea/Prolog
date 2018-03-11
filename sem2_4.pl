%removeElem(L=list,CL=list,RL=list)
%removeElem flow model: (i,i,o),(i,i,i)
myCount([],_,0).
myCount([H|T],E,R):-H=:=E,
myCount(T,E,R1),
R is R1+1.
myCount([H|T],E,R):-H=\=E,
myCount(T,E,R).
removeElem([],_,[]).
removeElem([H|T],CL,[RH|RT]):-myCount(CL,H,1),
    removeElem(T,CL,[RH|RT]).
removeElem([H|T],CL,[RH|RT]):-myCount(CL,H,X),
    X =\= 1,
    removeElem(T,CL,RT),
    RH is H.
removeMain(L,RL):-removeElem(L,L,RL).
