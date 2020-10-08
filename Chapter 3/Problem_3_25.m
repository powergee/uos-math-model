clear all;

Fun = @(x) x^4 - 5.5*x^3 - 7.2*x^2 + 43*x + 36;
R = BisecAllRoots(Fun, -10, 10, 0.0001);
fprintf("%d solution(s) was(were) found.\n", numel(R));
for i = 1:numel(R)
    fprintf("%d\n", R(i));
end