clear all;

Fun = @(a) sin(a)/a - 3/4;
Xs = BiRegRoot(Fun, 0.1, 1.4, 0.00001);
fprintf("A solution is %d\n", Xs);