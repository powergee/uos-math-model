clear all;

T = [-40, -20, 0, 20, 40];
W = [0.0012, 0.002, 0.0032, 0.006, 0.0118];

[b, m] = ExpoFit(T, W);
fprintf("b = %d, m = %d\n", b, m);
fprintf("Fitted Curve: y = %d e^(%dx)\n", b, m);
fprintf("If T = 10, W = %d\n", b * exp(m * 10));

plot(T, W, 'o');
hold on;

denseT = -50:0.5:50;
denseW = b * exp(m * denseT);
plot(denseT, denseW);