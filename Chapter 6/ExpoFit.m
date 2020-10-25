function [b, m] = ExpoFit(x, y)
    lny = log(y);
    xLength = length(x);

    Sx = sum(x);
    Sy = sum(lny);
    Sxy = sum(x.*lny);
    Sxx = sum(x.^2);
    m = (xLength*Sxy - Sx*Sy) / (xLength*Sxx - Sx^2);
    lnb = (Sxx*Sy - Sxy*Sx) / (xLength*Sxx - Sx^2);
    b = exp(lnb);
end