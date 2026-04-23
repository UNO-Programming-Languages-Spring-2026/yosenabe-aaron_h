{target(X, Y, XX, YY) : area(XX, YY, _)} = 1 :- number(X, Y, _).
% Achieved: Each number is moved to exactly 1 cell

:- target(X, Y, XX, YY), X != XX, Y != YY.
% Achieved: Each number can only move horizontally or vertically, but not both.

:- target(X, Y, X, Y).
% Achieved: Each number has to move from it's starting spot.

:- area(_, _, A), not target(_, _, XX, YY) : area(XX, YY, A).
% Achieved: There cannot be an area with no number targeting it.

occupied(X, Y, OX, YY) :- target(X, Y, XX, YY), OX = X..XX.
occupied(X, Y, OX, YY) :- target(X, Y, XX, YY), OX = XX..X.
% Achieved: The cells a number travels through horizontally and ends at are occupied.

occupied(X, Y, XX, OY) :- target(X, Y, XX, YY), OY = Y..YY.
occupied(X, Y, XX, OY) :- target(X, Y, XX, YY), OY = YY..Y.
% Achieved: The cells a number travels through vertically and ends at are occupied.

:- occupied(X1, Y1, OX, OY), occupied(X2, Y2, OX, OY), (X1, Y1) != (X2, Y2).
% Achieved: No two numbers or their paths can occupy the same cell.
#show target/4.