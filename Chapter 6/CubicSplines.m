function Yint = CubicSplines(x, y, xint)
    n = length(x);
    mat = zeros(n-2);
    right = zeros(n-2, 1);
    h = zeros(n-1, 1);

    for i = 1:n-1
        h(i) = x(i+1)-x(i);
    end

    for i = 1:n-2
        mat(i, i) = 2*(h(i)+h(i+1));
    end

    for i = 2:n-2
        mat(i-1, i) = h(i);
    end

    for i = 2:n-2
        mat(i, i-1) = h(i);
    end

    for i = 1:n-2
        right(i) = 6*((y(i+2)-y(i+1))/h(i+1) - (y(i+1)-y(i))/h(i));
    end

    a = mat^(-1) * right;

    for i = 1:n-1
        if x(i) <= xint && xint <= x(i+1)
            Yint = a(i-1)/(6*h(i)) * (x(i+1) - xint)^3 + a(i)/(6*h(i)) * (xint - x(i))^3 + (y(i)/h(i) - (a(i-1)*h(i))/6) * (x(i+1)-xint) + (y(i+1)/h(i) - (a(i)*h(i))/6) * (xint - x(i));
            break;
        end
    end
end