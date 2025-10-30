% Please insert the names and email addresses of the group members:
% Josef Trömer, josef.troemer@uni-potsdam.de
%

subgrid_size(3).

% Hints:
% - For subgrid_size(s), subgrids can be identified by labels 0..s*s-1
% - A cell (x,y) can be mapped to the subgrid labeled (((x-1)/s)*s + (y-1)/s)

% Your implementation please...

% Domain
grid_size(GS) :- subgrid_size(S), GS = S*S.
num(1..GS) :- grid_size(GS).

% Problem encoding
sudoku(X,Y,N) :- initial(X,Y,N).

{ sudoku(X,Y,N) : num(N) } = 1 :- num(X), num(Y), not initial(X,Y,_).

% row constraint
:- num(X), num(Y0), num(Y1), sudoku(X,Y0, N), sudoku(X, Y1, N), Y0 != Y1.
% col contraint
:- num(X0), num(X1), num(Y), sudoku(X0,Y, N), sudoku(X1, Y, N), X0 != X1.

:- sudoku(X0,Y0,N), sudoku(X1,Y1,N), subgrid_size(S), 
   (X0-1)/S == (X1-1)/S, (Y0-1)/S == (Y1-1)/S,
   (X0,Y0) != (X1,Y1).

#show sudoku/3.
