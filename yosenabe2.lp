{target(X, Y, XX, YY) : area(XX, YY, _)} = 1 :- number(X, Y, _).
% Achieved: Each number is moved to exactly 1 cell

:- target(X, Y, XX, YY), X != XX, Y != YY.
% Achieved: Each number can only move horizontally or vertically, but not both.

:- target(X, Y, X, Y).
% Achieved: Each number has to move from it's starting spot.

:- area(_, _, A), not target(_, _, XX, YY) : area(XX, YY, A).
% Achieved: There cannot be an area with no number targeting it.
#show target/4.