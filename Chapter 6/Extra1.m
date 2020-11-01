clear all;

wind = 14:8:46;
power = [320, 490, 540, 500, 480];

fprintf("If W=26, %d\n", QuadSplines3x3(wind, power, 26));
fprintf("If W=42, %d\n", QuadSplines3x3(wind, power, 42));

function Yint = QuadSplines3x3(x, y, xint)
    n = length(x);
    a = 0;
    b = (y(2)-y(1))/(x(2)-x(1));
    c = -(y(2)-y(1))/(x(2)-x(1)) * x(1) + y(1);

    for i = 2:n-1
        if x(i-1) <= xint && xint <= x(i)
            break;
        end

        mat = [0, 2*x(i), b; x(i)^2, x(i), 1; x(i+1)^2, x(i+1), 1];
        right = [2*a*x(i) + b; y(i); y(i+1)];
        coef = mat^(-1) * right;
        a = coef(1);
        b = coef(2);
        c = coef(3);
    end

    Yint = a*xint^2 + b*xint + c;
end