clear all;

Fun = @(x) x-2*exp(-x);
Xs = SteffensenRoot(Fun, 0.8);
fprintf("A solution is %d\n", Xs);