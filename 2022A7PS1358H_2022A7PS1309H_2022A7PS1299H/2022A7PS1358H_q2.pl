generate_equation(NumberList,Equation):-
    append(Lnums,Rnums,NumberList),
    Lnums\=[],Rnums\=[],
    make_expr(Lnums,Lexpr,Lval),
    make_expr(Rnums,Rexpr,Rval),
    Lval=:=Rval,
    format(string(Equation),"~w=~w",[Lexpr,Rexpr]).

make_expr([X],X,X).
make_expr(Nums,Expr,Val):-
    append(Lnums,Rnums,Nums),
    Lnums\=[],Rnums\=[],  
    make_expr(Lnums,Lexpr,Lval),
    make_expr(Rnums,Rexpr,Rval), 
    calc(Op,Lval,Rval,Val),
    combine(Op,Lexpr,Rexpr,Expr).

calc(/,A,B,C) :- B\=0,C is A//B, A mod B=:=0.
calc(+,A,B,C) :- C is A+B.
calc(*,A,B,C) :- C is A*B.
calc(-,A,B,C) :- C is A-B.

combine(/,L,R,L/R).
combine(+,L,R,L+R).
combine(*,L,R,L*R).
combine(-,L,R,L-R).