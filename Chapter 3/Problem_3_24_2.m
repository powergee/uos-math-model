clear all;

Fun = @(a) sin(a)/a - 3/4;
Xs = SteffensenRoot(Fun, 1.2);
fprintf("A solution is %d\n", Xs);