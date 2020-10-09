clear all;
format long;

Fun = @(x) 0.5 * exp(2+x) - 40;
derFun = @(x) 0.5 * exp(2+x);

trueSol = log(80)-2;
prevNumerSol = NaN;
numerSol = 4;
answerTable = zeros(11, 4);

for i = 1:11
    prevNumerSol = numerSol;
    numerSol = numerSol - Fun(numerSol) / derFun(numerSol);

    TRE = abs((trueSol - numerSol) / trueSol);
    ERE = abs((numerSol - prevNumerSol) / prevNumerSol);

    answerTable(i, 1) = i;
    answerTable(i, 2) = numerSol;
    answerTable(i, 3) = TRE;
    answerTable(i, 4) = ERE;
end

varNames = {'Iteration', 'Numerical Solution', 'TRE', 'ERE'};
T = table(answerTable(:, 1), answerTable(:, 2), answerTable(:, 3), answerTable(:, 4), 'VariableNames', varNames);
disp(T)