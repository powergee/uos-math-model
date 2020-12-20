function [x, y] = BVPShootSecant(fOFx, gOFx, hOFx, a, b, n, Ya, Yb, WL, WH)
    wDiff = @(x, w, y) hOFx(x) - fOFx(x)*w - gOFx(x)*y;
    yDiff = @(x, w, y) w;

    [xL, wL, yL] = Sys2ODEsRK4(wDiff, yDiff, a, b, (b-a)/n, WL, Ya);
    if abs(yL(end) - Yb) < 0.001
        x = xL;
        y = yL;
        return;
    end

    [xH, wH, yH] = Sys2ODEsRK4(wDiff, yDiff, a, b, (b-a)/n, WH, Ya);
    if abs(yH(end) - Yb) < 0.001
        x = xH;
        y = yH;
        return;
    end
    
    while true
        WNext = WH - (WL - WH) / (yL(end) - yH(end)) * (yH(end) - Yb);
        [xNext, wNext, yNext] = Sys2ODEsRK4(wDiff, yDiff, a, b, (b-a)/n, WNext, Ya);
        if abs(yNext(end) - Yb) < 0.001
            x = xNext;
            y = yNext;
            break;
        end

        WL = WH;
        WH = WNext;
        yL = yH;
        yH = yNext;
    end
end