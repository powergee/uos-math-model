function [x, y] = BVP2ndDriv(a, b, Ya, Db, n, pOFx, qOFx, rOFx)
    h = (b-a)/n;
    x = a:h:b;
    A = zeros(n+1, n+1);
    R = zeros(n+1, 1);
    A(1, 1) = 1;
    R(1, 1) = Ya;
    for i = 2:n
        A(i, i-1) = 1/(h^2) - pOFx(x(i))/(2*h);
        A(i, i) = -2/(h^2) + qOFx(x(i));
        A(i, i+1) = 1/(h^2) + pOFx(x(i))/(2*h);
        R(i, 1) = rOFx(x(i));
    end
    A(n+1, n) = -1/h;
    A(n+1, n+1) = 1/h;
    R(n+1, 1) = Db;
    y = (A\R)';
end