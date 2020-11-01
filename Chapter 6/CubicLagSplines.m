function Yint = CubicLagSplines(x, y, xint)
    n = length(x);

    for i = 1:n-1
        if x(i) <= xint && xint <= x(i+1)
            if i == 1
                Yint = LagInt(x(1:3), y(1:3), xint);
            elseif i == n-1
                Yint = LagInt(x(n-2:n), y(n-2:n), xint);
            else
                Yint = LagInt(x(i-1:i+2), y(i-1:i+2),xint);
            end
            break;
        end
    end
end

function Yint = LagInt(x, y, xint)
    n = length(x);
    Yint = 0;
    for i = 1:n
        Yint = Yint + y(i) * LagFunction(i, x, xint);
    end
end

function Lag = LagFunction(i, x, xint)
    Lag = 1;
    n = length(x);

    for j = 1:n
        if i == j
            continue;
        end
        Lag = Lag * (xint - x(j)) / (x(i) - x(j));
    end
end