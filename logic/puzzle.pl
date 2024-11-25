friend(alex).
friend(ben).
friend(carla).
friend(dana).

dept(research).
dept(development).
dept(testing).
dept(design).

lang(python).
lang(java).
lang('c++').
lang(javascript).

project('AI').
project(web).
project(embedded).
project(data).

clue(F,D,L,P):-
    (P='AI'->F\=dana,D\=research; true),
    (F=alex->D\=development,L\='c++'; true),
    (D=testing->L=python; true),
    (F=ben->P=web,D\=testing; true),
    (L=java->D=design; true),
    (F=carla->P\=embedded,D\=development; true),
    (F=dana->L\=java,(D=research; D=testing); true),
    (P=data->D=research,L\=javascript; true).

diff(A,B,C,D):- A\=B, A\=C, A\=D, B\=C, B\=D, C\=D.

% Main predicate to print the solution
main :- 
    dept(D1), dept(D2), dept(D3), dept(D4),
    lang(L1), lang(L2), lang(L3), lang(L4),
    project(P1), project(P2), project(P3), project(P4),

    diff(D1,D2,D3,D4),
    diff(L1,L2,L3,L4),
    diff(P1,P2,P3,P4),

    clue(alex,D1,L1,P1),
    clue(ben,D2,L2,P2),
    clue(carla,D3,L3,P3),
    clue(dana,D4,L4,P4),

    write('Alex = ['), write(D1), write(', '), write(L1), write(', '), write(P1), write(']'), nl,
    write('Ben = ['), write(D2), write(', '), write(L2), write(', '), write(P2), write(']'), nl,
    write('Carla = ['), write(D3), write(', '), write(L3), write(', '), write(P3), write(']'), nl,
    write('Dana = ['), write(D4), write(', '), write(L4), write(', '), write(P4), write(']'), nl.

% Run the main predicate
?- main.