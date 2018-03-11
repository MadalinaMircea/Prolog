%longestSequence(L=list,I=number,Start=number,Len=number,MaxStart=number,
% MaxLen=number,FinalStart=number,FinalLen=number)
% longestSequence flow model (i,i,i,i,i,i,o,o),(i,i,i,i,i,i,i,i)
%
% if I=1, the list was empty to begin with
longestSequence([],1,_,_,_,_,0,0).

% if the list was not empty but it is now, if Len>MaxLen then this is
% the longest sequence
longestSequence([],_,Start,Len,_,MaxLen,Start,Len):-
    Len>MaxLen.

%if Len<=MaxLen, the previous sequence was the longest
longestSequence([],_,_,Len,MaxStart,MaxLen,MaxStart,MaxLen):-
    Len=<MaxLen.

% if we find an odd number and Len>MaxLen, this was the longest sequence
% and MaxStart and MaxLen are modified
longestSequence([H|T],I,Start,Len,_,MaxLen,FinalStart,FinalLen):-
    mod(H,2)=\=0,
    Len>MaxLen,
    longestSequence(T,I+1,I+1,0,Start,Len,FinalStart,FinalLen).

% if we find an off number and Len<=MaxLen, if wasn't the longest
% sequence and MaxStart and MaxLen are not modified
longestSequence([H|T],I,_,Len,MaxStart,MaxLen,FinalStart,FinalLen):-
    mod(H,2)=\=0,
    Len=<MaxLen,
    longestSequence(T,I+1,I+1,0,MaxStart,MaxLen,FinalStart,FinalLen).

%if the head of the list is even, we increment the current length
longestSequence([H|T],I,Start,Len,MaxStart,MaxLen,FinalStart,FinalLen):-
    mod(H,2)=:=0,
    longestSequence(T,I+1,Start,Len+1,MaxStart,MaxLen,FinalStart,FinalLen).

%getSublist(L=list,I=number,Start=number,End=number,RL=list)
%getSublist flow model (i,i,i,i,o),(i,i,i,i,i)
getSublist(_,_,_,1,[]).
getSublist([],_,_,_,[]).
getSublist([H|T],I,Start,End,[H|RT]):-
    I>=Start,
    I<End,
    getSublist(T,I+1,Start,End,RT).
getSublist([_|T],I,Start,End,RL):-
    I<Start,
    getSublist(T,I+1,Start,End,RL).
getSublist(_,I,_,End,[]):-
    I>=End.
longestSequence(L,RL):-
    longestSequence(L,1,1,0,1,0,FinalStart,FinalLen),
    End is FinalStart+FinalLen,
    getSublist(L,1,FinalStart,End,RL).

%replaceSublist(L=list,RL=list)
%replaceSublist flow model (i,o),(i,i)
replaceSublist([],[]).
replaceSublist([H|T],[H|RT]):-
    number(H),
    replaceSublist(T,RT).
replaceSublist([H|T],[L|RT]):-
    is_list(H),
    longestSequence(H,L),
    replaceSublist(T,RT).


testReplaceSublist:-
    replaceSublist([1,2,3],[1,2,3]),
    replaceSublist([1,[1,2],3],[1,[2],3]),
    replaceSublist([],[]),
    replaceSublist([1,[4,2],3,[5],[1,2,6,3],[2]],[1,[4,2],3,[],[2,6],[2]]),
    replaceSublist([1,[2,1,4,6,7],5,[1,2,3,4],2,[1,4,6,8,3],2,[1,5],3],[1,[4,6],5,[2],2,[4,6,8],2,[],3]).









