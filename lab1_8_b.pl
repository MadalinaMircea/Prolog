%minElement(L=list,E=number)
%minElement flow model: (i,o), (i,i)
minElement([H],H).
minElement([H|T],E):-minElement(T,E1),
    H>=E1,
    E is E1.
minElement([H|T],E):-minElement(T,E1),
    H<E1,
    E is H.
%removeFirst(L=list,CL=list,OK=bool,RL=list)
%removeFirst flow model: (i,i,i,o),(i,i,i,i)
removeFirst([],_,_,[]).
removeFirst([H|T],CL,OK,[H|RT]):-OK=:=0,
    minElement(CL,X),
    X=\=H,
    removeFirst(T,CL,OK,RT).
removeFirst([H|T],CL,OK,RL):-OK=:=0,
    minElement(CL,H),
    removeFirst(T,CL,1,RL).
removeFirst(L,_,OK,L):-OK=\=0.
removeFirst(L,RL):-removeFirst(L,L,0,RL).
testRemoveFirst :-
    removeFirst([1,2,3],[2,3]),
    removeFirst([54,22,52,66,22,45],[54,52,66,22,45]),
    removeFirst([100],[]),
    removeFirst([0,0,0],[0,0]),
    removeFirst([4,1,0,5,2,0,5,2,4],[4,1,5,2,0,5,2,4]).

















