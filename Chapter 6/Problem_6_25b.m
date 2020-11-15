clear all;

x = [0, 0.4, 0.8, 1.2, 1.6, 2.0, 2.4, 2.8, 3.2, 3.6, 4.0, 4.4, 4.8, 5.2, 5.6, 6.0];
y = [0, 3.0, 4.5, 5.8, 5.9, 5.8, 6.2, 7.4, 9.6, 15.6, 20.7, 26.7, 31.1, 35.6, 39.3, 41.5];

fprintf("If x=0.2, %d\n", CubicLagSplines(x, y, 0.2));
fprintf("If x=3, %d\n", CubicLagSplines(x, y, 3));