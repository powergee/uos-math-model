clear all;

Fun = @(x) 0.5 * exp(2+x) - 40;
derFun = @(x) 0.5 * exp(2+x);

trueSol = log(80)-2;
prevNumerSol = NaN;
numerSol = 4;

for i = 1:11
    prevNumerSol = numerSol;
    numerSol = numerSol - Fun(numerSol) / derFun(numerSol);
end

TRE = abs((trueSol - numerSol) / trueSol);
ERE = abs((numerSol - prevNumerSol) / prevNumerSol);

fprintf("%d, %d\n", TRE, ERE);