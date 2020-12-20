clear all;

ab = [0, 1.5];
h = 0.05;
INI = [1, 0];

[xNU, wNU, yNU] = Sys20DEsRKclas(@ODEs, ab, h, INI);

xTR = linspace(ab(1), ab(2));
yTR = (exp(3*xTR) - cos(xTR) + 7*sin(xTR)) / 10;

figure(1);
title('The figure of y vs x');
plot(xNU, yNU);

figure(2);
title('The comparison between solutions');
plot(xNU, yNU, '*r', xTR, yTR);

function [wDiff, yDiff] = ODEs(x, w, y)
    wDiff = exp(3*x)-y;
    yDiff = w;
end