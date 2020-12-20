clear all;

h = 0.1;
ODE = @ (x, y) y + x^3;
a = 0;
b = 1.5;
yINI = 1;

[xNU, yNU] = odeEulerPreCor(ODE, a, b, h, yINI);

xTR = linspace(a, b);
yTR = 7*exp(xTR) - xTR.^3 - 3*xTR.^2 - 6*xTR - 6;

plot(xNU, yNU, '*r', xTR, yTR);

disp(yNU)