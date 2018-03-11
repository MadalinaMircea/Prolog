%myCount(L=list,E=number,R=number)
%myCount flow model: (i,i,o),(i,i,i)
myCount([],_,0).
myCount([H|T],E,R):-H=:=E,
myCount(T,E,R1),
R is R1+1.
myCount([H|T],E,R):-H=\=E,
myCount(T,E,R).
