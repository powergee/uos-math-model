clear all;

h = 0.25;
ODE = @ (x, y) 1 - y/x;
a = 1;
b = 6;
yINI = 5;

[xNU, yNU] = PreCor(ODE, a, b, h, yINI);

xTR = linspace(a, b);
yTR = xTR./2 + 9./(2.*xTR);

plot(xNU, yNU, '*r', xTR, yTR);

disp(yNU)