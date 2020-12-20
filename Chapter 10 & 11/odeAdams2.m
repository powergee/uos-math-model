function [x, y] = odeAdams2(ODE, a, b, h, yINI)
    x = a:h:b;
    y(1) = yINI;
    y(2) = getNextByModifiedEuler(ODE, x(1), y(1), h);

    for i = 3:length(x)
        y(i) = y(i-1) + h/2 * (3*ODE(x(i-1), y(i-1)) - ODE(x(i-2), y(i-2)));
    end
end

function y1 = getNextByModifiedEuler(ODE, x0, y0, h)
    slope1 = ODE(x0, y0);
    x1 = x0 + h;
    y1Eu = slope1 * h + y0;
    slope2 = ODE(x1, y1Eu);
    slopeAver = (slope1 + slope2) / 2;
    y1 = slopeAver * h + y0;
end