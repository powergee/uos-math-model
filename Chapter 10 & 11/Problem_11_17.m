clear all;

a = 1;
b = 3;
Ya = 1;
Db = -1.2;
n = 50;
pOFx = @(x) 1/x;
qOFx = @(x) 0;
rOFx = @(x) -10;

[x, y] = BVP2ndDriv(a, b, Ya, Db, n, pOFx, qOFx, rOFx);
plot(x, y);
disp(y);