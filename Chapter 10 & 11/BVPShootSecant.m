function [x, y] = BVPShootSecant(fOFx, gOFx, hOFx, a, b, n, Ya, Yb, WL, WH)
    wDiff = @(x, w, y) hOFx(x) - fOFx(x)*w - gOFx(x)*y;
    yDiff = @(x, w, y) w;
    
    while true
        [x1, w1, y1] = Sys2ODEsRK4(wDiff, yDiff, a, b, (b-a)/n, WL, Ya);
        if abs(y1(end) - Yb) < 0.001
            x = x1;
            y = y1;
            break;
        end

        [x2, w2, y2] = Sys2ODEsRK4(wDiff, yDiff, a, b, (b-a)/n, WH, Yb);
        if abs(y2(end) - Yb) < 0.001
            x = x2;
            y = y2;
            break;
        end

        WNext = WH - (WL - WH) / (y1(end) - y2(end)) * (y2(end) - Yb);
        [x3, w3, y3] = Sys2ODEsRK4(wDiff, yDiff, a, b, (b-a)/n, WNext, Yb);
        if abs(y3(end) - Yb) < 0.001
            x = x3;
            y = y3;
            break;
        end

        WL = WH;
        WH = WNext;
    end
end