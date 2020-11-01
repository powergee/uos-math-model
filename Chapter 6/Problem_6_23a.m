clear all;

x = [0, 0.4, 0.8, 1.2, 1.6, 2.0, 2.4, 2.8, 3.2, 3.6, 4.0, 4.4, 4.8, 5.2, 5.6, 6.0];
y = [0, 3.0, 4.5, 5.8, 5.9, 5.8, 6.2, 7.4, 9.6, 15.6, 20.7, 26.7, 31.1, 35.6, 39.3, 41.5];

[a, Er] = CubicPolyFit(x, y);
fprintf("a^3: %d\n", a(1));
fprintf("a^2: %d\n", a(2));
fprintf("a^1: %d\n", a(3));
fprintf("a^0: %d\n", a(4));
fprintf("Error: %d\n", Er);