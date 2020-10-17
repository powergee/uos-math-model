clear all;

a = [2, 1, 4, -2;
    -3, 4, 2, -1;
    3, 5, -2, 1;
    -2, 3, 2, 4];

b = [19; 1; 8; 13];

x = GaussJordan(a, b);
for i = 1:4
    fprintf("x%d = %d\n", i, x(i));
end