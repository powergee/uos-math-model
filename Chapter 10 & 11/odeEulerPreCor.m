function [x, y] = odeEulerPreCor(ODE, a, b, h, yINI)
    x = a:h:b;
    y(1) = yINI;

    for i = 2:length(x)
        yPred = y(i-1)+ODE(x(i-1), y(i-1)*h);
        y(i) = CorrectPrediction(ODE, x(i-1), y(i-1), x(i), yPred);
    end
end

function yCor = CorrectPrediction(ODE, xi, yi, xj, yj)
    yPrev = yj;
    yCurr = yi + (ODE(xi, yi) + ODE(xj, yPrev)) / 2 * (xj - xi);

    while abs((yCurr - yPrev) / yPrev) >= 0.0005
        yNext = yi + (ODE(xi, yi) + ODE(xj, yCurr)) / 2 * (xj - xi);
        yPrev = yCurr;
        yCurr = yNext;
    end

    yCor = yCurr;
end