clear all;

Fun = @(a) sin(a)/a - 3/4;
Xs = RegulaRoot(Fun, 0.1, 1.4, 0.01);
fprintf("A solution is %d\n", Xs);