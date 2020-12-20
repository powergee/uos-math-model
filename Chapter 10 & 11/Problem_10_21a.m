clear all;

ab = [0, 1.2];
h = 0.1;
INI = [1, 1];

[tNU, xNU, yNU] = Sys20DEsRKclas(@ODEs, ab, h, INI);

tTR = linspace(ab(1), ab(2));
xTR = 4*exp(tTR) - tTR.^2.*exp(tTR) - tTR.^2 - 3*tTR - 3;
yTR = 2*exp(tTR) - tTR - 1;

figure(1);
title('The figure of x');
plot(tNU, xNU, '*r', tTR, xTR);

figure(2);
title('The figure of y');
plot(tNU, yNU, '*r', tTR, yTR);

function [xDiff, yDiff] = ODEs(t, x, y)
    xDiff = x-y*t;
    yDiff = t+y;
end