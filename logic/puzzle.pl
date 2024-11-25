friend(alex).
friend(ben).
friend(carla).
friend(dana).

dept(research).
dept(development).
dept(design).
dept(testing).

lang(python).
lang(java).
lang('c++').
lang(javascript).

project('AI').
project(web).
project(embedded).
project(data).

clues(F,D,L,P):- friend(F),D=design,L=java,project(P).
clues(F,D,L,P):- F=alex,dept(D),lang(L),project(P),D\=development,L\='c++'.
clues(F,D,L,P):- F=ben,dept(D),lang(L),P=web,D\=testing.
clues(F,D,L,P):- F=carla,dept(D),lang(L),project(P),D\=development,P\=embedded.
clues(F,D,L,P):- F=dana,dept(D),lang(L),project(P),L\=java,(D=research; D=testing).
clues(F,D,L,P):- friend(F),dept(D),lang(L),P='AI',D\=research,F\=dana.
clues(F,D,L,P):- friend(F),D=testing,project(P),L=python.
clues(F,D,L,P):- friend(F),D=research,lang(L),P=data,L\=javascript.

diff(A,B,C,D):- A\=B,A\=C,A\=D,B\=C,B\=D,C\=D.

% Main predicate to print the solution
main :- 
    clues(alex,Department1,Language1,Project1),
    clues(ben,Department2,Language2,Project2),
    clues(carla,Department3,Language3,Project3),
    clues(dana,Department4,Language4,Project4),
    diff(Department1,Department2,Department3,Department4),
    diff(Language1,Language2,Language3,Language4),
    diff(Project1,Project2,Project3,Project4),
    write('Alex = ['),write(Department1),write(', '),write(Language1),write(', '),write(Project1),write(']'),nl,
    write('Ben = ['),write(Department2),write(', '),write(Language2),write(', '),write(Project2),write(']'),nl,
    write('Carla = ['),write(Department3),write(', '),write(Language3),write(', '),write(Project3),write(']'),nl,
    write('Dana = ['),write(Department4),write(', '),write(Language4),write(', '),write(Project4),write(']').
    % below print doesnt work
    % write('Alex = [Department1, Language1, Project1]'), nl,
    % write('Ben = [Department2, Language2, Project2]'), nl,
    % write('Carla = [Department3, Language3, Project3]'), nl,
    % write('Dana = [Department4, Language4, Project4]').

% Run the main predicate
?- main.
