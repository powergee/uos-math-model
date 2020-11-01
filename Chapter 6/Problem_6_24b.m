clear all;

x = 5:2.5:30;
h = [3.3, 7.5, 41.8, 51.8, 61, 101.1, 132.9, 145.5, 171.4, 225.8, 260.9];

fprintf("If T=14000K, %d\n", CubicSplines(x, h, 14));
fprintf("If T=24000K, %d\n", CubicSplines(x, h, 24));