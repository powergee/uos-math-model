function [x, y] = PreCor(ODE, a, b, h, yINI)
    x = a:h:b;
    y(1) = yINI;

    % First step: Euler predictor-corrector
    yPred = y(1)+ODE(x(1), y(1)*h);
    y(2) = CorrectPredByEuler(ODE, x(1), y(1), x(2), yPred);

    % Following steps: Adams-Bashforth and Adams-Moulton predictor-corrector
    for i = 3:length(x)
        if i == 3
            yPred = y(i-1)+ODE(x(i-1), y(i-1)*h);
        else
            yPred = y(i-1) + h/12 * (23*ODE(x(i-1), y(i-1)) - 16*ODE(x(i-2), y(i-2)) + 5*ODE(x(i-3), y(i-3)));
        end
        y(i) = CorrectPredByAdams(ODE, x(i-2), y(i-2), x(i-1), y(i-1), x(i), yPred);
    end
end

function yCor = CorrectPredByEuler(ODE, xi, yi, xj, yj)
    yPrev = yj;
    yCurr = yi + (ODE(xi, yi) + ODE(xj, yPrev)) / 2 * (xj - xi);

    while abs((yCurr - yPrev) / yPrev) > 0.00001
        yNext = yi + (ODE(xi, yi) + ODE(xj, yCurr)) / 2 * (xj - xi);
        yPrev = yCurr;
        yCurr = yNext;
    end

    yCor = yCurr;
end

function yCor = CorrectPredByAdams(ODE, xi, yi, xj, yj, xk, yk)
    yPrev = yk;
    yCurr = yj + (xj - xi)/12 * (5*ODE(xk, yPrev) + 8*ODE(xj, yj) - ODE(xi, yi));

    while abs((yCurr - yPrev) / yPrev) > 0.00001
        yNext = yj + (xj - xi)/12 * (5*ODE(xk, yCurr) + 8*ODE(xj, yj) - ODE(xi, yi));
        yPrev = yCurr;
        yCurr = yNext;
    end

    yCor = yCurr;
end