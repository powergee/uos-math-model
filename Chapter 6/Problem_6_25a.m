clear all;

wind = 14:8:46;
power = [320, 490, 540, 500, 480];

fprintf("If W=26, %d\n", CubicLagSplines(wind, power, 26));
fprintf("If W=42, %d\n", CubicLagSplines(wind, power, 42));