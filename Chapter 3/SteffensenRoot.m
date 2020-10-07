function Xs = SteffensenRoot(Fun, Xest)
    prevXs = Xest;

    for i = 1:100
        Xs = prevXs - (Fun(prevXs)^2) / (Fun(prevXs+Fun(prevXs)) - Fun(prevXs));
        
        if ~isnan(prevXs)
            % Estimated Relative Error를 계산하고, Xs를 이번에 구한 Xs로 갱신한다.
            estRelErr = abs((Xs - prevXs) / prevXs);

            % estRelErr가 ErrMax 범위 내라면 반복을 중단한다.
            if estRelErr <= 10^-6
                break;
            end
        end
        
        prevXs = Xs;
    end

    if i == 100
        disp('Error: Solution was not obtained in 100 iterations.')
        Xs = ('Unable to find a solution');
    end
end