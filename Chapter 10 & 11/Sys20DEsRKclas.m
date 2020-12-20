function [t, x, y] = Sys20DEsRKclas(ODEs, ab, h, INI)
    t = ab(1):h:ab(2);
    x(1) = INI(1);
    y(1) = INI(2);

    for i = 2:length(t)
        [Kx1, Ky1] = ODEs(t(i-1), x(i-1), y(i-1));
        [Kx2, Ky2] = ODEs(t(i), x(i-1)+Kx1*h, y(i-1)+Ky1*h);
        x(i) = x(i-1) + (Kx1+Kx2)*h/2;
        y(i) = y(i-1) + (Ky1+Ky2)*h/2;
    end
end