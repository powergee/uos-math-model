clear all;

fOFx = @(x) 2*x;
gOFx = @(x) 5;
hOFx = @(x) cos(3*x);
a = 0;
b = pi;
n = 100;
Ya = 1.5;
Yb = 0;
WL = -5;
WH = -1.5;

[x, y] = BVPShootSecant(fOFx, gOFx, hOFx, a, b, n, Ya, Yb, WL, WH);
plot(x, y);
disp(y)